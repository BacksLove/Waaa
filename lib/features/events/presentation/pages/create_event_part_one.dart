import 'dart:io';

import 'package:country_state_city_picker/country_state_city_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ionicons/ionicons.dart';
import 'package:waaa/component/date_picker.dart';
import 'package:waaa/component/dropdown.dart';
import 'package:waaa/component/form_textfield.dart';
import 'package:waaa/component/toggle_button.dart';
import 'package:waaa/core/constants/spacer.dart';
import 'package:waaa/core/theme/colors.dart';
import 'package:waaa/core/theme/common_widget/button.dart';
import 'package:waaa/core/theme/text_styles.dart';
import 'package:waaa/core/util/localized.dart';
import 'package:waaa/core/util/mocks/events.dart';
import 'package:waaa/features/events/presentation/manager/bloc/create_event/create_event_bloc.dart';

class CreateEventPartOne extends StatelessWidget {
  const CreateEventPartOne({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final CreateEventBloc createEventBloc = context.read<CreateEventBloc>();

    TextEditingController titleController = TextEditingController();
    TextEditingController adressController = TextEditingController();
    TextEditingController startDateController = TextEditingController();
    TextEditingController endDateController = TextEditingController();
    bool isPublic = false;
    String nbGuests = "";

    return BlocBuilder<CreateEventBloc, CreateEventState>(
      builder: (context, state) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            WaaaTextField(
              controller: titleController,
              label: localized(context).name_of_the_event,
              isColored: true,
            ),
            vSpace20,
            GestureDetector(
              onTap: () {
                createEventBloc.add(
                    const OpenEventImagePicker(source: ImageSource.gallery));
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
                          const Icon(FeatherIcons.image),
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
            WaaaToggleButton(
              trueText: localized(context).private_event,
              falseText: localized(context).public_event,
              onChanged: (value) {
                isPublic = value;
              },
            ),
            vSpace20,
            WaaaDropdownWidget(
              labelText: localized(context).theme,
              items: state.eventTopic.map((e) => e?.name).toList(),
              onChanged: (value) {
                if (value != null) {
                  context
                      .read<CreateEventBloc>()
                      .add(ChooseThemeEvent(theme: value));
                }
              },
              selectedItem: null,
            ),
            vSpace20,
            WaaaTextField(
              controller: adressController,
              label: localized(context).event_adress,
              suffixIcon: Ionicons.location,
            ),
            vSpace20,
            SelectState(
              onCountryChanged: (value) {
                context
                    .read<CreateEventBloc>()
                    .add(CountrySelectedEvent(country: value));
              },
              onStateChanged: (value) {},
              onCityChanged: (value) {
                context
                    .read<CreateEventBloc>()
                    .add(CountrySelectedEvent(country: value));
              },
            ),
            vSpace20,
            WaaaDateTimeFieldPicker(
              label: localized(context).start_date_and_time,
              onSelectedDate: (DateTime value) {
                startDateController.text = value.toString();
              },
            ),
            vSpace20,
            WaaaDateTimeFieldPicker(
              label: localized(context).end_date_and_time,
              onSelectedDate: (DateTime value) {
                endDateController.text = value.toString();
              },
            ),
            vSpace20,
            WaaaDropdownWidget(
              labelText: localized(context).number_of_people,
              items: mockEventNumberParticipation,
              onChanged: (value) {
                if (value != null) {
                  nbGuests = value;
                }
              },
              selectedItem: null,
            ),
            vSpace20,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width / 2.3,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50.0),
                    color: lightPrimaryColor,
                  ),
                  height: 5.0,
                ),
                hSpace15,
                Container(
                  width: MediaQuery.of(context).size.width / 2.3,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50.0),
                    color: lightGrayColor,
                  ),
                  height: 5.0,
                ),
              ],
            ),
            vSpace20,
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 45,
                  width: MediaQuery.of(context).size.width / 2.2,
                  child: ElevatedButton(
                    style: primaryButton,
                    onPressed: () {
                      context.read<CreateEventBloc>().add(
                            ToNextEventStepPressed(
                              title: titleController.text,
                              isPublic: isPublic,
                              address: adressController.text,
                              beginDateTime: startDateController.text,
                              endDateTime: endDateController.text,
                              nbParticipate: nbGuests,
                            ),
                          );
                    },
                    child: Text(
                      localized(context).next,
                      style: boldTextStyle12,
                    ),
                  ),
                ),
              ],
            ),
            vSpace20,
          ],
        );
      },
    );
  }
}
