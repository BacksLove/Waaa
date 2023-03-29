import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:waaa/core/constants/constants.dart';
import 'package:waaa/injection_container.dart' as di;

import '../../domain/entities/aws_user_entity.dart';

abstract class AuthRemoteDataSource {
  Future<bool> loginWithEmail(String email, String password);
  Future<bool> signUpWithEmail(String email, String password);
  Future<bool> confirmSignUp(String email, String code);
  Future<bool> loginWithFacebook();
  Future<bool> loginWithGoogle();
  Future<String> fetchCurrentUserAttributes();
  Future<void> logOut();
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final bool isLogged = false;

  @override
  Future<bool> loginWithEmail(String email, String password) async {
    try {
     final result = await Amplify.Auth.signIn(
       username: email,
       password: password,
     );
     return result.isSignedIn;
   } on AuthException catch(e) {
      safePrint(e.message);
     return false;
   }
  }

  @override
  Future<bool> signUpWithEmail(String email, String password) async {
    try {
      final userAttributes = <CognitoUserAttributeKey, String>{
        CognitoUserAttributeKey.email: email,
      };
      final result = await Amplify.Auth.signUp(
        username: email,
        password: password,
        options: CognitoSignUpOptions(userAttributes: userAttributes),
      );
      return result.isSignUpComplete;
    } on AuthException catch (e) {
      safePrint(e.message);
      return false;
    }
  }

  @override
  Future<bool> confirmSignUp(String email, String code) async {
    try {
      final result = await Amplify.Auth.confirmSignUp(
          username: email,
          confirmationCode: code
      );
      return result.isSignUpComplete;
    } on AuthException catch (e) {
      safePrint(e.message);
      return false;
    }
  }

  @override
  Future<bool> loginWithFacebook() {
    // TODO: implement loginWithFacebook
    throw UnimplementedError();
  }

  @override
  Future<bool> loginWithGoogle() {
    // TODO: implement loginWithGoogle
    throw UnimplementedError();
  }


  @override
  Future<String> fetchCurrentUserAttributes() async {
    try {
      final result = await Amplify.Auth.fetchUserAttributes();
      for (final element in result) {
        if (element.userAttributeKey == idKey) {
          return element.value;
        }
      }
      return "No Id found";
    } on AuthException catch (e) {
      print(e.message);
      return "No user";
    }
  }

  @override
  Future<void> logOut() async {
    try {
      await Amplify.Auth.signOut();
    } on AuthException catch (e) {
      safePrint(e.message);
    }
  }


}