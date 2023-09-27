import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:waaa/core/constants/image_constants.dart';
import 'package:waaa/core/constants/spacer.dart';
import 'package:waaa/core/theme/colors.dart';
import 'package:waaa/core/theme/text_styles.dart';
import 'package:waaa/core/util/input_converter.dart';
import 'package:waaa/models/Offer.dart';

class OfferCarouselItem extends StatelessWidget {
  const OfferCarouselItem(
      {super.key, required this.currentOffer, this.resultMessage});

  final Offer currentOffer;
  final String? resultMessage;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(currentOffer.image ?? noPhotoImage),
          colorFilter:
              ColorFilter.mode(blackColor.withOpacity(.4), BlendMode.darken),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topRight,
            child: Container(
              padding: const EdgeInsets.only(right: 20, top: 20),
              child: Icon(
                Ionicons.leaf,
                color: luckyColor,
              ),
            ),
          ),
          if (resultMessage != null)
            Align(
              alignment: Alignment.center,
              child: Text(
                resultMessage ?? "",
                style: boldWhiteTextStyle16,
              ),
            ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              padding: const EdgeInsets.only(left: 20, bottom: 40, right: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        Ionicons.globe_outline,
                        color: secondaryColor,
                      ),
                      hSpace10,
                      Text(
                        currentOffer.country,
                        style: boldWhiteTextStyle12,
                      ),
                    ],
                  ),
                  Text(
                    currentOffer.title,
                    style: boldWhiteTextStyle18,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        DateConverter().dateToDateString(
                            currentOffer.publicationDate.getDateTimeInUtc()),
                        style: boldWhiteTextStyle12,
                      ),
                      Text(
                        "#${currentOffer.hashtag}",
                        style: boldWhiteTextStyle12,
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class OfferCarouselMiniItem extends StatelessWidget {
  const OfferCarouselMiniItem({super.key, required this.currentOffer});

  final Offer currentOffer;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(currentOffer.image ?? noPhotoImage),
          colorFilter:
              ColorFilter.mode(blackColor.withOpacity(.4), BlendMode.darken),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              padding: const EdgeInsets.only(left: 20, bottom: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    currentOffer.country,
                    style: boldWhiteTextStyle14,
                  ),
                  vSpace10,
                  Text(
                    DateConverter().dateToDateString(
                        currentOffer.publicationDate.getDateTimeInUtc()),
                    style: boldWhiteTextStyle12,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
