import 'package:country_picker/country_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:group_button/group_button.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:waaa/features/users/presentation/manager/register_bloc.dart';

import '../../../../core/enums/gender.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/common_widget/button.dart';
import '../../../../core/theme/common_widget/group_button_style.dart';
import '../../../hobbies/domain/entities/hobby.dart';

import 'package:waaa/core/route/routes.dart' as route;

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  TextEditingController usernameController = TextEditingController();
  final GroupButtonController _hobbiesController = GroupButtonController();
  String nationality = "";
  String residenceCountry = "";
  DateTime birthday = DateTime.now();
  Gender gender = Gender.other;
  String nativeLanguage = "";
  List<String> spokenLanguage = [];
  List<Hobby> hobbies = [];
  String photoUrl = "";
  
  
  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterBloc, RegisterState>(
  listener: (context, state) {
    if (state is RegisterCompleteState) {
      Navigator.pushNamed(context, route.homePage);
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
      body: BlocBuilder<RegisterBloc, RegisterState>(
        builder: (context, state) {
          if (state is RegisterInitial) {
            return usernameScreen(context, usernameController);
          } else if (state is RegisterCountriesState) {
            return countryScreen(
                context, nationality, residenceCountry);
          } else if (state is RegisterLanguagesState) {
            return languageScreen(
                context, nativeLanguage, spokenLanguage);
          } else if (state is RegisterHobbiesState) {
            return hobbiesScreen(context, _hobbiesController, state);
          } else if (state is RegisterPhotoState) {
            return photoScreen(context, photoUrl);
          } else {
            return Container();
          }
        },
      ),
    ),
);
  }

Widget usernameScreen(BuildContext context,
    TextEditingController usernameController) {
  return Center(
    child: Padding(
      padding: const EdgeInsets.all(30),
      child: Column(
        children: [
          const SizedBox(
            height: 65,
          ),
          const Text(
            "Create an account",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
          const SizedBox(
            height: 40,
          ),
          signupTextField(context, usernameController, "pseudo"),
          const SizedBox(height: 15,),
          const Text("Pseudo déjà pris"),
          const SizedBox(height: 20,),
          ElevatedButton(
              style: primaryButton,
              onPressed: () {
                BlocProvider.of<RegisterBloc>(context).add(ValidateUsernameButtonPressed(
                    username: usernameController.text));
              },
              child: const Text("Next"))
        ],
      ),
    ),
  );
}

Widget countryScreen(BuildContext context, String nationality, String residence) {
  return Center(
    child: Padding(
      padding: const EdgeInsets.all(30),
      child: Column(
        children: [
          const SizedBox(
            height: 60,
          ),
          const Text(
            "Please select nationality",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
          const SizedBox(
            height: 40,
          ),
          signupCountryPicker(context, nationality, "Please select a country"),
          const SizedBox(
            height: 60,
          ),
          const Text(
            "Please select residence",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
          const SizedBox(
            height: 40,
          ),
          signupCountryPicker(context, residence, "Please select a country"),
          const SizedBox(
            height: 100,
          ),
          ElevatedButton(
              style: primaryButton,
              onPressed: () {
                BlocProvider.of<RegisterBloc>(context).add(ValidateCountriesButtonPressed(nationalityCountry: nationality, residenceCountry: residence));
              },
              child: const Text("Next")
          )
        ],
      ),
    ),
  );
}

Widget languageScreen(BuildContext context, String native, List<String> spoken) {
  return Center(
    child: Padding(
      padding: const EdgeInsets.all(30),
      child: Column(
        children: [
          const SizedBox(
            height: 60,
          ),
          const Text(
            "Please select nationality",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
          const SizedBox(
            height: 40,
          ),
          signupCountryPicker(context, native, "Please select your native language"),
          const SizedBox(
            height: 60,
          ),
          const Text(
            "Please select residence",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
          const SizedBox(
            height: 40,
          ),
          signupCountryPicker(context, native, "Please select your spoken languages"),
          const SizedBox(
            height: 100,
          ),
          ElevatedButton(
              style: primaryButton,
              onPressed: () {
                BlocProvider.of<RegisterBloc>(context).add(ValidateLanguagesButtonPressed(nativeLanguage: native, otherSpeakLanguages: spoken));
              },
              child: const Text("Next")
          )
        ],
      ),
    ),
  );
}

Widget hobbiesScreen(BuildContext context, GroupButtonController controller, RegisterHobbiesState state) {
  List<String> list = [
    for (var hobby in state.hobbies)
      hobby.name
  ];

  return Center(
    child: Padding(
      padding: const EdgeInsets.all(30),
      child: Column(
        children: [
          const SizedBox(
            height: 60,
          ),
          const Text(
            "Select your hobbies",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
          const SizedBox(
            height: 120,
          ),
          Column(
            children: [
              GroupButton(
                controller: controller,
                isRadio: false,
                options:  groupButtonOptions,
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
                BlocProvider.of<RegisterBloc>(context).add(ValidateHobbiesButtonPressed(hobbiesIndexes: controller.selectedIndexes.toList()));
              },
              child: const Text("Next")
          ),
          const SizedBox(
            height: 20,
          ),
          const Text("Skip for now")
        ],
      ),
    ),
  );
}

Widget photoScreen(BuildContext context, String photoUrl) {
  return Padding(
    padding: const EdgeInsets.all(20.0),
    child: Column(
      children: [
        const SizedBox(height: 50,),
        const Text(
          "Please upload your profile photo",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold
          ),
        ),
        const SizedBox(height: 20,),
        Center(
          child: Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                width: 1,
                color: grayColor,
                style: BorderStyle.solid,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(50),
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    width: 1,
                    color: grayColor,
                    style: BorderStyle.solid,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(80),
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        width: 1,
                        color: grayColor,
                        style: BorderStyle.solid,
                      ),
                    ),
                    child: Padding(
                        padding: const EdgeInsets.all(50),
                        child: Container(
                            width: 30,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                width: 2,
                                color: primaryColor,
                                style: BorderStyle.solid,
                              ),
                            ),
                            child: const Text("")
                        )
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        ElevatedButton(
            style: primaryButton,
            onPressed: () {},
            child: const Text("Take a photo")
        ),
        const SizedBox(height: 15,),
        ElevatedButton(
            style: outlinedBlackButton,
            onPressed: () {},
            child: const Text("Browse from gallery")
        ),
        ElevatedButton(
            style: primaryButton,
            onPressed: () {
              BlocProvider.of<RegisterBloc>(context).add(RegisterCompleteEvent(username: usernameController.text, nationality: nationality, residence: residenceCountry, nativeLanguage: nativeLanguage, spokenLanguages: spokenLanguage, selectedHobbies: _hobbiesController.selectedIndexes.toList(), photoUrl: photoUrl));
            },
            child: const Text("Ok, Cool")
        )
      ],
    ),
  );
}

// Fields
Widget signupTextField(
    BuildContext context, TextEditingController controller, String hintText) {
  return TextField(
    controller: controller,
    textAlign: TextAlign.center,
    style: const TextStyle(fontWeight: FontWeight.bold),
    decoration: InputDecoration(
        hintText: hintText,
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Theme.of(context).primaryColor),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Theme.of(context).primaryColor),
        )),
  );
}

Widget signupConfirmCodeField(
    BuildContext context, TextEditingController controller) {
  return PinCodeTextField(
    controller: controller,
    enableActiveFill: true,
    appContext: context,
    length: 6,
    onChanged: (String value) {},
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
  
}
