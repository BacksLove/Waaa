import 'dart:core';

import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:waaa/component/signup_textfield.dart';
import 'package:waaa/core/constants/spacer.dart';
import 'package:waaa/core/theme/colors.dart';
import 'package:waaa/core/theme/common_widget/button.dart';
import 'package:waaa/core/theme/text_styles.dart';
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
          backgroundColor: transparentColor,
          elevation: 0,
          leading: IconButton(
            icon: Icon(FeatherIcons.chevronLeft, color: blackColor),
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
  bool isChecked = true;
  return Center(
    child: Padding(
      padding: const EdgeInsets.all(30),
      child: Column(
        children: [
          vSpace60,
          Text(
            localized(context).create_an_account,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
          vSpace50,
          SignupTextfieldWidget(
              controller: emailController, hintText: localized(context).email),
          vSpace80,
          ListTile(
            minLeadingWidth: 10,
            leading: Checkbox(value: isChecked, onChanged: (value) {}),
            title: Text(
              localized(context).term_and_policy,
              maxLines: 3,
            ),
          ),
          vSpace35,
          ElevatedButton(
            style: primaryButton,
            onPressed: () {
              BlocProvider.of<SignupBloc>(context)
                  .add(ValidateEmailButtonPressed(email: emailController.text));
            },
            child: Text(localized(context).next),
          )
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
          vSpace60,
          Text(
            localized(context).create_your_password,
            style: boldTextStyle24,
          ),
          vSpace40,
          SignupTextfieldWidget(
            controller: emailController,
            hintText: localized(context).email,
            isEnabled: false,
          ),
          vSpace35,
          SignupPasswordTextfieldWidget(
              controller: passwordController,
              hintText: localized(context).password),
          vSpace80,
          ElevatedButton(
            style: primaryButton,
            onPressed: () {
              BlocProvider.of<SignupBloc>(context).add(
                  ValidatePasswordButtonPressed(
                      email: emailController.text,
                      password: passwordController.text,
                      confirmPassword: confirmPasswordController.text));
            },
            child: Text(
              localized(context).next,
              style: boldWhiteTextStyle12,
            ),
          )
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
              vSpace60,
              Text(
                localized(context).verify_account,
                style: boldTextStyle24,
              ),
              vSpace20,
              Text(
                "Thank you! We sent you an email at\n\n ${emailController.text}.\n\nPlease confirm your registration",
                textAlign: TextAlign.center,
                style: semiBoldTextStyle12,
              ),
              vSpace40,
              signupConfirmCodeField(context, confirmCodeController),
              vSpace100,
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
                    child: Text(
                      localized(context).next,
                      style: regularTextStyle12,
                    )),
              vSpace25,
              Text(
                localized(context).resend_email,
                style: regularTextStyle12,
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
    cursorColor: blackColor,
    appContext: context,
    length: 6,
    onChanged: (String value) {},
    pinTheme: PinTheme(
      shape: PinCodeFieldShape.underline,
      fieldHeight: 50,
      fieldWidth: 40,
      activeColor: primaryColor,
      activeFillColor: secondaryColor,
      selectedColor: primaryColor,
      selectedFillColor: secondaryColor,
      inactiveColor: primaryColor,
      inactiveFillColor: secondaryColor,
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
            backgroundColor: secondaryColor,
            textStyle: regularTextStyle16,
            bottomSheetHeight: 500, // Optional. Country list modal height
            borderRadius: const BorderRadius.all(
              Radius.circular(20.0),
            ),
            //Optional. Styles the search field.
            inputDecoration: InputDecoration(
              labelText: localized(context).search,
              hintText: localized(context).search__1,
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
