import 'package:waaa/core/environment/base_config.dart';

class DevConfig implements BaseConfig {
  @override
  String get apiEndpoint =>
      "https://hqwucg3jdff3zebpbdaarwjnjq.appsync-api.eu-west-3.amazonaws.com/graphql";

  @override
  String get apiKey => "da2-b74inibvrbanfeicrv7rsxry5u";

  @override
  String get authAppClientId => "2kltgn3kpnurf98g0f13l900ni";

  @override
  String get authEndpoint => "";

  @override
  String get region => "eu-west-3";

  @override
  String get storageBucket => "waaaapis3bucket211927-dev";

  @override
  String get authCognitoPoolId => "eu-west-3_CNBA9vRh8";

  @override
  String get authCredPoolId => "eu-west-3:a569b955-8621-464f-8b6e-73466093c2ea";
}
