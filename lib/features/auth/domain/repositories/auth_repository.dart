import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';

abstract class AuthRepository {
  Future<bool> loginWithEmail(String email, String password);
  Future<bool> signUpWithEmail(String email, String password);
  Future<bool> confirmSignUp(String email, String code);
  Future<bool> loginWithFacebook();
  Future<bool> loginWithGoogle();
  Future<AuthSession> getCurrentAuthSession();
  Future<AuthUser> getCurrentAuthUser();
  Future<void> logOut();
}
