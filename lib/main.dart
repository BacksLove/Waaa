import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waaa/core/theme/theme.dart';
import 'package:waaa/features/auth/presentation/manager/auth_bloc/auth_bloc.dart';
import 'package:waaa/features/auth/presentation/manager/signup_bloc/signup_bloc.dart';
import 'package:waaa/features/auth/presentation/pages/auth_page.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:waaa/features/auth/presentation/pages/login_page.dart';
import 'package:waaa/features/auth/presentation/pages/signup_page.dart';
import 'package:waaa/features/events/presentation/pages/event_detail_page.dart';
import 'package:waaa/features/home/presentation/pages/home_page.dart';
import 'package:waaa/features/splashpage.dart';

import 'amplifyconfiguration.dart';
import 'core/enums/authentication_enum.dart';
import 'features/auth/presentation/manager/login_bloc/login_bloc.dart';
import 'features/events/domain/entities/event_entity.dart';
import 'features/users/presentation/manager/register_bloc.dart';
import 'features/users/presentation/pages/register_page.dart';
import 'injection_container.dart' as di;
import 'package:waaa/core/route/routes.dart' as route;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
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
    ]);
    await Amplify.configure(amplifyconfig);
  }

  Future<void> _initializeApp() async {
    await _configureAmplify();

    setState(() {
      _amplifyConfigured = true;
    });
  }

  // This widget is the root of your application.
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
        theme: CustomTheme.lightTheme,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        onGenerateRoute: route.controller,
        home: _amplifyConfigured
            ? const SplashPage()
            : Scaffold(
                body: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      Text(
                        "WAAAAAAAAAAAAAA",
                        style: TextStyle(
                          fontSize: 35,
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      CircularProgressIndicator()
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}


/*

BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
                switch (state.status) {
                  case AuthenticationStatus.unknown:
                    {
                      var currentEvent = Event(
                          name: "name",
                          address: "address",
                          country: "country",
                          city: "city",
                          begin: DateTime.now(),
                          end: DateTime.now(),
                          createdAt: DateTime.now(),
                          hourBegin: 12,
                          maxParticipants: 130,
                          minParticipants: 2,
                          isPublic: true,
                          mainPhoto:
                              "https://res.klook.com/image/upload/Mobile/City/swox6wjsl5ndvkv5jvum.jpg");
                      return EventDetailPage(currentEvent: currentEvent);
                      //di.sl<AuthBloc>().add(AppStarted());
                      //return const CircularProgressIndicator();
                    }
                  case AuthenticationStatus.authenticated:
                    return const HomePage();
                  case AuthenticationStatus.unauthenticated:
                    return const AuthPage();
                  case AuthenticationStatus.register:
                    return const RegisterPage();
                }
              })

*/