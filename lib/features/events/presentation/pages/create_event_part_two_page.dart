import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:waaa/core/theme/common_widget/button.dart';

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
        backgroundColor: transparentColor,
        elevation: 0,
      ),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
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
