import 'package:flutter/material.dart';
import 'package:waaa/component/error_screen.dart';
import 'package:waaa/features/auth/presentation/pages/auth_page.dart';
import 'package:waaa/features/auth/presentation/pages/signup_page.dart';
import 'package:waaa/features/chat/presentation/pages/chat_list_page.dart';
import 'package:waaa/features/chat/presentation/pages/chat_page.dart';
import 'package:waaa/features/events/presentation/pages/event_detail_page.dart';
import 'package:waaa/features/lottery/presentation/pages/lottery_main_page.dart';
import 'package:waaa/features/lottery/presentation/pages/lottery_result_page.dart';
import 'package:waaa/features/lottery/presentation/pages/subscribe_page.dart';
import 'package:waaa/features/users/domain/entities/profile_page_arguments.dart';
import 'package:waaa/features/users/presentation/pages/profile_page.dart';
import 'package:waaa/features/users/presentation/pages/register_page.dart';
import 'package:waaa/features/users/presentation/pages/search_result_page.dart';
import 'package:waaa/models/User.dart';

import '../../features/auth/presentation/pages/login_page.dart';
import '../../features/events/presentation/pages/create_event_page.dart';
import '../../features/home/presentation/pages/main_page.dart';
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
const String createEventPage = "createEvent";

// Trips
const String createTripPage = "createTrip";

// Offer
const String offerMainPage = 'offerMainPage';
const String offerResultPage = 'offerResultPage';
const String subscriptionPage = 'subscriptionPage';

// User
const String profilePage = "profilePage";
const String searchResultPage = "searchResultPage";

// Chat
const String chatListPage = "chatListPage";
const String chatPage = "chatPage";

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
        final String eventId = settings.arguments as String;

        return MaterialPageRoute(
            builder: (context) => EventDetailPage(eventId: eventId));
      }
    case createEventPage:
      return MaterialPageRoute(builder: (context) => const CreateEventPage());
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
    case searchResultPage:
      {
        final List<User?> users = settings.arguments as List<User?>;

        return MaterialPageRoute(
          builder: (context) => SearchResultPage(
            users: users,
          ),
        );
      }
    case chatListPage:
      return MaterialPageRoute(builder: (context) => const ChatList());
    case chatPage:
      {
        final User user = settings.arguments as User;
        return MaterialPageRoute(
          builder: (context) => ChatPage(
            receiver: user,
          ),
        );
      }
    case offerMainPage:
      return MaterialPageRoute(builder: (context) => const LotteryMainPage());
    case offerResultPage:
      {
        final String offerId = settings.arguments as String;

        return MaterialPageRoute(
          builder: (context) => LotteryResultPage(
            offerId: offerId,
          ),
        );
      }
    case subscriptionPage:
      return MaterialPageRoute(builder: (context) => const SubscriptionPage());
    case createTripPage:
      return MaterialPageRoute(builder: (context) => const ErrorScreen());
    default:
      throw ('This route name does not exit');
  }
}
