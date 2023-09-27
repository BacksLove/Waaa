import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionicons/ionicons.dart';
import 'package:waaa/component/app_bar.dart';
import 'package:waaa/component/circle_avatar.dart';
import 'package:waaa/core/theme/colors.dart';
import 'package:waaa/core/util/localized.dart';
import 'package:waaa/features/auth/presentation/manager/auth_bloc/auth_bloc.dart';
import 'package:waaa/features/home/presentation/manager/navigation_cubit/bottom_navigation_cubit.dart';
import 'package:waaa/features/home/presentation/pages/home_page.dart';
import 'package:waaa/features/home/presentation/pages/notifications_page.dart';
import 'package:waaa/features/trips/presentation/pages/create_trip_page.dart';
import 'package:waaa/features/users/presentation/pages/search_page.dart';

import 'package:waaa/injection_container.dart' as di;
import 'package:waaa/core/route/routes.dart' as route;

import '../../../users/presentation/pages/profile_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late BottomNavigationCubit navigationCubit;
  late AuthBloc authBloc;

  @override
  void initState() {
    super.initState();
    navigationCubit = di.sl<BottomNavigationCubit>();
    authBloc = di.sl<AuthBloc>();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => navigationCubit,
      child: WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          appBar: const MainAppBar(),
          body: BlocBuilder<BottomNavigationCubit, BottomNavigationState>(
            bloc: navigationCubit,
            builder: (context, state) {
              switch (state.currentPage) {
                case 0:
                  return const HomePage();
                case 1:
                  return const SearchPage();
                case 2:
                  return const CreateTripPage();
                case 3:
                  return const NotificationsPage();
                case 4:
                  return ProfilPage(
                    currentUser: authBloc.state.user!,
                    isFromSearching: false,
                  );
                default:
                  return Container();
              }
            },
          ),
          bottomNavigationBar:
              BlocBuilder<BottomNavigationCubit, BottomNavigationState>(
            builder: (context, state) {
              return BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                selectedIconTheme: IconThemeData(color: primaryColor),
                items: [
                  BottomNavigationBarItem(
                    icon: const Icon(
                      Ionicons.home,
                    ),
                    label: localized(context).home,
                  ),
                  BottomNavigationBarItem(
                    icon: const Icon(
                      Ionicons.search,
                    ),
                    label: localized(context).search,
                  ),
                  BottomNavigationBarItem(
                    icon: const Icon(
                      Ionicons.add_circle,
                    ),
                    label: localized(context).add_trip,
                  ),
                  BottomNavigationBarItem(
                    icon: const Icon(
                      Ionicons.notifications,
                    ),
                    label: localized(context).notifications,
                  ),
                  BottomNavigationBarItem(
                    icon: WaaaCircleAvatar(
                      photo: authBloc.state.user?.photo,
                      width: 25,
                      height: 25,
                    ),
                    label: localized(context).profil,
                  ),
                ],
                currentIndex: navigationCubit.state.currentPage,
                onTap: (index) => {navigationCubit.moveToTab(index)},
                selectedItemColor: blackColor,
              );
            },
          ),
        ),
      ),
    );
  }
}
