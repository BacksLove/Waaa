import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:waaa/core/theme/colors.dart';

class SignupTextfieldWidget extends StatelessWidget {
  const SignupTextfieldWidget({
    super.key,
    required this.controller,
    required this.hintText,
    this.errorText,
    this.isEnabled = true,
  });

  final TextEditingController controller;
  final String hintText;
  final String? errorText;
  final bool isEnabled;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      textAlign: TextAlign.center,
      enabled: isEnabled,
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

class SignupPasswordTextfieldWidget extends StatefulWidget {
  const SignupPasswordTextfieldWidget({
    super.key,
    required this.controller,
    required this.hintText,
    this.errorText,
  });

  final TextEditingController controller;
  final String hintText;
  final String? errorText;

  @override
  State<SignupPasswordTextfieldWidget> createState() =>
      _SignupPasswordTextfieldWidgetState();
}

class _SignupPasswordTextfieldWidgetState
    extends State<SignupPasswordTextfieldWidget> {
  bool isClear = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      textAlign: TextAlign.center,
      obscureText: isClear,
      style: const TextStyle(fontWeight: FontWeight.bold),
      decoration: InputDecoration(
          labelText: widget.hintText,
          errorText: widget.errorText,
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Theme.of(context).primaryColor),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Theme.of(context).primaryColor),
          ),
          suffixIcon: IconButton(
            icon: isClear
                ? Icon(Ionicons.eye, color: primaryColor)
                : Icon(Ionicons.eye_off, color: primaryColor),
            onPressed: () {
              setState(() {
                isClear = !isClear;
              });
            },
          )),
    );
  }
}
