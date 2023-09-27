import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:language_picker/languages.dart';
import 'package:waaa/component/language_picker.dart';
import 'package:waaa/core/constants/spacer.dart';
import 'package:waaa/core/theme/colors.dart';
import 'package:waaa/core/theme/common_widget/button.dart';
import 'package:waaa/core/theme/text_styles.dart';
import 'package:waaa/core/util/localized.dart';

class SubscriptionPage extends StatelessWidget {
  const SubscriptionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: transparentColor,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Ionicons.chevron_back),
          color: blackColor,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          localized(context).my_premium_account,
          style: appBarTextStyle,
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            vSpace40,
            Text(
              localized(context).my_premium_account,
              style: boldTextStyle18,
            ),
            vSpace50,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Card(
                    elevation: 10,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 50),
                      decoration: BoxDecoration(color: grayColor),
                      child: Column(
                        children: [
                          Text(
                            localized(context).monthly_payment,
                            textAlign: TextAlign.center,
                            style: boldWhiteTextStyle12,
                          ),
                          vSpace30,
                          Text(
                            localized(context)
                                .subscribe_1_euro_per_month_for_12_months,
                            textAlign: TextAlign.center,
                            style: boldWhiteTextStyle12,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                hSpace5,
                Text(
                  "or",
                  style: boldTextStyle18,
                ),
                hSpace5,
                Expanded(
                  child: Card(
                    elevation: 10,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 50),
                      decoration: BoxDecoration(color: grayColor),
                      child: Column(
                        children: [
                          Text(
                            localized(context).unique_payment,
                            textAlign: TextAlign.center,
                            style: boldWhiteTextStyle12,
                          ),
                          vSpace30,
                          Text(
                            localized(context).likes_per_day_for_6_months,
                            textAlign: TextAlign.center,
                            style: boldWhiteTextStyle12,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            vSpace20,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: ElevatedButton(
                    style: primaryButton,
                    onPressed: () {},
                    child: Text(
                      localized(context).subscribe,
                      style: regularTextStyle16,
                    ),
                  ),
                ),
                hSpace25,
                Expanded(
                  child: ElevatedButton(
                    style: primaryButton,
                    onPressed: () {},
                    child: Text(
                      localized(context).subscribe,
                      style: regularTextStyle16,
                    ),
                  ),
                ),
              ],
            ),
            vSpace35,
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  localized(context).likes_per_day_for_6_months,
                  style: regularTextStyle16,
                ),
                Text(
                  localized(context).play_the_lucky_draw,
                  style: regularTextStyle16,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
