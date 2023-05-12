import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waaa/component/snack_bar.dart';
import 'package:waaa/core/constants/spacer.dart';
import 'package:waaa/core/enums/authentication_enum.dart';
import 'package:waaa/core/enums/login_enum.dart';
import 'package:waaa/core/theme/colors.dart';
import 'package:waaa/core/theme/common_widget/button.dart';
import 'package:waaa/core/theme/text_styles.dart';
import 'package:waaa/core/util/localized.dart';
import 'package:waaa/features/auth/presentation/manager/auth_bloc/auth_bloc.dart';
import 'package:waaa/features/auth/presentation/manager/login_bloc/login_state.dart';
import '../manager/login_bloc/login_bloc.dart';
import '../manager/login_bloc/login_event.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

import 'package:waaa/injection_container.dart' as di;
import 'package:waaa/core/route/routes.dart' as route;

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late LoginBloc loginBloc;
  final _emailField = TextEditingController();
  final _passwordField = TextEditingController();

  @override
  void initState() {
    loginBloc = di.sl<LoginBloc>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            icon: Icon(FeatherIcons.chevronLeft, color: blackColor),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        body: BlocListener<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state.status == AuthenticationStatus.authenticated) {
              Navigator.popAndPushNamed(context, route.homePage);
            } else if (state.status == AuthenticationStatus.registered) {
              Navigator.popAndPushNamed(context, route.registerPage);
            }
          },
          child:
              BlocConsumer<LoginBloc, LoginState>(listener: (context, state) {
            if (state.errorType == LoginErrorType.conditionsNotChecked) {
              showFloatingFlushbar(
                  context, null, localized(context).conditions_not_checked);
            }
            if (state.status == LoginStatus.error) {
              if (state.errorType == LoginErrorType.userNotFound) {
                showFloatingFlushbar(
                    context, null, localized(context).user_not_found);
              }
            }
          }, builder: (context, state) {
            return SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Center(
                  child: Column(
                children: [
                  vSpace60,
                  Text(
                    localized(context).signin,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 24),
                  ),
                  vSpace100,
                  TextField(
                    controller: _emailField,
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                    decoration: InputDecoration(
                      labelText: localized(context).email,
                      errorText: state.errorType == LoginErrorType.emptyEmail
                          ? localized(context).empty_email
                          : null,
                      enabledBorder: UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: Theme.of(context).primaryColor),
                      ),
                    ),
                  ),
                  vSpace35,
                  TextField(
                    controller: _passwordField,
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                    decoration: InputDecoration(
                      labelText: localized(context).password,
                      errorText: state.errorType == LoginErrorType.emptyPassword
                          ? localized(context).empty_password
                          : null,
                      iconColor: primaryColor,
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: Theme.of(context).primaryColor)),
                      suffixIcon: IconButton(
                        icon: state.isPassworHidden
                            ? const Icon(FeatherIcons.eyeOff)
                            : const Icon(FeatherIcons.eye),
                        onPressed: () => loginBloc.add(ShowPasswordPressed()),
                      ),
                    ),
                    obscureText: state.isPassworHidden,
                  ),
                  vSpace15,
                  SizedBox(
                    width: double.infinity,
                    child: Text(
                      localized(context).forgot_password,
                      textAlign: TextAlign.right,
                    ),
                  ),
                  // Buttons
                  vSpace60,
                  ElevatedButton(
                    style: primaryButton,
                    onPressed: () {
                      loginBloc.add(LoginButtonPressed(
                          _emailField.text, _passwordField.text));
                      _passwordField.clear();
                    },
                    child: Text(localized(context).signin),
                  ),
                  vSpace25,
                  Text(
                    localized(context).or_connect_with,
                  ),
                  vSpace25,
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton.icon(
                          style: facebookButton,
                          onPressed: () {
                            loginBloc.add(LogOutButtonPressed());
                          },
                          label: Text(localized(context).facebook),
                          icon: const Icon(FeatherIcons.facebook),
                        ),
                      ),
                      hSpace15,
                      Expanded(
                        child: ElevatedButton.icon(
                          style: googleButton,
                          onPressed: () {},
                          label: Text(localized(context).google),
                          icon: const Icon(FeatherIcons.twitter),
                        ),
                      ),
                    ],
                  ),
                  vSpace50,
                  ListTile(
                    minLeadingWidth: 10,
                    leading: Checkbox(
                      value: state.hasAcceptConditions,
                      activeColor: primaryColor,
                      onChanged: (value) {
                        loginBloc.add(AcceptConditions());
                      },
                    ),
                    title: Text(
                      localized(context).term_and_policy,
                      style: regularTextStyle12,
                    ),
                  ),
                ],
              )),
            );
          }),
        ));
  }
}
