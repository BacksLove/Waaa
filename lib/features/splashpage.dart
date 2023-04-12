import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waaa/features/auth/presentation/manager/auth_bloc/auth_bloc.dart';
import 'package:waaa/features/auth/presentation/pages/auth_page.dart';
import 'package:waaa/features/home/presentation/pages/home_page.dart';
import 'package:waaa/features/users/presentation/pages/register_page.dart';

import 'package:waaa/injection_container.dart' as di;
import 'package:waaa/core/route/routes.dart' as route;

import '../core/enums/authentication_enum.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state.status == AuthenticationStatus.authenticated) {
          Navigator.pushReplacementNamed(context, route.homePage);
        } else if (state.status == AuthenticationStatus.unauthenticated) {
          //Navigator.popUntil(context, (route) => route.isFirst);
          Navigator.pushReplacementNamed(context, route.authPage);
        } else if (state.status == AuthenticationStatus.registered) {
          Navigator.pushReplacementNamed(context, route.registerPage);
        }
      },
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              Text(
                "SPLASHPAGE",
                style: TextStyle(
                  fontSize: 40,
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
    );
  }
}
