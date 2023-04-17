import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waaa/features/auth/presentation/manager/auth_bloc/auth_bloc.dart';
import 'package:waaa/core/route/routes.dart' as route;

import 'core/enums/authentication_enum.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state.status == AuthenticationStatus.authenticated) {
            Navigator.popAndPushNamed(context, route.homePage);
          } else if (state.status == AuthenticationStatus.unauthenticated) {
            Navigator.popAndPushNamed(context, route.authPage);
          } else if (state.status == AuthenticationStatus.registered) {
            Navigator.popAndPushNamed(context, route.registerPage);
          }
        },
        child: Scaffold(
            body: Center(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset("assets/images/logoWaaa.png"),
                const SizedBox(
                  height: 20,
                ),
                const CircularProgressIndicator()
              ],
            ),
          ),
        )));
  }
}
