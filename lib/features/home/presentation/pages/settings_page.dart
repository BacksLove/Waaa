import 'package:flutter/material.dart';
import 'package:waaa/core/theme/colors.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: transparentColor,
        elevation: 0,
      ),
      body: ListView(
        children: [
          const Text(
            "Parametres du profil",
            style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 15,
                color: Colors.black
            ),
          ),
          const SizedBox(height: 15,),
          SettingsTile(title: "Adresse e-mail", subtitle: "bacar@mail.com", function: () { print("Modifier"); }),
          SettingsTile(title: "Pseudo", subtitle: "Backslova", function: () { print("Modifier");}),
          SettingsTile(title: "Pseudo", subtitle: "Backslova", function: () { print("Modifier");}),
          SettingsTile(title: "Pseudo", subtitle: "Backslova", function: () { print("Modifier");}),
          SettingsTile(title: "Pseudo", subtitle: "Backslova", function: () { print("Modifier");}),
          SettingsTile(title: "Pseudo", subtitle: "Backslova", function: () { print("Modifier");}),
          SettingsTile(title: "Pseudo", subtitle: "Backslova", function: () { print("Modifier");}),
          const SettingsTile(title: "Nous contacter"),
          const SettingsTile(title: "Nous contacter"),
          const SettingsTile(title: "Nous contacter"),
          const SettingsTile(title: "Nous contacter"),
          const SettingsTile(title: "Nous contacter"),
          const SettingsTile(title: "Nous contacter"),

        ]
      ),
    );
  }
}



class SettingsTile extends StatelessWidget {
  final String title;
  final String? subtitle;
  final Function? function;

  const SettingsTile({super.key, required this.title, this.subtitle, this.function});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: const TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 15,
            color: Colors.black
        ),
      ),
      subtitle: subtitle != null ?
      Text(
        subtitle!,
        style: TextStyle(
          fontWeight: FontWeight.normal,
          fontSize: 9,
          color: lightGrayColor,
        ),
      )
          : null,
      trailing: function != null
          ? TextButton(
            onPressed: function as void Function()?,
            child: const Text(
              "Modifier",
              style: TextStyle(
                  color: Colors.black
              ),
            ),
      )
          : null,
    );
  }
}
