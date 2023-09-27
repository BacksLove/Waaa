import 'package:datetime_picker_formfield_new/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker_bdaya/flutter_datetime_picker_bdaya.dart';
import 'package:intl/intl.dart';
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
        DatePickerBdaya.showDateTimePicker(context,
            showTitleActions: true,
            minTime: DateTime(2018, 3, 5),
            maxTime: DateTime(2019, 6, 7),
            onChanged: (date) {}, onConfirm: (date) {
          controller.text = date.toString();
        }, currentTime: DateTime.now(), locale: LocaleType.fr);
      },
    );
  }
}

class WaaaDateTimeFieldPicker extends StatelessWidget {
  WaaaDateTimeFieldPicker(
      {super.key, required this.label, required this.onSelectedDate});

  final format = DateFormat("yyyy-MM-dd HH:mm");
  final String label;
  final Function onSelectedDate;

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      DateTimeField(
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
        format: format,
        onShowPicker: (context, currentValue) async {
          return await showDatePicker(
            context: context,
            firstDate: DateTime(1900),
            initialDate: currentValue ?? DateTime.now(),
            lastDate: DateTime(2100),
          ).then((DateTime? date) async {
            if (date != null) {
              final time = await showTimePicker(
                context: context,
                initialTime:
                    TimeOfDay.fromDateTime(currentValue ?? DateTime.now()),
              );
              onSelectedDate(DateTimeField.combine(date, time));
              return DateTimeField.combine(date, time);
            } else {
              return currentValue;
            }
          });
        },
      ),
    ]);
  }
}
