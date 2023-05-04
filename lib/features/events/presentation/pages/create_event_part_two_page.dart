import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:waaa/component/chip_list.dart';
import 'package:waaa/core/theme/common_widget/button.dart';
import 'package:waaa/core/util/mocks/users.dart';

import '../../../../core/constants/spacer.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/text_styles.dart';
import '../../../../core/util/localized.dart';

class CreateEventPageTwo extends StatelessWidget {
  const CreateEventPageTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          localized(context).create_an_event,
          style: boldTextStyle18,
        ),
        leading: IconButton(
          icon: const Icon(FeatherIcons.x),
          color: blackColor,
          onPressed: () => Navigator.pop(context),
        ),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
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
              child: ChipListWidget(users: mockUsersList),
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
              child: ChipListWidget(users: mockUsersList),
            ),
            vSpace20,
            Text(
              "Voir moins",
              textAlign: TextAlign.center,
              style: lightPrimarySemiBoldTextStyle12,
            ),
            vSpace20,
            Row(
              children: [
                Text(
                  localized(context).guests_can_invite,
                  style: semiBoldTextStyle16,
                ),
                Switch(value: true, onChanged: (value) {})
              ],
            ),
            vSpace5,
            Row(
              children: [
                Text(
                  localized(context).guests_can_invite,
                  style: semiBoldTextStyle16,
                ),
                Switch(value: true, onChanged: (value) {})
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
                controller: null,
                decoration: InputDecoration(
                    hintText: localized(context).description__1,
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: lightGrayColor),
                    )),
                maxLines: null, // Set this
                expands: true, // and this
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
            )
          ],
        ),
      ),
    );
  }
}
