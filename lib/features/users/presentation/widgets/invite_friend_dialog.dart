import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:waaa/component/alertdialog.dart';
import 'package:waaa/core/theme/colors.dart';
import 'package:waaa/core/theme/common_widget/button.dart';
import 'package:waaa/core/theme/text_styles.dart';
import 'package:waaa/core/util/localized.dart';
import 'package:waaa/models/ModelProvider.dart';

class InviteFriendDialog extends StatelessWidget {
  const InviteFriendDialog(
      {super.key, required this.users, required this.onTap});

  final List<User> users;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ElevatedButton.icon(
        style: outlinedPrimaryButton,
        onPressed: () {
          showMyDialog(
            context,
            localized(context).coorganizers,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  for (var user in users) ...{
                    GestureDetector(
                      onTap: () {
                        onTap(user);
                      },
                      child: Text(
                        user.username,
                        style: regularTextStyle16,
                      ),
                    ),
                    const Divider(),
                  }
                ],
              ),
            ),
          );
        },
        icon: Icon(
          FeatherIcons.plusCircle,
          color: lightPrimaryColor,
        ),
        label: Text(
          localized(context).add_coorganizer,
          style: regularTextStyle16,
        ),
      ),
    );
  }
}
