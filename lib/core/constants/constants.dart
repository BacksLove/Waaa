import 'package:waaa/core/environment/environment.dart';

String env = const String.fromEnvironment(
  'ENVIRONMENT',
  defaultValue: Environment.DEV,
);

const String localisationDir = "lib/core/i18n";

const String userCognitoIdKey = "userCognitoIdKey";
const String userIdKey = "userIdKey";
const String idKey = 'sub';

const String userPhotoDir = "profile/";

const String eventPhotoDir = "events/";
const String tripPhotoDir = "trips/";

String get userPhotoUrl {
  switch (env) {
    case Environment.DEV:
      return "https://waaaapis3bucket122058-dev.s3.eu-west-3.amazonaws.com/public/profile/";
    case Environment.STAGING:
      return "";
    case Environment.PROD:
      return "";
  }
  return "";
}

String get eventPhotoUrl {
  switch (env) {
    case Environment.DEV:
      return "https://waaaapis3bucket122058-dev.s3.eu-west-3.amazonaws.com/public/events/";
    case Environment.STAGING:
      return "";
    case Environment.PROD:
      return "";
  }
  return "";
}

String get tripPhotoUrl {
  switch (env) {
    case Environment.DEV:
      return "https://waaaapis3bucket122058-dev.s3.eu-west-3.amazonaws.com/public/trips/";
    case Environment.STAGING:
      return "";
    case Environment.PROD:
      return "";
  }
  return "";
}
