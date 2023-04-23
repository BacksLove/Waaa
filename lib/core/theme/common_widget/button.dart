import 'package:flutter/material.dart';

import '../colors.dart';

final ButtonStyle primaryButton = ElevatedButton.styleFrom(
  elevation: 0,
  backgroundColor: primaryColor,
  foregroundColor: Colors.white,
  minimumSize: const Size.fromHeight(45),
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(50),
  ),
);

final ButtonStyle secondaryButton = ElevatedButton.styleFrom(
  elevation: 0,
  backgroundColor: secondaryColor,
  foregroundColor: Colors.black,
  minimumSize: const Size.fromHeight(45),
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(50),
  ),
);

final ButtonStyle outlinedPrimaryButton = ElevatedButton.styleFrom(
  elevation: 0,
  backgroundColor: transparentColor,
  foregroundColor: Colors.black,
  minimumSize: const Size.fromHeight(45),
  shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(50),
      side: BorderSide(width: 1, color: primaryColor)),
);

final ButtonStyle outlinedWhiteButton = ElevatedButton.styleFrom(
  elevation: 0,
  backgroundColor: transparentColor,
  foregroundColor: Colors.white,
  minimumSize: const Size.fromHeight(45),
  shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(50),
      side: const BorderSide(width: 1, color: Colors.white)),
);

final ButtonStyle outlinedBlackButton = ElevatedButton.styleFrom(
  elevation: 0,
  backgroundColor: transparentColor,
  foregroundColor: Colors.black,
  minimumSize: const Size.fromHeight(45),
  shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(50),
      side: const BorderSide(width: 1, color: Colors.black)),
);

final ButtonStyle yellowButton = ElevatedButton.styleFrom(
  elevation: 0,
  backgroundColor: yellowColor,
  foregroundColor: primaryColor,
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(50),
  ),
);

final ButtonStyle googleButton = ElevatedButton.styleFrom(
  elevation: 0,
  backgroundColor: googleColor,
  foregroundColor: Colors.white,
  minimumSize: const Size.fromHeight(45),
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(50),
  ),
);

final ButtonStyle facebookButton = ElevatedButton.styleFrom(
  elevation: 0,
  backgroundColor: facebookColor,
  foregroundColor: Colors.white,
  minimumSize: const Size.fromHeight(45),
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(50),
  ),
);

Widget waaaButton(BuildContext context, String text) {
  return ElevatedButton(
    onPressed: () {},
    style: ElevatedButton.styleFrom(
      elevation: 0,
      backgroundColor: Theme.of(context).primaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(50),
      ),
    ),
    child: Padding(
      padding: const EdgeInsets.all(10.0),
      child: Text(text),
    ),
  );
}
