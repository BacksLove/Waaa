import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:waaa/core/theme/colors.dart';

class WaaaDatePicker extends StatelessWidget {
  const WaaaDatePicker(
      {super.key, required this.controller, required this.label});

  final TextEditingController controller;
  final String label;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      enabled: true,
      readOnly: true,
      decoration: InputDecoration(
        labelText: label,
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
        DatePicker.showDateTimePicker(context,
            showTitleActions: true,
            minTime: DateTime(2018, 3, 5),
            maxTime: DateTime(2019, 6, 7),
            onChanged: (date) {}, onConfirm: (date) {
          controller.text =
              "${date.day}/${date.month}/${date.year} à ${date.hour}:${date.minute}";
        }, currentTime: DateTime.now(), locale: LocaleType.fr);
      },
    );
  }
}
