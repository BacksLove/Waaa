import 'dart:io';

import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:image_picker/image_picker.dart';
import 'package:waaa/component/chip_list.dart';
import 'package:waaa/component/date_picker.dart';
import 'package:waaa/component/search_field.dart';
import 'package:waaa/component/snack_bar.dart';
import 'package:waaa/core/constants/spacer.dart';
import 'package:waaa/core/enums/event_enum.dart';
import 'package:waaa/core/theme/colors.dart';
import 'package:waaa/core/theme/text_styles.dart';
import 'package:waaa/core/util/localized.dart';
import 'package:waaa/core/util/mocks/users.dart';
import 'package:waaa/features/events/presentation/manager/bloc/create_event/create_event_bloc.dart';
import 'package:waaa/features/events/presentation/widgets/event_edit_view.dart';
import 'package:waaa/models/User.dart';

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
    final CreateEventBloc createEventBloc = di.sl<CreateEventBloc>();

    return BlocProvider(
      create: (context) => createEventBloc..add(CreateEventLoadData()),
      child: BlocConsumer<CreateEventBloc, CreateEventState>(
        listener: (context, state) {
          if (state.errorMessage != null) {
            showSnackBar(context, state.errorMessage!);
          }
        },
        builder: (context, state) {
          return Scaffold(
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
            body: SingleChildScrollView(
              padding: const EdgeInsets.all(15.0),
              child: (state.step == CreateEventStep.partOne)
                  ? const CreateEventPartOne()
                  : const CreateEventPartTwo(),
            ),
          );
        },
      ),
    );
  }
}

class CreateEventPartTwo extends StatelessWidget {
  const CreateEventPartTwo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final CreateEventBloc createEventBloc = context.read<CreateEventBloc>();

    TextEditingController descriptionController = TextEditingController();
    TextEditingController inviteGuestController = TextEditingController();
    List<User> coorganizers = [];
    List<User> guests = [];
    bool isVisible = true;
    bool guestCanInvite = true;

    return BlocBuilder<CreateEventBloc, CreateEventState>(
      builder: (context, state) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton.icon(
              style: outlinedPrimaryButton,
              onPressed: () {},
              icon: Icon(
                FeatherIcons.plusCircle,
                color: lightPrimaryColor,
              ),
              label: Text(
                localized(context).add_coorganizer,
                style: regularTextStyle16,
              ),
            ),
            vSpace20,
            SearchUserList(
              users: mockUsersList,
              onDelete: (User value) {
                safePrint("delete ${value.username}");
              },
            ),
            vSpace20,
            Text(
              localized(context).invite_guests,
              style: semiBoldTextStyle16,
            ),
            vSpace20,
            WaaaUserSearchField(
              userController: inviteGuestController,
              userList: mockUsersList,
              callback: (p0) {
                safePrint("coté screen = ${p0.username}");
              },
            ),
            vSpace20,
            SearchUserList(
              users: mockUsersList,
              onDelete: (User value) {
                safePrint("delete ${value.username}");
              },
            ),
            vSpace20,
            Text(
              "Voir moins",
              textAlign: TextAlign.center,
              style: lightPrimarySemiBoldTextStyle12,
            ),
            vSpace20,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  localized(context).guests_can_invite,
                  style: semiBoldTextStyle16,
                ),
                Switch(value: true, onChanged: (value) {})
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  localized(context).guests_can_invite,
                  style: semiBoldTextStyle16,
                ),
                Switch(
                  value: guestCanInvite,
                  onChanged: (value) {
                    guestCanInvite = value;
                  },
                )
              ],
            ),
            vSpace20,
            Text(
              localized(context).description,
              style: semiBoldTextStyle16,
            ),
            vSpace10,
            SizedBox(
              height: 160,
              child: TextField(
                controller: descriptionController,
                decoration: InputDecoration(
                    hintText: localized(context).description__1,
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: lightGrayColor),
                    )),
                maxLines: null,
                expands: true,
                keyboardType: TextInputType.multiline,
              ),
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
                    color: lightPrimaryColor,
                  ),
                  height: 5.0,
                ),
              ],
            ),
            vSpace20,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 45,
                  width: MediaQuery.of(context).size.width / 4,
                  child: TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      localized(context).cancel,
                    ),
                  ),
                ),
                hSpace15,
                SizedBox(
                  height: 45,
                  width: MediaQuery.of(context).size.width / 2.2,
                  child: ElevatedButton(
                    style: primaryButton,
                    onPressed: () {
                      // TODO: Validate
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
    String chosenTheme = "";
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
                  chosenTheme = value;
                }
              },
              selectedItem: null,
            ),
            vSpace20,
            WaaaTextField(
              controller: adressController,
              label: localized(context).event_adress,
              suffixIcon: FeatherIcons.mapPin,
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
                      createEventBloc.add(
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
      },
    );
  }
}
