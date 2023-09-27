import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionicons/ionicons.dart';
import 'package:waaa/component/form_textfield.dart';
import 'package:waaa/core/constants/spacer.dart';
import 'package:waaa/core/theme/colors.dart';
import 'package:waaa/core/theme/common_widget/button.dart';
import 'package:waaa/core/util/localized.dart';
import 'package:waaa/features/trips/presentation/bloc/travel_step_bloc.dart';
import 'package:waaa/features/trips/presentation/widgets/fil_arrianne_trips.dart';

class TravelStepView extends StatelessWidget {
  const TravelStepView({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController titleController = TextEditingController();
    TextEditingController descriptionController = TextEditingController();

    return BlocBuilder<TravelStepBloc, TravelStepState>(
      builder: (context, state) {
        titleController.text = state.tripName;
        descriptionController.text = state.tripDescription;
        return Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const FilArianeTrips(currentStep: 0),
            vSpace40,
            GestureDetector(
              onTap: () {
                context.read<TravelStepBloc>().add(OpenEventImagePicker());
              },
              child: Container(
                height: 140,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  border: Border.all(
                    style: BorderStyle.solid,
                    color: lightGrayColor,
                  ),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: (state.photoFile == null)
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Ionicons.image),
                          hSpace10,
                          Text(localized(context).add_cover_photo),
                        ],
                      )
                    : ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: Image.file(
                          File(state.photoPath),
                          fit: BoxFit.cover,
                        ),
                      ),
              ),
            ),
            vSpace20,
            WaaaTextField(
              controller: titleController,
              label: localized(context).name_of_your_route,
              isColored: true,
            ),
            vSpace20,
            SizedBox(
              child: TextField(
                controller: descriptionController,
                textAlign: TextAlign.start,
                decoration: InputDecoration(
                  labelText: localized(context).description,
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: lightGrayColor),
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
                maxLines: 5,
                keyboardType: TextInputType.multiline,
              ),
            ),
            const Spacer(),
            SizedBox(
              width: MediaQuery.of(context).size.width / 2.2,
              child: ElevatedButton(
                style: primaryButton,
                onPressed: () {
                  context.read<TravelStepBloc>().add(ToTheNextScreenEvent(
                      tripName: titleController.text,
                      tripDescription: descriptionController.text));
                },
                child: Text(
                  localized(context).next,
                ),
              ),
            )
          ],
        );
      },
    );
  }
}
