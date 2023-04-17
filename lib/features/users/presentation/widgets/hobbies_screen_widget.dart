import 'package:flutter/material.dart';
import 'package:group_button/group_button.dart';
import 'package:waaa/features/hobbies/domain/entities/hobby.dart';
import 'package:waaa/features/users/presentation/manager/register_bloc.dart';

import 'package:waaa/injection_container.dart' as di;

import '../../../../core/theme/common_widget/button.dart';
import '../../../../core/theme/common_widget/group_button_style.dart';
import '../../../../core/util/localized.dart';

class HobbiesScreenWidget extends StatelessWidget {
  const HobbiesScreenWidget({super.key, required this.hobbies});

  final List<Hobby> hobbies;

  @override
  Widget build(BuildContext context) {
    final RegisterBloc registerBloc = di.sl<RegisterBloc>();
    final GroupButtonController hobbiesController = GroupButtonController();
    List<String> list = [for (var hobby in hobbies) hobby.name];

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          children: [
            const SizedBox(
              height: 60,
            ),
            Text(
              localized(context).hobbies,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
            const SizedBox(
              height: 120,
            ),
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
            const SizedBox(
              height: 100,
            ),
            ElevatedButton(
                style: primaryButton,
                onPressed: () {
                  registerBloc.add(ValidateHobbiesButtonPressed(
                      hobbiesIndexes:
                          hobbiesController.selectedIndexes.toList()));
                },
                child: const Text("Next")),
            const SizedBox(
              height: 20,
            ),
            const Text("Skip for now")
          ],
        ),
      ),
    );
  }
}
