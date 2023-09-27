import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionicons/ionicons.dart';
import 'package:waaa/core/constants/spacer.dart';
import 'package:waaa/core/theme/colors.dart';
import 'package:waaa/core/theme/common_widget/button.dart';
import 'package:waaa/core/theme/text_styles.dart';
import 'package:waaa/core/util/input_converter.dart';
import 'package:waaa/core/util/localized.dart';
import 'package:waaa/features/trips/presentation/bloc/photo_step_bloc.dart';
import 'package:waaa/features/trips/presentation/widgets/fil_arrianne_trips.dart';
import 'package:waaa/models/ModelProvider.dart' as mp;

class PhotoStepPage extends StatelessWidget {
  const PhotoStepPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PhotoStepBloc, PhotoStepState>(
      builder: (context, state) {
        return const PhotoStepView();
      },
    );
  }
}

class PhotoStepView extends StatelessWidget {
  const PhotoStepView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PhotoStepBloc, PhotoStepState>(
      builder: (context, state) {
        return SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const FilArianeTrips(currentStep: 1),
              vSpace20,
              TripsCard(
                currentStep: state.currentDestination,
                status: state.destinationDateStatus.name,
              ),
              vSpace20,
              GestureDetector(
                onTap: () {
                  context.read<PhotoStepBloc>().add(OpenEventImagePicker());
                },
                child: Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    border: Border.all(
                      style: BorderStyle.solid,
                      color: lightGrayColor,
                    ),
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Ionicons.image),
                      hSpace10,
                      Text(localized(context).add_cover_photo),
                    ],
                  ),
                ),
              ),
              vSpace20,
              if (state.photoPath.isNotEmpty)
                SizedBox(
                  height: 400,
                  child: GridView.count(
                    scrollDirection: Axis.horizontal,
                    crossAxisCount: 2,
                    children: [
                      for (var photo in state.photoPath) ...{
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: 150,
                            width: 150,
                            decoration: BoxDecoration(
                                border: Border.all(
                                  style: BorderStyle.solid,
                                  color: grayColor,
                                ),
                                borderRadius: BorderRadius.circular(15),
                                color: primaryColor),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Image.file(
                                File(photo),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      }
                    ],
                  ),
                ),
              vSpace40,
              SizedBox(
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: Text(localized(context).back),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 2.2,
                      child: ElevatedButton(
                        style: primaryButton,
                        onPressed: () {
                          context
                              .read<PhotoStepBloc>()
                              .add(OnNextPressedEvent());
                        },
                        child: Text(
                          localized(context).next,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class TripsCard extends StatelessWidget {
  const TripsCard({super.key, required this.currentStep, required this.status});

  final mp.Step currentStep;
  final String status;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: lightPrimaryColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  "Voyage en ${currentStep.country}",
                  style: boldTextStyle20,
                ),
                const Spacer(),
                Container(
                  color: Colors.amber,
                  child: Text(
                    status,
                    style: semiBoldTextStyle12,
                  ),
                )
              ],
            ),
            Text(
              "Départ le ${DateConverter().dateToDateString(currentStep.begin!.getDateTime())}",
              style: semiBoldTextStyle18,
            ),
            vSpace30,
            SizedBox(
              height: 50,
              child: Row(
                children: [
                  Icon(
                    Ionicons.location,
                    color: Colors.pink[700],
                  ),
                  hSpace5,
                  Text(
                    "${currentStep.country}, ${currentStep.city}",
                    style: regularTextStyle16,
                  ),
                  const Spacer(),
                  Icon(
                    Ionicons.calendar,
                    color: Colors.pink[700],
                  ),
                  hSpace5,
                  Text(
                    "${currentStep.nbDays} jours",
                    style: regularTextStyle16,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
