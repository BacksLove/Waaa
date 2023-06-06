import 'package:flutter/material.dart';
import 'package:waaa/core/theme/colors.dart';

class EventDetailTile extends StatelessWidget {
  const EventDetailTile(
      {Key? key,
      required this.icon,
      required this.tileKey,
      required this.tileValue})
      : super(key: key);

  final IconData icon;
  final String tileKey;
  final String tileValue;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      minLeadingWidth: 5,
      leading: Icon(
        icon,
        color: primaryColor,
      ),
      title: RichText(
        text: TextSpan(
          children: [
            TextSpan(
                text: "$tileKey : ",
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.black)),
            TextSpan(
                text: tileValue,
                style: const TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 18,
                    color: Colors.black))
          ],
        ),
      ),
    );
  }
}
