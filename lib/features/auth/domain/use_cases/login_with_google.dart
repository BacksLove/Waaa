import 'package:waaa/core/usecases/usecase.dart';
import 'package:waaa/features/auth/domain/repositories/auth_repository.dart';

class LoginWithGoogle extends UseCase<bool, NoParams>{
  final AuthRepository repository;

  LoginWithGoogle(this.repository);

  @override
  Future<bool> call(NoParams params) {
    var remoteLogin = repository.loginWithGoogle();

    return remoteLogin;
  }
}