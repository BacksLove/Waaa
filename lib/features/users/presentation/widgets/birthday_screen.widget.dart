import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waaa/component/scrolldate_picker.dart';
import 'package:waaa/core/constants/spacer.dart';
import 'package:waaa/core/theme/text_styles.dart';
import 'package:waaa/features/users/presentation/manager/bloc/register/register_bloc.dart';

import '../../../../core/theme/common_widget/button.dart';
import '../../../../core/util/localized.dart';

import 'package:waaa/injection_container.dart' as di;

class BirthdayScreenWidget extends StatelessWidget {
  const BirthdayScreenWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final RegisterBloc registerBloc = di.sl<RegisterBloc>();
    DateTime selectedDate = DateTime.now();
    final today = DateTime.now();
    final eighteenY = DateTime(today.year - 18, today.month, today.day);

    return BlocBuilder<RegisterBloc, RegisterState>(
      bloc: registerBloc,
      builder: (context, state) {
        return Center(
          child: Container(
            padding: const EdgeInsets.all(30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                vSpace60,
                Text(
                  localized(context).whats_your_date_of_birth,
                  textAlign: TextAlign.left,
                  style: boldTextStyle24,
                ),
                Text(
                  localized(context).only_your_age_will_be_displayed,
                  textAlign: TextAlign.left,
                  style: regularTextStyle12,
                ),
                vSpace40,
                SizedBox(
                  height: 250,
                  child: WaaaScrollDatePicker(
                    maxDate: eighteenY,
                    callback: (value) {
                      selectedDate = value;
                    },
                  ),
                ),
                ElevatedButton(
                  style: primaryButton,
                  onPressed: () {
                    registerBloc
                        .add(ValidateBirthdayPressed(birthday: selectedDate));
                  },
                  child: Text(
                    localized(context).next,
                    style: boldTextStyle12,
                  ),
                ),
                vSpace150,
              ],
            ),
          ),
        );
      },
    );
  }
}
