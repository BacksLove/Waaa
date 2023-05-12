import 'package:flutter/material.dart';
import 'package:waaa/features/auth/presentation/pages/auth_page.dart';
import 'package:waaa/features/auth/presentation/pages/signup_page.dart';
import 'package:waaa/features/events/presentation/pages/create_event_two_page.dart';
import 'package:waaa/features/events/presentation/pages/event_detail_page.dart';
import 'package:waaa/features/users/domain/entities/profile_page_arguments.dart';
import 'package:waaa/features/users/presentation/pages/profile_page.dart';
import 'package:waaa/features/users/presentation/pages/register_page.dart';

import '../../features/auth/presentation/pages/login_page.dart';
import '../../features/events/domain/entities/event_entity.dart';
import '../../features/events/presentation/pages/create_event_page.dart';
import '../../features/home/presentation/pages/main_page.dart';
import '../../features/home/presentation/pages/settings_page.dart';
import '../../features/users/domain/entities/user_entity.dart';

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
const String createEventPage = "createEvent";
const String createEventTwoPage = "createEventPartTwo";

// User
const String profilePage = "profilePage";

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
      return MaterialPageRoute(builder: (context) => const MainPage());
    case settingsPage:
      return MaterialPageRoute(builder: (context) => const SettingPage());
    case eventDetailPage:
      {
        final Event event = settings.arguments as Event;

        return MaterialPageRoute(
            builder: (context) => EventDetailPage(currentEvent: event));
      }
    case createEventPage:
      return MaterialPageRoute(builder: (context) => const CreateEventPage());
    case createEventTwoPage:
      return MaterialPageRoute(
          builder: (context) => const CreateEventTwoPage());
    case profilePage:
      {
        final ProfilePageArguments profilePageArguments =
            settings.arguments as ProfilePageArguments;

        return MaterialPageRoute(
          builder: (context) => ProfilPage(
            currentUser: profilePageArguments.user,
            isFromSearching: profilePageArguments.isFromSearching,
          ),
        );
      }
    default:
      throw ('This route name does not exit');
  }
}
