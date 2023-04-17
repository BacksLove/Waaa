import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

import '../core/theme/common_widget/button.dart';

class CountryPicker extends StatelessWidget {
  const CountryPicker(
      {super.key, required this.textButton, required this.callback});

  final String textButton;
  final Function callback;

  @override
  Widget build(BuildContext context) {
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
              callback(value.name);
            },
          );
        },
        child: Text(textButton));
  }
}
