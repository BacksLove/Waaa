import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';
import 'package:waaa/features/users/domain/repositories/user_repository.dart';

import '../../../../core/usecases/usecase.dart';

class UploadUserPhoto extends UseCase<String?, UploadUserPhotoParams> {
  final UserRepository repository;

  UploadUserPhoto(this.repository);

  @override
  Future<String?> call(UploadUserPhotoParams params) async {
    return await repository.uploadUserPhoto(params.file, params.userId);
  }
}

class UploadUserPhotoParams extends Equatable {
  final XFile file;
  final String userId;

  const UploadUserPhotoParams({required this.file, required this.userId})
      : super();

  @override
  List<Object?> get props => [file, userId];
}
