import 'package:waaa/core/environment/base_config.dart';

class ProdConfig implements BaseConfig {
  @override
  String get apiEndpoint => throw UnimplementedError();

  @override
  String get apiKey => throw UnimplementedError();

  @override
  String get authAppClientId => throw UnimplementedError();

  @override
  String get authEndpoint => throw UnimplementedError();

  @override
  String get region => throw UnimplementedError();

  @override
  String get storageBucket => throw UnimplementedError();

  @override
  String get authCognitoPoolId => throw UnimplementedError();

  @override
  String get authCredPoolId => throw UnimplementedError();
}
