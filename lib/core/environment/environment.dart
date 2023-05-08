// ignore_for_file: constant_identifier_names

import 'package:waaa/core/environment/base_config.dart';
import 'package:waaa/core/environment/dev_config.dart';
import 'package:waaa/core/environment/prod_config.dart';
import 'package:waaa/core/environment/staging_config.dart';

class Environment {
  static final Environment _singleton = Environment._internal();

  factory Environment() {
    return _singleton;
  }

  Environment._internal();

  static const String DEV = 'DEV';
  static const String STAGING = 'STAGING';
  static const String PROD = 'PROD';

  late BaseConfig config;

  initConfig(String environment) {
    config = _getConfig(environment);
  }

  BaseConfig _getConfig(String environment) {
    switch (environment) {
      case Environment.PROD:
        return ProdConfig();
      case Environment.STAGING:
        return StagingConfig();
      default:
        return DevConfig();
    }
  }
}
