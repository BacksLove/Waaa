import 'package:equatable/equatable.dart';

import '../../../../core/usecases/usecase.dart';
import '../repositories/auth_repository.dart';

class ConfirmSignUp extends UseCase<bool, ConfirmSignUpParams> {
  final AuthRepository repository;

  ConfirmSignUp(this.repository);

  @override
  Future<bool> call(ConfirmSignUpParams params) async {
    return await repository.confirmSignUp(params.email, params.code);
  }
}

class ConfirmSignUpParams extends Equatable {
  final String email;
  final String code;

  const ConfirmSignUpParams({required this.email, required this.code})
      : super();

  @override
  List<Object?> get props => [email, code];
}
