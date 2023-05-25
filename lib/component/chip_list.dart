import 'package:flutter/material.dart';
import 'package:waaa/core/theme/colors.dart';
import 'package:waaa/models/User.dart';

class ChipListWidget extends StatefulWidget {
  const ChipListWidget({super.key, required this.users});

  final List<User> users;

  @override
  State<ChipListWidget> createState() => _ChipListWidgetState();
}

class _ChipListWidgetState extends State<ChipListWidget> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.users.length,
      itemBuilder: (context, index) {
        return ChipWidget(
          currentUser: widget.users[index],
          onDelete: () {
            setState(() {
              widget.users.removeAt(index);
            });
          },
        );
      },
    );
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
