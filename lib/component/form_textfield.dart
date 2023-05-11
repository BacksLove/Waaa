import 'package:flutter/material.dart';
import 'package:waaa/core/theme/colors.dart';

class WaaaTextField extends StatelessWidget {
  const WaaaTextField({
    super.key,
    required this.controller,
    required this.label,
    this.icondata,
    this.isColored = false,
  });

  final TextEditingController controller;
  final String label;
  final IconData? icondata;
  final bool isColored;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        suffixIcon: (icondata != null) ? Icon(icondata) : null,
        labelText: label,
        labelStyle: const TextStyle(
          color: Colors.black,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: (isColored) ? primaryColor : lightGrayColor,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(50.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: (isColored) ? primaryColor : lightGrayColor,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(50.0),
        ),
      ),
    );
  }
}
