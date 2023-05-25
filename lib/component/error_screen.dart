import 'package:flutter/material.dart';
import 'package:waaa/core/theme/text_styles.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "Une erreur est survenue",
          style: boldTextStyle20,
        ),
      ),
    );
  }
}
