import 'package:equatable/equatable.dart';
import 'package:waaa/features/users/domain/repositories/user_repository.dart';

import '../../../../core/usecases/usecase.dart';
import '../entities/user_entity.dart';

class CreateUser extends UseCase<bool, CreateUserParams> {
  final UserRepository repository;

  CreateUser(this.repository);

  @override
  Future<bool> call(CreateUserParams params) async {
    return await repository.createUser(params.user);
  }
}

class CreateUserParams extends Equatable {
  final User user;

  const CreateUserParams({required this.user}) : super();

  @override
  List<Object?> get props => [user];
}
