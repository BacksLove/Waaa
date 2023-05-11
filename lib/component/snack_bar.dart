import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:waaa/core/theme/colors.dart';

void showSnackBar(BuildContext context, String message) {
  final snackbar = SnackBar(content: Text(message));
  ScaffoldMessenger.of(context).showSnackBar(snackbar);
}

void showFloatingFlushbar(BuildContext context, String? title, String message) {
  Flushbar(
    margin: const EdgeInsets.all(20),
    borderRadius: BorderRadius.circular(8.0),
    backgroundGradient: LinearGradient(
      colors: [primaryColor, lightPrimaryColor],
      stops: const [0.6, 1],
    ),
    boxShadows: [
      BoxShadow(
        color: blackColor,
        offset: const Offset(3, 3),
        blurRadius: 3,
      ),
    ],
    // All of the previous Flushbars could be dismissed by swiping down
    // now we want to swipe to the sides
    dismissDirection: FlushbarDismissDirection.HORIZONTAL,
    // The default curve is Curves.easeOut
    forwardAnimationCurve: Curves.fastLinearToSlowEaseIn,
    title: title,
    message: message,
    duration: const Duration(seconds: 4),
  ).show(context);
}
