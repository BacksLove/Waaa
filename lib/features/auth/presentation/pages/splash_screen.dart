import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SvgPicture.asset("assets/images/logoWaaa.svp"),
            const SizedBox(height: 20,),
            const CircularProgressIndicator()
          ],
        ),
      ),
    );
  }
}
