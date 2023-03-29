import 'package:equatable/equatable.dart';
import 'package:waaa/core/usecases/usecase.dart';

import '../repositories/auth_repository.dart';

class LoginWithEmail extends UseCase<bool, Params>{
  final AuthRepository repository;

  LoginWithEmail(this.repository);

  @override
  Future<bool> call (Params params) async {
    return await repository.loginWithEmail(params.email, params.password);
  }
}

class Params extends Equatable {
  final String email;
  final String password;

  const Params({ required this.email, required this.password}) : super();

  @override
  List<Object?> get props => [email, password];
}