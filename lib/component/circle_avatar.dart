import 'package:flutter/material.dart';
import 'package:waaa/core/constants/image_constants.dart';

class WaaaCircleAvatar extends StatelessWidget {
  const WaaaCircleAvatar(
      {super.key, required this.photo, this.height, this.width});

  final String? photo;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? 50,
      height: height ?? 50,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          image: NetworkImage(photo ?? noPhotoImage),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
