import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:waaa/core/usecases/usecase.dart';
import 'package:waaa/features/auth/domain/use_cases/log_out.dart';
import 'package:waaa/features/auth/presentation/manager/auth_bloc/auth_bloc.dart';

import '../core/theme/colors.dart';
import 'package:waaa/core/route/routes.dart' as route;
import 'package:waaa/injection_container.dart' as di;

class MainAppBar extends StatelessWidget with PreferredSizeWidget {
  @override
  final Size preferredSize;

  MainAppBar({Key? key})
      : preferredSize = const Size.fromHeight(kToolbarHeight),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: transparentColor,
      elevation: 0,
      centerTitle: true,
      leading: IconButton(
        icon: const Icon(FeatherIcons.menu),
        color: Colors.black,
        onPressed: () {
          Navigator.pushNamed(context, route.settingsPage);
        },
      ),
      title: Image.asset(
        "assets/images/logoWaaa.png",
      ),
      actions: <Widget>[
        Padding(
          padding: const EdgeInsets.only(right: 10.0),
          child: ElevatedButton(
            onPressed: () {
              di.sl<AuthBloc>().add(LoggedOut());
            },
            style: ElevatedButton.styleFrom(
              elevation: 0,
              backgroundColor: yellowColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
            ),
            child: Text(
              'Message',
              style: TextStyle(
                color: primaryColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
