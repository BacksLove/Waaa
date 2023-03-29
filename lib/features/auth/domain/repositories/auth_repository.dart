import '../entities/aws_user_entity.dart';

abstract class AuthRepository {
  Future<bool> loginWithEmail(String email, String password);
  Future<bool> signUpWithEmail(String email, String password);
  Future<bool> confirmSignUp(String email, String code);
  Future<bool> loginWithFacebook();
  Future<bool> loginWithGoogle();
  Future<String> fetchCurrentUserAttributes();
  Future<void> logOut();
}