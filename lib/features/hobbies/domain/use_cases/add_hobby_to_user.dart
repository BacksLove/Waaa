import 'package:equatable/equatable.dart';
import 'package:waaa/core/usecases/usecase.dart';

import '../repositories/hobbies_repository.dart';

class AddHobbyToUser extends UseCase<bool, AddHobbyToUserParams> {
  final HobbiesRepository repository;

  AddHobbyToUser(this.repository);

  @override
  Future<bool> call(AddHobbyToUserParams params) async {
    return await repository.addHobbyToUser(params.hobbyId, params.userId);
  }
}

class AddHobbyToUserParams extends Equatable {
  final String hobbyId;
  final String userId;

  const AddHobbyToUserParams({required this.hobbyId, required this.userId})
      : super();

  @override
  List<Object?> get props => [hobbyId, userId];
}
