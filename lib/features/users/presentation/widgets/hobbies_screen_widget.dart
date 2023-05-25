import 'package:flutter/material.dart';
import 'package:group_button/group_button.dart';
import 'package:waaa/core/constants/spacer.dart';
import 'package:waaa/core/theme/text_styles.dart';
import 'package:waaa/features/users/presentation/manager/bloc/register/register_bloc.dart';

import 'package:waaa/injection_container.dart' as di;
import 'package:waaa/models/Hobby.dart';

import '../../../../core/theme/common_widget/button.dart';
import '../../../../core/theme/common_widget/group_button_style.dart';
import '../../../../core/util/localized.dart';

class HobbiesScreenWidget extends StatelessWidget {
  const HobbiesScreenWidget({super.key, required this.hobbies});

  final List<Hobby?> hobbies;

  @override
  Widget build(BuildContext context) {
    final RegisterBloc registerBloc = di.sl<RegisterBloc>();
    final GroupButtonController hobbiesController = GroupButtonController();
    List<String> list = [
      if (hobbies.isNotEmpty)
        for (var hobby in hobbies) hobby!.name
    ];

    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(30),
        child: Column(
          children: [
            vSpace60,
            Text(
              localized(context).hobbies,
              style: boldTextStyle24,
            ),
            vSpace150,
            Column(
              children: [
                GroupButton(
                  controller: hobbiesController,
                  isRadio: false,
                  options: groupButtonOptions,
                  buttons: list,
                  onSelected: (val, i, selected) =>
                      debugPrint('Button: $val index: $i $selected'),
                ),
              ],
            ),
            vSpace100,
            ElevatedButton(
                style: primaryButton,
                onPressed: () {
                  registerBloc.add(ValidateHobbiesButtonPressed(
                      hobbiesIndexes:
                          hobbiesController.selectedIndexes.toList()));
                },
                child: Text(
                  localized(context).next,
                  style: boldTextStyle12,
                )),
            vSpace20,
            Text(localized(context).skip)
          ],
        ),
      ),
    );
  }
}
