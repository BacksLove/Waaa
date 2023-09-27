import 'package:image_picker/image_picker.dart';

class TripPhotos {
  final String destination;
  final List<XFile?> photoFile;
  final List<String> photoPath;

  TripPhotos(
      {required this.destination,
      required this.photoFile,
      required this.photoPath});

  TripPhotos copyWith({
    String? destination,
    List<XFile?>? photoFile,
    List<String>? photoPath,
  }) {
    return TripPhotos(
      destination: destination ?? this.destination,
      photoFile: photoFile ?? this.photoFile,
      photoPath: photoPath ?? this.photoPath,
    );
  }
}
