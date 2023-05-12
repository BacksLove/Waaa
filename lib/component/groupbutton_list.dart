import 'package:flutter/material.dart';
import 'package:group_button/group_button.dart';
import 'package:waaa/core/theme/text_styles.dart';

import '../core/constants/spacer.dart';
import '../core/theme/common_widget/group_button_style.dart';
import '../core/util/localized.dart';

// ignore: must_be_immutable
class WaaaGroupButton extends StatelessWidget {
  WaaaGroupButton({
    super.key,
    required this.groupController,
    required this.list,
    this.title,
  });

  final GroupButtonController groupController;
  final List<String> list;
  String? title;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title != null) ...{
          Text(
            title!,
            style: semiBoldTextStyle16,
          ),
          vSpace20,
        },
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: GroupButton(
            controller: groupController,
            isRadio: false,
            options: groupButtonOptions,
            buttons: list,
            onSelected: (val, i, selected) =>
                debugPrint('Button: $val index: $i $selected'),
          ),
        ),
      ],
    );
  }
}
