import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';

import '../../../../core/usecases/usecase.dart';
import '../repositories/auth_repository.dart';

class GetCurrentAuthSession extends UseCase<AuthSession, NoParams> {
  final AuthRepository repository;

  GetCurrentAuthSession(this.repository);

  @override
  Future<AuthSession> call(NoParams params) async {
    return await repository.getCurrentAuthSession();
  }
}
