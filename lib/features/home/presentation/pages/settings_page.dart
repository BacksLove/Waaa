import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:waaa/core/constants/image_constants.dart';
import 'package:waaa/core/constants/spacer.dart';
import 'package:waaa/core/enums/authentication_enum.dart';
import 'package:waaa/core/theme/colors.dart';
import 'package:waaa/core/theme/text_styles.dart';
import 'package:waaa/core/util/localized.dart';

import 'package:waaa/injection_container.dart' as di;
import 'package:waaa/core/route/routes.dart' as route;

import '../../../auth/presentation/manager/auth_bloc/auth_bloc.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(FeatherIcons.x),
          color: Colors.black,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Image.asset(
          appBarImage,
        ),
        backgroundColor: transparentColor,
        elevation: 0,
      ),
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state.status == AuthenticationStatus.unauthenticated) {
            Navigator.pushReplacementNamed(context, route.authPage);
          }
        },
        child: ListView(children: [
          Container(
            padding: const EdgeInsets.only(left: 15.0, top: 20.0),
            child: Text(
              "Parametres du profil",
              style: semiBoldTextStyle16,
            ),
          ),
          vSpace15,
          SettingsTile(title: localized(context).about_us),
          SettingsTile(title: localized(context).our_history),
          SettingsTile(
              title: localized(context)
                  .charter_for_the_use_of_cookies_and_tracers),
          SettingsTile(title: localized(context).general_conditions_of_terms),
          SettingsTile(title: localized(context).legal_notice),
          SettingsTile(title: localized(context).privacy_policy),
          SettingsTile(title: localized(context).my_premium_account),
          SettingsTile(title: localized(context).account),
          SettingsTile(
              title: "Déconnexion",
              function: () {
                di.sl<AuthBloc>().add(LoggedOut());
              }),
        ]),
      ),
    );
  }
}

class SettingsTile extends StatelessWidget {
  final String title;
  final String? subtitle;
  final Function? function;

  const SettingsTile(
      {super.key, required this.title, this.subtitle, this.function});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: semiBoldTextStyle16,
      ),
      subtitle: subtitle != null
          ? Text(
              subtitle!,
              style: settingSubtitleTextStyle,
            )
          : null,
      trailing: function != null
          ? TextButton(
              onPressed: function as void Function()?,
              child: Text(
                localized(context).modify,
                style: boldTextStyle12,
              ),
            )
          : null,
    );
  }
}
