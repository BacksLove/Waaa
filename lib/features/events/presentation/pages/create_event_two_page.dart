import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:waaa/injection_container.dart' as di;

import '../../../../component/chip_list.dart';
import '../../../../core/constants/spacer.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/common_widget/button.dart';
import '../../../../core/theme/text_styles.dart';
import '../../../../core/util/localized.dart';
import '../../../../core/util/mocks/users.dart';
import '../../../users/domain/entities/user_entity.dart';
import '../manager/bloc/create_event_bloc.dart';

class CreateEventTwoPage extends StatelessWidget {
  const CreateEventTwoPage({super.key});

  @override
  Widget build(BuildContext context) {
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
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(15.0),
        child: CreateEventPartTwo(),
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
    final CreateEventBloc createEventBloc = di.sl<CreateEventBloc>();

    TextEditingController descriptionController = TextEditingController();
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
            SizedBox(
              height: 200,
              child: ChipListWidget(users: state.coorganizer),
            ),
            vSpace20,
            Text(
              localized(context).invite_guests,
              style: semiBoldTextStyle16,
            ),
            vSpace20,
            const Placeholder(
              fallbackHeight: 50,
            ),
            vSpace5,
            SizedBox(
              height: 200,
              child: ChipListWidget(users: state.guests),
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
