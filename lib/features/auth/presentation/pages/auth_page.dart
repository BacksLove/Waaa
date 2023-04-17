import 'package:flutter/material.dart';
import 'package:waaa/core/route/routes.dart' as route;
import 'package:waaa/core/theme/common_widget/button.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:waaa/core/util/localized.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/authBackground.jpeg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(50),
            child: Column(
              children: [
                const SizedBox(height: 350),
                Text(
                  AppLocalizations.of(context)!.appName,
                  style: const TextStyle(color: Colors.white, fontSize: 33),
                ),
                const SizedBox(height: 171),
                ElevatedButton(
                    style: secondaryButton,
                    onPressed: () {
                      Navigator.pushNamed(context, route.loginPage);
                    },
                    child: Text(AppLocalizations.of(context)!.login)),
                const SizedBox(
                  height: 14,
                ),
                ElevatedButton(
                    style: outlinedWhiteButton,
                    onPressed: () {
                      Navigator.pushNamed(context, route.signupPage);
                    },
                    child: Text(localized(context).signup)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
