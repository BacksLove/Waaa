import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waaa/component/search_field.dart';
import 'package:waaa/core/constants/spacer.dart';
import 'package:waaa/core/theme/colors.dart';
import 'package:waaa/core/theme/common_widget/button.dart';
import 'package:waaa/core/theme/text_styles.dart';
import 'package:waaa/core/util/localized.dart';
import 'package:waaa/features/events/presentation/manager/bloc/create_event/create_event_bloc.dart';
import 'package:waaa/features/events/presentation/widgets/event_edit_view.dart';
import 'package:waaa/features/users/presentation/widgets/invite_friend_dialog.dart';
import 'package:waaa/models/ModelProvider.dart';

class CreateEventPartTwo extends StatelessWidget {
  const CreateEventPartTwo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    TextEditingController descriptionController = TextEditingController();
    TextEditingController inviteGuestController = TextEditingController();

    return BlocBuilder<CreateEventBloc, CreateEventState>(
      builder: (context, state) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            InviteFriendDialog(
              users: state.friendList,
              onTap: (User value) {
                context
                    .read<CreateEventBloc>()
                    .add(AddUserToCoorganizerEvent(user: value));
              },
            ),
            vSpace20,
            SearchUserList(
              users: state.coorganizer,
              onDelete: (User value) {
                context
                    .read<CreateEventBloc>()
                    .add(DeleteUserFromCoorganizerEvent(user: value));
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
              userList: state.searchUserList,
              callback: (p0) {
                context
                    .read<CreateEventBloc>()
                    .add(AddUserToInviteEvent(user: p0));
                inviteGuestController.text = "";
              },
              onChange: (p0) {
                context
                    .read<CreateEventBloc>()
                    .add(SearchUserEvent(searchString: p0));
              },
            ),
            vSpace20,
            SearchUserList(
              users: state.guests,
              onDelete: (User value) {
                context
                    .read<CreateEventBloc>()
                    .add(DeleteUserFromInviteEvent(user: value));
              },
            ),
            vSpace20,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  localized(context).guests_can_invite,
                  style: semiBoldTextStyle16,
                ),
                Switch(
                  value: state.guestCanInvite,
                  onChanged: (value) {
                    context.read<CreateEventBloc>().add(GuestCanInviteSwitch());
                  },
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  localized(context).visible_on_my_profile,
                  style: semiBoldTextStyle16,
                ),
                Switch(
                  value: state.isVisibleOnMyProfile,
                  onChanged: (value) {
                    context.read<CreateEventBloc>().add(IsVisibleSwicth());
                  },
                )
              ],
            ),
            vSpace60,
            Text(
              localized(context).description,
              style: semiBoldTextStyle16,
            ),
            vSpace10,
            SizedBox(
              height: 160,
              child: TextField(
                controller: descriptionController,
                textAlign: TextAlign.start,
                decoration: InputDecoration(
                  hintText: localized(context).description__1,
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: lightGrayColor),
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
                maxLines: 5,
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
                      context.read<CreateEventBloc>().add(ValidateEventPressed(
                          description: descriptionController.text));
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
