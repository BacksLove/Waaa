import 'package:flutter/material.dart';
import 'package:waaa/core/theme/colors.dart';

import '../features/users/domain/entities/user_entity.dart';

class ChipListWidget extends StatelessWidget {
  const ChipListWidget({super.key, required this.users});

  final List<User> users;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          ChipWidget(
              currentUser: users[index],
              onDelete: () {
                users.removeAt(index);
              });
        });
  }
}

class ChipWidget extends StatelessWidget {
  const ChipWidget(
      {super.key, required this.currentUser, required this.onDelete});

  final User currentUser;
  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
    return Chip(
      shape: StadiumBorder(side: BorderSide(color: primaryColor)),
      avatar: CircleAvatar(
        backgroundColor: Colors.white70,
        child: (currentUser.photo != null)
            ? Image.network(currentUser.photo!)
            : Image.asset(""),
      ),
      label: Text(currentUser.username),
      onDeleted: onDelete,
    );
  }
}
