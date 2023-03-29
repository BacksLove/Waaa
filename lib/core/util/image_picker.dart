import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:image_picker/image_picker.dart';
import 'package:waaa/features/auth/presentation/manager/signup_bloc/signup_bloc.dart';

import '../../features/users/presentation/manager/register_bloc.dart';

Future<File?> getImage(ImageSource source) async {
  final image = await ImagePicker().pickImage(source: source);
  if (image == null) return null;

  return File(image.path);
}

/*void showImageSourceActionSheet(BuildContext context) {
  selectImageSource(imageSource) {
    context.read<SignupBloc>().add(OpenImagePicker(source: imageSource));
  }

  if (Platform.  isIOS) {
    showCupertinoModalPopup(
        context: context,
        builder: (context) => CupertinoActionSheet(
          actions: [
            CupertinoActionSheetAction(
              onPressed: () {
                Navigator.pop(context);
                selectImageSource(ImageSource.camera);
              },
              child: const Text("Camera"),
            ),
            CupertinoActionSheetAction(
              onPressed: () {
                Navigator.pop(context);
                selectImageSource(ImageSource.gallery);
              },
              child: const Text("Gallery"),
            ),
          ],
        )
    );
  } else {
    showModalBottomSheet(
        context: context,
        builder: (context) => ListView(
          children: [
            ListTile(
              leading: const Icon(FeatherIcons.camera),
              title: const Text("Camera"),
              onTap: () {
                Navigator.pop(context);
                selectImageSource(ImageSource.camera);
              },
            ),
            ListTile(
              leading: const Icon(FeatherIcons.download),
              title: const Text("Gallery"),
              onTap: () {
                Navigator.pop(context);
                selectImageSource(ImageSource.gallery);
              },
            ),
          ],
        )
    );
  }
}*/
