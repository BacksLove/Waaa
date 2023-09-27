import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:waaa/core/theme/colors.dart';
import 'package:waaa/core/util/localized.dart';

import '../core/theme/common_widget/button.dart';

class CountryPicker extends StatelessWidget {
  const CountryPicker(
      {super.key,
      required this.textButton,
      required this.callback,
      this.buttonStyle});

  final String textButton;
  final Function callback;
  final ButtonStyle? buttonStyle;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: buttonStyle ?? primaryButton,
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
                labelText: localized(context).search,
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
              callback(value.name);
            },
          );
        },
        child: Text(textButton));
  }
}

class TextfieldCountryPicker extends StatelessWidget {
  const TextfieldCountryPicker({
    super.key,
    required this.controller,
    required this.textLabel,
    required this.callback,
    this.iconData,
    this.buttonStyle,
  });

  final TextEditingController controller;
  final String textLabel;
  final Function callback;
  final IconData? iconData;
  final ButtonStyle? buttonStyle;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      enabled: true,
      readOnly: true,
      decoration: InputDecoration(
        prefixIcon: iconData != null
            ? Icon(
                iconData,
                color: primaryColor,
              )
            : null,
        labelText: textLabel,
        labelStyle: TextStyle(
          color: lightGrayColor,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: lightGrayColor,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(50.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: lightGrayColor,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(50.0),
        ),
      ),
      onTap: () {
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
              labelText: localized(context).search,
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
            callback(value.countryCode);
          },
        );
      },
    );
  }
}
