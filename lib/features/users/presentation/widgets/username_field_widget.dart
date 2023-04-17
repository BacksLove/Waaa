import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waaa/component/signup_textfield.dart';
import 'package:waaa/features/users/presentation/manager/register_bloc.dart';

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
                const SizedBox(
                  height: 65,
                ),
                Text(
                  localized(context).choose_a_nickname,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 24),
                ),
                const SizedBox(
                  height: 40,
                ),
                SignupTextfieldWidget(
                    controller: usernameController,
                    hintText: localized(context).nickname),
                const SizedBox(
                  height: 15,
                ),
                /*SizedBox(
                    width: double.infinity,
                    child: Text(
                      localized(context).nickname_already_taken,
                      textAlign: TextAlign.left,
                    )),*/
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                    style: primaryButton,
                    onPressed: () {
                      registerBloc.add(ValidateUsernameButtonPressed(
                          username: usernameController.text));
                    },
                    child: Text(localized(context).next))
              ],
            ),
          ),
        );
      },
    );
  }
}
