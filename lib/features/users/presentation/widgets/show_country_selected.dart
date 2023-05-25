import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_svg/svg.dart';
import 'package:waaa/core/constants/spacer.dart';
import 'package:waaa/core/theme/colors.dart';
import 'package:waaa/core/theme/text_styles.dart';

import '../../../../core/constants/image_constants.dart';

class ShowCountrySelected extends StatelessWidget {
  const ShowCountrySelected({
    super.key,
    required this.country,
  });

  final String country;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SvgPicture.asset(
          checkImageSvg,
          width: 35,
          height: 35,
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          Country.parse(country).displayNameNoCountryCode,
          textAlign: TextAlign.center,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
        ),
        const SizedBox(
          height: 30,
        ),
      ],
    );
  }
}

class ShowCountryItemSelected extends StatelessWidget {
  const ShowCountryItemSelected({
    super.key,
    required this.spokenLanguages,
  });

  final List<String> spokenLanguages;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (var language in spokenLanguages)
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                FeatherIcons.check,
                color: primaryColor,
              ),
              hSpace15,
              Text(
                Country.parse(language).displayNameNoCountryCode,
                style: regularTextStyle12,
              ),
            ],
          )
      ],
    );
  }
}
