import 'package:flutter/material.dart';

class SignupTextfieldWidget extends StatelessWidget {
  const SignupTextfieldWidget({
    super.key,
    required this.controller,
    required this.hintText,
    this.errorText,
  });

  final TextEditingController controller;
  final String hintText;
  final String? errorText;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      textAlign: TextAlign.center,
      style: const TextStyle(fontWeight: FontWeight.bold),
      decoration: InputDecoration(
          labelText: hintText,
          errorText: errorText,
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Theme.of(context).primaryColor),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Theme.of(context).primaryColor),
          )),
    );
  }
}
