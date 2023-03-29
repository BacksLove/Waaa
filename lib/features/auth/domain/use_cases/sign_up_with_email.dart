import 'package:equatable/equatable.dart';

import '../../../../core/usecases/usecase.dart';
import '../entities/aws_user_entity.dart';
import '../repositories/auth_repository.dart';

class SignUpWithEmail extends UseCase<bool, Params>{
  final AuthRepository repository;

  SignUpWithEmail(this.repository);

  @override
  Future<bool> call (Params params) async {
    var result = await repository.signUpWithEmail(params.email, params.password);
    if (result) {
      await repository.fetchCurrentUserAttributes();
    }
    return result;
  }
}

class Params extends Equatable {
  final String email;
  final String password;

  const Params({required this.email, required this.password}) : super();

  @override
  List<Object?> get props => [email, password];
}