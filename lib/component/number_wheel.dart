import 'package:flutter/material.dart';
import 'package:waaa/core/theme/colors.dart';
import 'package:waaa/core/theme/text_styles.dart';
import 'package:wheel_slider/wheel_slider.dart';

class WaaaNumberWheel extends StatefulWidget {
  const WaaaNumberWheel(
      {super.key, required this.maxValue, required this.callback});

  final int maxValue;
  final Function callback;

  @override
  State<WaaaNumberWheel> createState() => _WaaaNumberWheelState();
}

class _WaaaNumberWheelState extends State<WaaaNumberWheel> {
  int _nCurrentValue = 0;

  @override
  Widget build(BuildContext context) {
    return WheelSlider.number(
      perspective: 0.01,
      totalCount: widget.maxValue,
      initValue: 0,
      horizontal: false,
      isInfinite: false,
      unSelectedNumberStyle: boldTextStyle24.copyWith(color: lightGrayColor),
      selectedNumberStyle: boldTextStyle24,
      currentIndex: _nCurrentValue,
      onValueChanged: (val) {
        setState(() {
          _nCurrentValue = val;
        });
        widget.callback(val);
      },
      hapticFeedbackType: HapticFeedbackType.heavyImpact,
    );
  }
}
