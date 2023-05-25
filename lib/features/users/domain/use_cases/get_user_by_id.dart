import 'package:equatable/equatable.dart';
import 'package:waaa/models/User.dart';

import '../../../../core/usecases/usecase.dart';
import '../repositories/user_repository.dart';

class GetUserById extends UseCase<User?, GetUserByIdParams> {
  final UserRepository repository;

  GetUserById(this.repository);

  @override
  Future<User?> call(GetUserByIdParams params) async {
    return await repository.getUserById(params.id);
  }
}

class GetUserByIdParams extends Equatable {
  final String id;

  const GetUserByIdParams({required this.id}) : super();

  @override
  List<Object?> get props => [id];
}
