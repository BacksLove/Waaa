import 'package:shared_preferences/shared_preferences.dart';
import 'package:waaa/core/platform/network_info.dart';

import '../../../../core/constants/constants.dart';
import '../../domain/repositories/auth_repository.dart';
import '../data_sources/auth_remote_datasource.dart';
import 'package:waaa/injection_container.dart' as di;

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  AuthRepositoryImpl({
    required this.remoteDataSource,
    required this.networkInfo
  });

  @override
  Future<bool> loginWithEmail(String email, String password) async {
    await networkInfo.isConnected;
    final remoteLogin = await remoteDataSource.loginWithEmail(email, password);
    // C'est ici pour mettre les données en cache si besoin
    return remoteLogin;
  }

  @override
  Future<bool> signUpWithEmail(String email, String password) async {
    await networkInfo.isConnected;
    final remoteLogin = await remoteDataSource.signUpWithEmail(email, password);

    return remoteLogin;
  }

  @override
  Future<bool> confirmSignUp(String email, String code) async {
    await networkInfo.isConnected;
    final remoteLogin = await remoteDataSource.confirmSignUp(email, code);
    // C'est ici pour mettre les données en cache si besoin
    return remoteLogin;
  }

  @override
  Future<bool> loginWithFacebook() async {
    await networkInfo.isConnected;
    final remoteLogin = await remoteDataSource.loginWithFacebook();
    // C'est ici pour mettre les données en cache si besoin
    return remoteLogin;
  }

  @override
  Future<bool> loginWithGoogle() async {
    await networkInfo.isConnected;
    final remoteLogin = await remoteDataSource.loginWithGoogle();
    // C'est ici pour mettre les données en cache si besoin
    return remoteLogin;
  }

  @override
  Future<String> fetchCurrentUserAttributes() async {
    await networkInfo.isConnected;
    var id = await remoteDataSource.fetchCurrentUserAttributes();
    return id;
  }

  @override
  Future<void> logOut() async {
    await remoteDataSource.logOut();
    print("User logged out");
  }

}