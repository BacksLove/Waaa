import 'package:flutter/material.dart';
import 'package:waaa/core/theme/colors.dart';

class WaaaTextField extends StatelessWidget {
  const WaaaTextField({
    super.key,
    this.controller,
    required this.label,
    this.leadingIcon,
    this.suffixIcon,
    this.isColored = false,
  });

  final TextEditingController? controller;
  final String label;
  final IconData? leadingIcon;
  final IconData? suffixIcon;
  final bool isColored;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        prefixIcon: (leadingIcon != null) ? Icon(leadingIcon) : null,
        suffixIcon: (suffixIcon != null) ? Icon(suffixIcon) : null,
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
