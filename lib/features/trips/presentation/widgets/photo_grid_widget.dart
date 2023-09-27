import 'package:flutter/material.dart';
import 'package:waaa/core/theme/colors.dart';

class PhotoGridViewWidget extends StatelessWidget {
  const PhotoGridViewWidget({super.key, required this.photoPath});

  final List<String> photoPath;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: GridView.count(
        scrollDirection: Axis.horizontal,
        crossAxisCount: 2,
        children: [
          for (var photo in photoPath) ...{
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 150,
                width: 150,
                decoration: BoxDecoration(
                    border: Border.all(
                      style: BorderStyle.solid,
                      color: grayColor,
                    ),
                    borderRadius: BorderRadius.circular(15),
                    color: primaryColor),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.network(
                    photo,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          }
        ],
      ),
    );
  }
}
