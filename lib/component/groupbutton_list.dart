import 'package:flutter/material.dart';
import 'package:group_button/group_button.dart';
import 'package:waaa/core/theme/text_styles.dart';

import '../core/constants/spacer.dart';
import '../core/theme/common_widget/group_button_style.dart';

// ignore: must_be_immutable
class WaaaGroupButton extends StatelessWidget {
  WaaaGroupButton({
    super.key,
    this.groupController,
    required this.list,
    this.title,
    this.isRadio = false,
  });

  final GroupButtonController? groupController;
  final List<String> list;
  String? title;
  bool isRadio;

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
            isRadio: isRadio,
            options: groupButtonOptions,
            buttons: list,
            maxSelected: 5,
            onSelected: (val, i, selected) =>
                debugPrint('Button: $val index: $i $selected'),
          ),
        ),
      ],
    );
  }
}
