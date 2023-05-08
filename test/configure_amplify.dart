import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:amplify_storage_s3/amplify_storage_s3.dart';
import 'package:waaa/amplifyconfiguration.dart';

Future<void> configureAmplify() async {
  await Amplify.addPlugins([
    AmplifyAPI(),
    AmplifyAuthCognito(),
    AmplifyStorageS3(),
  ]);
  await Amplify.configure(amplifyconfig);
}
