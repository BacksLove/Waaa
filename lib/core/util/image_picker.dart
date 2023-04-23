import 'dart:io';

import 'package:image_picker/image_picker.dart';

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
