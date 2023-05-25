import 'package:flutter/material.dart';
import 'package:waaa/core/constants/spacer.dart';
import 'package:waaa/core/theme/text_styles.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}

class SearchLoadingScreen extends StatelessWidget {
  const SearchLoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const CircularProgressIndicator(),
            vSpace20,
            Text(
              "Recherche en cours",
              style: boldTextStyle16,
            ),
          ],
        ),
      ),
    );
  }
}
