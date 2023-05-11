import 'package:flutter/material.dart';
import 'package:waaa/core/constants/image_constants.dart';
import 'package:waaa/core/route/routes.dart' as route;
import 'package:waaa/core/theme/common_widget/button.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:waaa/core/theme/text_styles.dart';
import 'package:waaa/core/util/localized.dart';

import '../../../../core/constants/spacer.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(backgroundImage),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(50),
            child: Column(
              children: [
                vSpace350,
                Text(
                  AppLocalizations.of(context)!.appName,
                  style: appNameTextStyle,
                ),
                vSpace150,
                ElevatedButton(
                    style: secondaryButton,
                    onPressed: () {
                      Navigator.pushNamed(context, route.loginPage);
                    },
                    child: Text(
                      AppLocalizations.of(context)!.signin,
                      style: boldTextStyle12,
                    )),
                vSpace15,
                ElevatedButton(
                    style: outlinedWhiteButton,
                    onPressed: () {
                      Navigator.pushNamed(context, route.signupPage);
                    },
                    child: Text(
                      localized(context).signup,
                      style: boldWhiteTextStyle12,
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
