import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waaa/component/signup_textfield.dart';
import 'package:waaa/core/constants/spacer.dart';
import 'package:waaa/core/theme/text_styles.dart';
import 'package:waaa/features/users/presentation/manager/bloc/register/register_bloc.dart';

import '../../../../core/theme/common_widget/button.dart';
import '../../../../core/util/localized.dart';

import 'package:waaa/injection_container.dart' as di;

class UsernameScreenWidget extends StatelessWidget {
  const UsernameScreenWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final RegisterBloc registerBloc = di.sl<RegisterBloc>();
    final TextEditingController usernameController = TextEditingController();

    return BlocBuilder<RegisterBloc, RegisterState>(
      bloc: registerBloc,
      builder: (context, state) {
        return Center(
          child: Container(
            padding: const EdgeInsets.all(30),
            child: Column(
              children: [
                vSpace60,
                Text(
                  localized(context).choose_a_nickname,
                  style: boldTextStyle24,
                ),
                vSpace40,
                SignupTextfieldWidget(
                  controller: usernameController,
                  hintText: localized(context).nickname,
                ),
                vSpace20,
                ElevatedButton(
                    style: primaryButton,
                    onPressed: () {
                      registerBloc.add(ValidateUsernameButtonPressed(
                          username: usernameController.text));
                    },
                    child: Text(
                      localized(context).next,
                      style: boldTextStyle12,
                    ))
              ],
            ),
          ),
        );
      },
    );
  }
}
