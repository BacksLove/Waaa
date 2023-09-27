import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';
import 'package:waaa/features/users/domain/repositories/user_repository.dart';

import '../../../../core/usecases/usecase.dart';

class UploadPhoto extends UseCase<String?, UploadUserPhotoParams> {
  final UserRepository repository;

  UploadPhoto(this.repository);

  @override
  Future<String?> call(UploadUserPhotoParams params) async {
    return await repository.uploadPhoto(
        params.file, params.directory, params.url, params.photoName);
  }
}

class UploadUserPhotoParams extends Equatable {
  final XFile file;
  final String directory;
  final String url;
  final String photoName;

  const UploadUserPhotoParams(
      {required this.file,
      required this.directory,
      required this.url,
      required this.photoName})
      : super();

  @override
  List<Object?> get props => [file, directory, url, photoName];
}
