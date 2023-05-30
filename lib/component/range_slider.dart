import 'package:flutter/material.dart';
import 'package:waaa/core/constants/spacer.dart';
import 'package:waaa/core/theme/colors.dart';
import 'package:waaa/core/theme/text_styles.dart';
import 'package:waaa/core/util/localized.dart';

class WaaaRangeSlider extends StatefulWidget {
  const WaaaRangeSlider({super.key, required this.onSelected});

  final Function onSelected;

  @override
  State<WaaaRangeSlider> createState() => _WaaaRangeSliderState();
}

class _WaaaRangeSliderState extends State<WaaaRangeSlider> {
  RangeValues range = const RangeValues(22, 80);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          localized(context).age,
          style: semiBoldTextStyle16,
        ),
        vSpace20,
        RangeSlider(
          values: range,
          min: 0,
          max: 100,
          divisions: 100,
          activeColor: lightPrimaryColor,
          inactiveColor: lightGrayColor,
          labels: RangeLabels(
            range.start.round().toString(),
            range.end.round().toString(),
          ),
          onChanged: (value) {
            setState(() {
              range = value;
            });
            widget.onSelected(value);
          },
        ),
        vSpace5,
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "${range.start.round().toString()} ans", // TODO: Mettre string
              style: regularTextStyle16,
            ),
            hSpace40,
            Text(
              "${range.end.round().toString()} ans", // TODO: Mettre string
              style: regularTextStyle16,
            ),
          ],
        )
      ],
    );
  }
}
