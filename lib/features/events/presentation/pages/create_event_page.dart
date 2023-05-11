import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:image_picker/image_picker.dart';
import 'package:waaa/component/date_picker.dart';
import 'package:waaa/component/snack_bar.dart';
import 'package:waaa/core/constants/spacer.dart';
import 'package:waaa/core/enums/event_enum.dart';
import 'package:waaa/core/theme/colors.dart';
import 'package:waaa/core/theme/text_styles.dart';
import 'package:waaa/core/util/localized.dart';
import 'package:waaa/features/events/presentation/manager/bloc/event_detail_bloc.dart';

import '../../../../component/dropdown.dart';
import '../../../../component/form_textfield.dart';
import '../../../../component/toggle_button.dart';
import '../../../../core/theme/common_widget/button.dart';
import '../../../../core/util/mocks/events.dart';

import 'package:waaa/injection_container.dart' as di;
import 'package:waaa/core/route/routes.dart' as route;

class CreateEventPage extends StatelessWidget {
  const CreateEventPage({super.key});

  @override
  Widget build(BuildContext context) {
    final EventDetailBloc eventDetailBloc = di.sl<EventDetailBloc>();

    return BlocProvider(
      create: (context) => eventDetailBloc,
      child: BlocListener<EventDetailBloc, EventDetailState>(
        listener: (context, state) {
          if (state.step == CreateEventStep.partTwo) {
            Navigator.pushNamed(context, route.createEventTwoPage);
          }
          if (state.errorMessage != null) {
            showSnackBar(context, state.errorMessage!);
          }
        },
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              localized(context).create_an_event,
              style: appBarTextStyle,
            ),
            leading: IconButton(
              icon: const Icon(FeatherIcons.x),
              color: blackColor,
              onPressed: () => Navigator.pop(context),
            ),
            backgroundColor: transparentColor,
            elevation: 0,
          ),
          body: const SingleChildScrollView(
            padding: EdgeInsets.all(15.0),
            child: CreateEventPartOne(),
          ),
        ),
      ),
    );
  }
}

class CreateEventPartOne extends StatelessWidget {
  const CreateEventPartOne({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final EventDetailBloc eventDetailBloc = di.sl<EventDetailBloc>();

    TextEditingController titleController = TextEditingController();
    TextEditingController adressController = TextEditingController();
    TextEditingController startDateController = TextEditingController();
    TextEditingController endDateController = TextEditingController();
    bool isPublic = false;
    String chosenTheme = "";
    String nbGuests = "";

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
            eventDetailBloc
                .add(const OpenEventImagePicker(source: ImageSource.gallery));
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
            child: BlocBuilder<EventDetailBloc, EventDetailState>(
              builder: (context, state) {
                if (state.photoFile == null) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(FeatherIcons.image),
                      hSpace10,
                      Text(localized(context).add_cover_photo),
                    ],
                  );
                } else {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Image.file(
                      File(state.photoPath),
                      fit: BoxFit.cover,
                    ),
                  );
                }
              },
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
          items: mockEventType,
          onChanged: (value) {
            if (value != null) {
              chosenTheme = value;
            }
          },
          selectedItem: null,
        ),
        vSpace20,
        WaaaTextField(
          controller: adressController,
          label: localized(context).event_adress,
          icondata: FeatherIcons.mapPin,
        ),
        vSpace20,
        WaaaDatePicker(
            controller: startDateController,
            label: localized(context).start_date_and_time),
        vSpace20,
        WaaaDatePicker(
            controller: endDateController,
            label: localized(context).end_date_and_time),
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
                  eventDetailBloc.add(
                    ToNextEventStepPressed(
                        title: titleController.text,
                        isPublic: isPublic,
                        theme: chosenTheme,
                        address: adressController.text,
                        beginDateTime: startDateController.text,
                        endDateTime: endDateController.text,
                        nbParticipate: nbGuests),
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
  }
}
