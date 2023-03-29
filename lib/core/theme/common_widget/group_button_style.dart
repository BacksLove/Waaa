import 'package:flutter/material.dart';
import 'package:group_button/group_button.dart';

import '../colors.dart';

final GroupButtonOptions groupButtonOptions = GroupButtonOptions(
  selectedTextStyle: const TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.bold,
      color: Colors.black
  ),
  selectedColor: transparentColor,
  unselectedColor: transparentColor,
  unselectedTextStyle: TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.bold,
    color: grayColor,
  ),
  selectedBorderColor: primaryColor,
  unselectedBorderColor: grayColor,
  borderRadius: BorderRadius.circular(50),
  spacing: 10,
  runSpacing: 10,
  groupingType: GroupingType.wrap,
  direction: Axis.horizontal,
  mainGroupAlignment: MainGroupAlignment.start,
  crossGroupAlignment: CrossGroupAlignment.start,
  groupRunAlignment: GroupRunAlignment.start,
  textAlign: TextAlign.center,
  textPadding: EdgeInsets.zero,
  alignment: Alignment.center,
  elevation: 0,
);