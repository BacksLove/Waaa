import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:waaa/core/constants/image_constants.dart';

import '../core/theme/colors.dart';
import 'package:waaa/core/route/routes.dart' as route;

class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  final Size preferredSize;

  const MainAppBar({Key? key})
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
        appBarImage,
      ),
      actions: <Widget>[
        Container(
          padding: const EdgeInsets.only(right: 10.0),
          child: IconButton(
            onPressed: () {
              Navigator.pushNamed(context, route.chatListPage);
            },
            icon: const Icon(
              FeatherIcons.messageSquare,
            ),
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}
