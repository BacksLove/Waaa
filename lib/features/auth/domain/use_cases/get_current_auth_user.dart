
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';

import '../../../../core/usecases/usecase.dart';
import '../repositories/auth_repository.dart';

class GetCurrentAuthUser extends UseCase<AuthUser, NoParams> {
  final AuthRepository repository;

  GetCurrentAuthUser(this.repository);

  @override
  Future<AuthUser> call(NoParams params) async {
    return await repository.getCurrentAuthUser();
  }
}
