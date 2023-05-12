import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:amplify_storage_s3/amplify_storage_s3.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waaa/core/constants/image_constants.dart';
import 'package:waaa/core/environment/environment.dart';
import 'package:waaa/core/theme/theme.dart';
import 'package:waaa/features/auth/presentation/manager/auth_bloc/auth_bloc.dart';
import 'package:waaa/features/auth/presentation/manager/signup_bloc/signup_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:waaa/features/auth/presentation/pages/login_page.dart';
import 'package:waaa/features/home/presentation/pages/home_page.dart';
import 'package:waaa/features/home/presentation/pages/main_page.dart';
import 'package:waaa/splashpage.dart';

import 'amplifyconfiguration.dart';
import 'features/auth/presentation/manager/login_bloc/login_bloc.dart';
import 'features/auth/presentation/pages/general_conditions_page.dart';
import 'features/events/presentation/pages/create_event_two_page.dart';
import 'features/users/presentation/manager/bloc/register/register_bloc.dart';
import 'injection_container.dart' as di;
import 'package:waaa/core/route/routes.dart' as route;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  const String environment = String.fromEnvironment(
    'ENVIRONMENT',
    defaultValue: Environment.DEV,
  );
  Environment().initConfig(environment);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _amplifyConfigured = false;

  @override
  void initState() {
    super.initState();
    _initializeApp();
  }

  Future<void> _configureAmplify() async {
    await Amplify.addPlugins([
      AmplifyAPI(),
      AmplifyAuthCognito(),
      AmplifyStorageS3(),
    ]);
    await Amplify.configure(amplifyconfig);
  }

  Future<void> _initializeApp() async {
    await _configureAmplify();

    setState(() {
      _amplifyConfigured = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => di.sl<LoginBloc>()),
        BlocProvider(create: (context) => di.sl<SignupBloc>()),
        BlocProvider(create: (context) => di.sl<RegisterBloc>()),
        BlocProvider(create: (context) => di.sl<AuthBloc>()..add(AppStarted())),
      ],
      child: MaterialApp(
        title: 'Waaa',
        debugShowCheckedModeBanner: false,
        theme: CustomTheme.lightTheme,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        onGenerateRoute: route.controller,
        home: _amplifyConfigured
            ? const MainPage()
            : Scaffold(
                body: Center(
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(appBarImage),
                        const SizedBox(
                          height: 20,
                        ),
                        const CircularProgressIndicator()
                      ],
                    ),
                  ),
                ),
              ),
      ),
    );
  }
}
