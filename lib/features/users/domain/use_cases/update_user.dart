import 'package:equatable/equatable.dart';
import 'package:waaa/models/User.dart';

import '../../../../core/usecases/usecase.dart';
import '../repositories/user_repository.dart';

class UpdateUser extends UseCase<bool, UpdateUserParams> {
  final UserRepository repository;

  UpdateUser(this.repository);

  @override
  Future<bool> call(UpdateUserParams params) async {
    return await repository.createUser(params.user);
  }
}

class UpdateUserParams extends Equatable {
  final User user;

  const UpdateUserParams({required this.user}) : super();

  @override
  List<Object?> get props => [user];
}
