import 'package:equatable/equatable.dart';

import '../../../../core/usecases/usecase.dart';
import '../repositories/auth_repository.dart';

class SignUpWithEmail extends UseCase<bool, SignUpParams> {
  final AuthRepository repository;

  SignUpWithEmail(this.repository);

  @override
  Future<bool> call(SignUpParams params) async {
    var result =
        await repository.signUpWithEmail(params.email, params.password);
    if (result) {
      await repository.getCurrentAuthSession();
    }
    return result;
  }
}

class SignUpParams extends Equatable {
  final String email;
  final String password;

  const SignUpParams({required this.email, required this.password}) : super();

  @override
  List<Object?> get props => [email, password];
}
