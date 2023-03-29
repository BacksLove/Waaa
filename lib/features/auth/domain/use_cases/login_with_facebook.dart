import 'package:waaa/core/usecases/usecase.dart';
import 'package:waaa/features/auth/domain/repositories/auth_repository.dart';

class LoginWithFacebook extends UseCase<bool, NoParams>{
  final AuthRepository repository;

  LoginWithFacebook(this.repository);

  @override
  Future<bool> call(NoParams params) {
    var remoteLogin = repository.loginWithFacebook();

    return remoteLogin;
  }
}