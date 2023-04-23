import 'dart:core';

import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:waaa/component/signup_textfield.dart';
import 'package:waaa/core/theme/colors.dart';
import 'package:waaa/core/theme/common_widget/button.dart';
import 'package:waaa/core/util/localized.dart';

import 'package:waaa/core/route/routes.dart' as route;

import '../manager/signup_bloc/signup_bloc.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController confirmCodeController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    //BlocProvider.of<SignupBloc>(context).add(event)
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignupBloc, SignupState>(
      listener: (context, state) {
        if (state is SignUpCompletedState) {
          Navigator.pushNamed(context, route.registerPage);
        }
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(FeatherIcons.chevronLeft, color: Colors.black),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        body: BlocBuilder<SignupBloc, SignupState>(
          builder: (context, state) {
            if (state is SignupInitialState) {
              return emailScreen(context, emailController);
            } else if (state is SignupPasswordState ||
                state is SignupPasswordErrorState) {
              return passwordScreen(context, emailController,
                  passwordController, confirmPasswordController);
            } else if (state is SignupConfirmCodeState) {
              return confirmCodeScreen(context, emailController,
                  passwordController, confirmCodeController);
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }
}

// Screens
Widget emailScreen(
    BuildContext context, TextEditingController emailController) {
  return Center(
    child: Padding(
      padding: const EdgeInsets.all(30),
      child: Column(
        children: [
          const SizedBox(
            height: 65,
          ),
          Text(
            localized(context).create_an_account,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
          const SizedBox(
            height: 40,
          ),
          SignupTextfieldWidget(
              controller: emailController, hintText: localized(context).email),
          const SizedBox(
            height: 80,
          ),
          Text(
            localized(context).term_and_policy,
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 35,
          ),
          ElevatedButton(
              style: primaryButton,
              onPressed: () {
                BlocProvider.of<SignupBloc>(context).add(
                    ValidateEmailButtonPressed(email: emailController.text));
              },
              child: Text(localized(context).next))
        ],
      ),
    ),
  );
}

Widget passwordScreen(
    BuildContext context,
    TextEditingController emailController,
    TextEditingController passwordController,
    TextEditingController confirmPasswordController) {
  return Center(
    child: Padding(
      padding: const EdgeInsets.all(30.0),
      child: Column(
        children: [
          const SizedBox(
            height: 65,
          ),
          const Text(
            "Create a password",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
          const SizedBox(
            height: 40,
          ),
          SignupTextfieldWidget(
              controller: passwordController,
              hintText: localized(context).password),
          const SizedBox(
            height: 35,
          ),
          SignupTextfieldWidget(
              controller: confirmPasswordController,
              hintText: localized(context).password),
          const SizedBox(
            height: 80,
          ),
          ElevatedButton(
              style: primaryButton,
              onPressed: () {
                BlocProvider.of<SignupBloc>(context).add(
                    ValidatePasswordButtonPressed(
                        email: emailController.text,
                        password: passwordController.text,
                        confirmPassword: confirmPasswordController.text));
              },
              child: const Text("Next"))
        ],
      ),
    ),
  );
}

Widget confirmCodeScreen(
    BuildContext context,
    TextEditingController emailController,
    TextEditingController passwordController,
    TextEditingController confirmCodeController) {
  return BlocBuilder<SignupBloc, SignupState>(
    builder: (context, state) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            children: [
              const SizedBox(
                height: 65,
              ),
              const Text(
                "Verify account",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "Thank you! We sent you an email at\n\n ${emailController.text}.\n\nPlease confirm your registration",
                textAlign: TextAlign.center,
                style:
                    const TextStyle(fontWeight: FontWeight.w500, fontSize: 12),
              ),
              const SizedBox(
                height: 45,
              ),
              signupConfirmCodeField(context, confirmCodeController),
              const SizedBox(
                height: 100,
              ),
              if (state is SignupLoadingState)
                const CircularProgressIndicator()
              else
                ElevatedButton(
                    style: primaryButton,
                    onPressed: () {
                      BlocProvider.of<SignupBloc>(context).add(
                          ValidateConfirmCodeButtonPressed(
                              email: emailController.text,
                              password: passwordController.text,
                              code: confirmCodeController.text));
                    },
                    child: const Text(
                      "Next",
                      style: TextStyle(fontSize: 12),
                    )),
              const SizedBox(
                height: 25,
              ),
              const Text(
                "Renvoyer l'email",
                style: TextStyle(fontSize: 12),
              ),
            ],
          ),
        ),
      );
    },
  );
}

Widget signupConfirmCodeField(
    BuildContext context, TextEditingController controller) {
  return PinCodeTextField(
    controller: controller,
    enableActiveFill: true,
    cursorColor: Colors.black,
    appContext: context,
    length: 6,
    onChanged: (String value) {},
    pinTheme: PinTheme(
      shape: PinCodeFieldShape.underline,
      fieldHeight: 50,
      fieldWidth: 40,
      activeColor: primaryColor,
      activeFillColor: Colors.white,
      selectedColor: primaryColor,
      selectedFillColor: Colors.white,
      inactiveColor: primaryColor,
      inactiveFillColor: Colors.white,
    ),
  );
}

Widget signupCountryPicker(
    BuildContext context, String variableToFill, String buttonText) {
  return ElevatedButton(
      style: primaryButton,
      onPressed: () {
        showCountryPicker(
          context: context,
          countryListTheme: CountryListThemeData(
            flagSize: 25,
            backgroundColor: Colors.white,
            textStyle: const TextStyle(fontSize: 16, color: Colors.black),
            bottomSheetHeight: 500, // Optional. Country list modal height
            borderRadius: const BorderRadius.all(
              Radius.circular(20.0),
            ),
            //Optional. Styles the search field.
            inputDecoration: InputDecoration(
              labelText: 'Search',
              hintText: 'Start typing to search',
              prefixIcon: const Icon(FeatherIcons.search),
              suffixIcon: const Icon(FeatherIcons.chevronDown),
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ),
          ),
          onSelect: (Country value) {
            variableToFill = value.displayNameNoCountryCode;
          },
        );
      },
      child: Text(buttonText));
}
