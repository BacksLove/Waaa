import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:waaa/core/constants/spacer.dart';
import 'package:waaa/core/theme/common_widget/button.dart';
import 'package:waaa/core/theme/text_styles.dart';
import 'package:waaa/core/util/localized.dart';
import 'package:waaa/features/lottery/presentation/pages/lottery_main_page.dart';
import 'package:waaa/models/Offer.dart';

import 'package:waaa/core/route/routes.dart' as route;

class OfferBottomSheet extends StatelessWidget {
  const OfferBottomSheet({super.key, required this.currentOffer});

  final Offer currentOffer;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Text(
                    localized(context).current_trip,
                    style: boldTextStyle24,
                  ),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Ionicons.close,
                      size: 40,
                    ),
                  ),
                ),
              ],
            ),
            vSpace10,
            //! When Row
            Text(
              "When ?",
              style: semiBoldTextStyle16,
            ),
            Text(
              currentOffer.title,
              style: regularTextStyle16,
            ),
            vSpace30,
            //! Trips detail
            Text(
              localized(context).the_trip_includes,
              style: semiBoldTextStyle16,
            ),
            vSpace10,
            OfferBottomsheetTile(
                icon: Ionicons.airplane, title: localized(context).transports),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Train/Bus",
                  style: regularTextStyle16,
                ),
                Text(
                  "Voiture",
                  style: regularTextStyle16,
                ),
              ],
            ),
            vSpace10,
            OfferBottomsheetTile(
                icon: Ionicons.football, title: localized(context).activities),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Train/Bus",
                  style: regularTextStyle16,
                ),
                Text(
                  "Voiture",
                  style: regularTextStyle16,
                ),
              ],
            ),
            vSpace10,
            OfferBottomsheetTile(
                icon: Ionicons.home, title: localized(context).accomodations),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Train/Bus",
                  style: regularTextStyle16,
                ),
                Text(
                  "Voiture",
                  style: regularTextStyle16,
                ),
              ],
            ),
            vSpace15,
            ElevatedButton(
              style: primaryButton,
              onPressed: () {
                Navigator.pushNamed(context, route.subscriptionPage);
              },
              child: Text(
                localized(context).subscribe,
                style: regularTextStyle16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
