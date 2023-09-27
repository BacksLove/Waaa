import 'package:flutter/material.dart';
import 'package:waaa/core/theme/text_styles.dart';
import 'package:waaa/core/util/localized.dart';

Future<void> showMyDialog(
    BuildContext context, String title, Widget content) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(
          title,
          style: boldTextStyle16,
        ),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[content],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: Text(localized(context).next),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
