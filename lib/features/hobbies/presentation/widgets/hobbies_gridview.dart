import 'package:flutter/material.dart';
import 'package:waaa/core/theme/colors.dart';
import 'package:waaa/core/theme/text_styles.dart';

import '../../domain/entities/hobby.dart';

class HobbiesGridWidget extends StatelessWidget {
  const HobbiesGridWidget({super.key, required this.hobbies});

  final List<Hobby> hobbies;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.symmetric(vertical: 20),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: hobbies.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 3 / 1,
        crossAxisSpacing: 15,
        mainAxisSpacing: 20,
      ),
      itemBuilder: (BuildContext context, int index) {
        return HobbyTile(hobby: hobbies[index]);
      },
    );
  }
}

class HobbyTile extends StatelessWidget {
  final Hobby hobby;

  const HobbyTile({Key? key, required this.hobby}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: primaryColor,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(50.0),
      ),
      child: Center(
        child: Text(
          hobby.name,
          style: boldTextStyle12,
        ),
      ),
    );
  }
}
