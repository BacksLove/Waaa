import 'package:flutter/material.dart';
import 'package:language_picker/language_picker.dart';
import 'package:language_picker/languages.dart';
import 'package:waaa/core/theme/colors.dart';
import 'package:waaa/core/theme/text_styles.dart';
import 'package:waaa/core/util/localized.dart';

import '../core/theme/common_widget/button.dart';

class LanguagePicker extends StatelessWidget {
  const LanguagePicker({
    super.key,
    required this.textButton,
    required this.callback,
    this.buttonStyle,
  });

  final String textButton;
  final Function callback;
  final ButtonStyle? buttonStyle;

  Widget _buildDialogItem(Language language) {
    return Row(
      children: <Widget>[
        Text(language.name),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: buttonStyle ?? primaryButton,
      onPressed: () {
        showDialog(
          context: context,
          builder: (context) => Theme(
            data: Theme.of(context).copyWith(primaryColor: primaryColor),
            child: LanguagePickerDialog(
              titlePadding: const EdgeInsets.all(8.0),
              searchCursorColor: primaryColor,
              searchInputDecoration:
                  InputDecoration(hintText: localized(context).search),
              isSearchable: true,
              title: Text(textButton),
              onValuePicked: (Language language) {
                callback(language);
              },
              itemBuilder: _buildDialogItem,
            ),
          ),
        );
      },
      child: Text(
        textButton,
        style: regularTextStyle16,
      ),
    );
  }
}
