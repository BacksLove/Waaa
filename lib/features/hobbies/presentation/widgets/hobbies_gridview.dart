import 'package:flutter/material.dart';
import 'package:waaa/core/theme/colors.dart';
import 'package:waaa/core/theme/text_styles.dart';
import 'package:waaa/models/Hobby.dart';
import 'package:waaa/models/HobbyOfUser.dart';

class HobbiesGridWidget extends StatelessWidget {
  const HobbiesGridWidget({super.key, required this.hobbies});

  final List<HobbyOfUser> hobbies;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      direction: Axis.horizontal,
      alignment: WrapAlignment.start,
      spacing: 10,
      children: [
        for (var hobby in hobbies) HobbyTile(hobby: hobby.hobby),
      ],
    );
  }
}

class HobbyTile extends StatelessWidget {
  final Hobby hobby;

  const HobbyTile({Key? key, required this.hobby}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Chip(
      backgroundColor: secondaryColor,
      label: Text(
        hobby.name,
        style: boldTextStyle12,
      ),
      side: BorderSide(
        color: primaryColor,
        width: 1,
      ),
    );
  }
}
