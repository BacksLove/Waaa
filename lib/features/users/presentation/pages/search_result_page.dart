import 'package:country_flags/country_flags.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:waaa/component/circle_avatar.dart';
import 'package:waaa/core/constants/spacer.dart';
import 'package:waaa/core/theme/colors.dart';
import 'package:waaa/core/theme/common_widget/button.dart';
import 'package:waaa/core/theme/text_styles.dart';
import 'package:waaa/core/util/input_converter.dart';
import 'package:waaa/core/util/localized.dart';
import 'package:waaa/models/User.dart';

class SearchResultPage extends StatelessWidget {
  const SearchResultPage({super.key, required this.users});

  final List<User?> users;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: transparentColor,
        elevation: 0,
        title: Text(
          localized(context).search__1,
          style: appBarTextStyle,
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            FeatherIcons.chevronLeft,
            color: blackColor,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            for (var currentUser in users)
              if (currentUser != null) ...{
                SearchResultTile(
                  currentUser: currentUser,
                ),
                Divider(
                  color: grayColor,
                ),
              }
          ],
        ),
      ),
    );
  }
}

class SearchResultTile extends StatelessWidget {
  const SearchResultTile({super.key, required this.currentUser});

  final User currentUser;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          WaaaCircleAvatar(photo: currentUser.photo),
          hSpace25,
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    currentUser.username,
                    style: boldTextStyle18,
                  ),
                  hSpace15,
                  CountryFlags.flag(
                    currentUser.nativeLanguage ?? "",
                    height: 25,
                    width: 25,
                    borderRadius: 100,
                  ),
                ],
              ),
              //! Rang de l'age
              Row(
                children: [
                  Text(
                    DateConverter().getAge(currentUser.birthday),
                    style: regularTextStyle14,
                  ),
                  Container(
                    height: 10,
                    width: 10,
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      color: blackColor,
                      shape: BoxShape.circle,
                    ),
                  ),
                  Icon(
                    FeatherIcons.mapPin,
                    color: primaryColor,
                  ),
                  hSpace5,
                  Text(
                    "Canada, Montréal",
                    style: regularTextStyle14,
                  ),
                ],
              ),
              //! Rang des voyages précédents
              vSpace10,
              Text(
                localized(context).past_trips,
                style: primarySemiBoldTextStyle14,
              ),
              Row(
                children: [
                  Text(
                    "Berlin, Tokyo, Bamako",
                    style: regularTextStyle14,
                  ),
                  hSpace15,
                  SizedBox(
                    width: 60,
                    height: 30,
                    child: ElevatedButton(
                      style: primaryButton,
                      onPressed: () {},
                      child: Text(
                        "+3",
                        style: regularTextStyle16,
                      ),
                    ),
                  ),
                ],
              ),
              //! Rang des voyages précédents
              vSpace15,
              Text(
                localized(context).future_trips,
                style: primarySemiBoldTextStyle14,
              ),
              Row(
                children: [
                  Text(
                    "Argentine, Roumanie",
                    style: regularTextStyle14,
                  ),
                  /*hSpace15,
                  SizedBox(
                    width: 60,
                    height: 30,
                    child: ElevatedButton(
                      style: primaryButton,
                      onPressed: () {},
                      child: Text(
                        "+3",
                        style: regularTextStyle16,
                      ),
                    ),
                  ),*/
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
