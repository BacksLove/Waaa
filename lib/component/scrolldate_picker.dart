import 'package:flutter/material.dart';

import 'package:scroll_date_picker/scroll_date_picker.dart';

class WaaaScrollDatePicker extends StatefulWidget {
  const WaaaScrollDatePicker({super.key, required this.callback, this.maxDate});

  final Function callback;
  final DateTime? maxDate;

  @override
  State<WaaaScrollDatePicker> createState() => _WaaaScrollDatePickerState();
}

class _WaaaScrollDatePickerState extends State<WaaaScrollDatePicker> {
  DateTime _selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return ScrollDatePicker(
      selectedDate: _selectedDate,
      locale: const Locale('fr'),
      options: const DatePickerOptions(
        isLoop: false,
      ),
      maximumDate: widget.maxDate,
      onDateTimeChanged: (DateTime value) {
        widget.callback(value);
        setState(
          () {
            _selectedDate = value;
          },
        );
      },
    );
  }
}
