import 'package:flutter/material.dart';
import 'package:waaa/features/auth/presentation/pages/auth_page.dart';
import 'package:waaa/features/auth/presentation/pages/signup_page.dart';
import 'package:waaa/features/events/presentation/pages/event_detail_page.dart';
import 'package:waaa/features/users/presentation/pages/register_page.dart';

import '../../features/auth/presentation/pages/login_page.dart';
import '../../features/home/presentation/pages/home_page.dart';
import '../../features/home/presentation/pages/settings_page.dart';

// Route Names

// Auth
const String authPage = 'auth';
const String loginPage = 'login';
const String signupPage = 'signup';
const String registerPage = 'register';

// Home
const String homePage = 'home';
const String settingsPage = "settings";

// Event
const String eventDetailPage = 'eventDetails';

// Control our page route flow
Route<dynamic> controller(RouteSettings settings) {
  switch (settings.name) {
    case authPage:
      return MaterialPageRoute(builder: (context) => const AuthPage());
    case loginPage:
      return MaterialPageRoute(builder: (context) => const LoginPage());
    case signupPage:
      return MaterialPageRoute(builder: (context) => const SignUpPage());
    case registerPage:
      return MaterialPageRoute(builder: (context) => const RegisterPage());
    case homePage:
      return MaterialPageRoute(builder: (context) => const HomePage());
    case settingsPage:
      return MaterialPageRoute(builder: (context) => const SettingPage());
    default:
      throw ('This route name does not exit');
  }
}
