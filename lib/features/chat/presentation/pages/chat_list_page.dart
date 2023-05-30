import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:waaa/component/circle_avatar.dart';
import 'package:waaa/core/constants/spacer.dart';
import 'package:waaa/core/theme/colors.dart';
import 'package:waaa/core/theme/text_styles.dart';
import 'package:waaa/core/util/localized.dart';

import 'package:waaa/core/route/routes.dart' as route;

class ChatList extends StatelessWidget {
  const ChatList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: transparentColor,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            FeatherIcons.chevronLeft,
            color: blackColor,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          localized(context).message,
          style: appBarTextStyle,
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsetsDirectional.all(20),
        child: Column(
          children: [
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, route.chatPage);
              },
              child: const ChatListTile(),
            ),
            vSpace20,
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, route.chatPage);
              },
              child: const ChatListTile(),
            ),
            vSpace20,
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, route.chatPage);
              },
              child: const ChatListTile(),
            ),
            vSpace20,
          ],
        ),
      ),
    );
  }
}

class ChatListTile extends StatelessWidget {
  const ChatListTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const WaaaCircleAvatar(
          photo: null,
          height: 75,
          width: 75,
        ),
        hSpace20,
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Jayd Ink",
                style: boldTextStyle14,
              ),
              vSpace5,
              Text(
                "Dernier message envoyé",
                style: lightgrayRegularTextStyle12,
              ),
            ],
          ),
        ),
        Text(
          "19:26",
          style: lightgrayRegularTextStyle8,
        ),
      ],
    );
  }
}
