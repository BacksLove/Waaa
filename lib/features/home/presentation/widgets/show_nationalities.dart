import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:waaa/core/theme/colors.dart';
import 'package:waaa/core/theme/text_styles.dart';

class ShowNationalitiesSelected extends StatelessWidget {
  const ShowNationalitiesSelected({
    super.key,
    required this.nationalities,
    required this.onPressed,
  });

  final List<String> nationalities;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (var country in nationalities)
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              IconButton(
                icon: Icon(
                  FeatherIcons.x,
                  color: primaryColor,
                ),
                onPressed: () {
                  onPressed(country);
                },
              ),
              Text(
                Country.parse(country).displayNameNoCountryCode,
                style: regularTextStyle16,
              ),
            ],
          ),
      ],
    );
  }
}
