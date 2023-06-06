import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:waaa/component/circle_avatar.dart';
import 'package:waaa/component/date_picker.dart';
import 'package:waaa/component/dropdown.dart';
import 'package:waaa/component/form_textfield.dart';
import 'package:waaa/component/search_field.dart';
import 'package:waaa/component/toggle_button.dart';
import 'package:waaa/core/constants/spacer.dart';
import 'package:waaa/core/theme/colors.dart';
import 'package:waaa/core/theme/common_widget/button.dart';
import 'package:waaa/core/theme/text_styles.dart';
import 'package:waaa/core/util/localized.dart';
import 'package:waaa/core/util/mocks/users.dart';
import 'package:waaa/features/home/presentation/widgets/user_carrousel.dart';
import 'package:waaa/models/Event.dart';
import 'package:waaa/models/User.dart';

class EditEvent extends StatelessWidget {
  const EditEvent({super.key, required this.currentEvent});

  final Event currentEvent;

  @override
  Widget build(BuildContext context) {
    final List<String> dropdownMock = [
      "Festif",
      "Restaurant",
      "Concert",
      "Visite"
    ];

    final List<String> dropdownMockNumber = [
      "0 - 10",
      "10 - 50",
      "50 - 100",
      "+ 100"
    ];

    TextEditingController debutDateController = TextEditingController();
    TextEditingController endDateController = TextEditingController();
    TextEditingController addressController = TextEditingController();
    TextEditingController titleController = TextEditingController();
    TextEditingController inviteGuestController = TextEditingController();
    TextEditingController descriptionController = TextEditingController();

    titleController.text = currentEvent.name;
    debutDateController.text = currentEvent.begin.toString();
    endDateController.text = currentEvent.end.toString();
    addressController.text = currentEvent.address ?? "";

    return SliverPadding(
      padding: const EdgeInsets.all(15),
      sliver: SliverList(
        delegate: SliverChildListDelegate(
          [
            vSpace10,
            WaaaTextField(
              controller: titleController,
              label: localized(context).name_of_the_event,
              isColored: true,
            ),
            vSpace20,
            WaaaToggleButton(
                trueText: localized(context).public_event,
                falseText: localized(context).private_event,
                onChanged: (value) {}),
            vSpace20,
            WaaaDropdownWidget(
              labelText: localized(context).theme,
              items: dropdownMock,
              selectedItem: dropdownMock.first,
              onChanged: (value) {},
            ),
            vSpace20,
            WaaaTextField(
              controller: addressController,
              label: localized(context).name_of_the_event,
              suffixIcon: Ionicons.location,
            ),
            vSpace20,
            WaaaDatePicker(
              controller: debutDateController,
              label: localized(context).start_date_and_time,
            ),
            vSpace20,
            WaaaDatePicker(
              controller: endDateController,
              label: localized(context).end_date_and_time,
            ),
            vSpace20,
            WaaaDropdownWidget(
              labelText: localized(context).number_of_people,
              items: dropdownMockNumber,
              selectedItem: dropdownMockNumber.first,
              onChanged: (value) {},
            ),
            vSpace20,
            // Organisateur
            Text(
              localized(context).coorganizers,
              style: boldTextStyle18,
            ),
            vSpace10,
            CoorganizerCarrousel(
                coowners: currentEvent.coowner, withName: true),
            SizedBox(
              height: 45,
              child: ElevatedButton.icon(
                style: outlinedPrimaryButton,
                onPressed: () {},
                icon: Icon(
                  Ionicons.add_circle,
                  color: lightPrimaryColor,
                ),
                label: Text(
                  localized(context).add_coorganizer,
                  style: regularTextStyle16,
                ),
              ),
            ),
            Expanded(
              child: SearchUserList(
                users: [],
                onDelete: (User value) {},
              ),
            ),
            vSpace20,
            // Convives
            Text(
              localized(context).invite_guests,
              style: boldTextStyle18,
            ),
            vSpace20,
            WaaaUserSearchField(
              userController: inviteGuestController,
              userList: mockUsersList,
              callback: (p0) {
                safePrint("coté screen = ${p0.username}");
              },
            ),
            vSpace100,
            Expanded(
              child: SearchUserList(
                users: mockUsersList,
                onDelete: (User value) {
                  safePrint("delete ${value.username}");
                },
              ),
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
            /*WaaaTextField(
              controller: inviteGuestController,
              label: localized(context).search,
              leadingIcon: Ionicons.search,
            ),*/
          ],
        ),
      ),
    );
  }
}

class SearchUserList extends StatelessWidget {
  const SearchUserList(
      {super.key, required this.users, required this.onDelete});

  final List<User> users;
  final Function onDelete;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (var user in users)
          Chip(
            backgroundColor: secondaryColor,
            avatar: WaaaCircleAvatar(photo: user.photo),
            side: BorderSide(
              color: primaryColor,
              width: 1,
            ),
            label: Text(
              user.username,
              style: regularTextStyle16,
            ),
            deleteIcon: const Icon(Ionicons.close),
            onDeleted: () {
              onDelete(user);
            },
          )
      ],
    );
  }
}
