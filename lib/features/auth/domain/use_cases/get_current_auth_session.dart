import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/constants/constants.dart';
import '../../../../core/usecases/usecase.dart';
import '../repositories/auth_repository.dart';
import 'package:waaa/injection_container.dart' as di;

class GetCurrentAuthSession extends UseCase<AuthSession, NoParams> {
  final AuthRepository repository;

  GetCurrentAuthSession(this.repository);

  @override
  Future<AuthSession> call(NoParams params) async {
    return await repository.getCurrentAuthSession();
  }
}
