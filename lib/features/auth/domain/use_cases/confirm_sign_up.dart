import 'package:equatable/equatable.dart';

import '../../../../core/usecases/usecase.dart';
import '../repositories/auth_repository.dart';

class ConfirmSignUp extends UseCase<bool, Params>{
  final AuthRepository repository;

  ConfirmSignUp(this.repository);

  @override
  Future<bool> call (Params params) async {
    return await repository.loginWithEmail(params.email, params.code);
  }
}

class Params extends Equatable {
  final String email;
  final String code;

  const Params({ required this.email, required this.code}) : super();

  @override
  List<Object?> get props => [email, code];
}