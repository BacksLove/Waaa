import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:waaa/component/app_bar.dart';
import 'package:waaa/core/theme/colors.dart';
import 'package:waaa/core/util/localized.dart';
import 'package:waaa/core/util/mocks/users.dart';
import 'package:waaa/features/auth/presentation/manager/auth_bloc/auth_bloc.dart';
import 'package:waaa/features/home/presentation/manager/navigation_cubit/bottom_navigation_cubit.dart';
import 'package:waaa/features/home/presentation/pages/home_page.dart';
import 'package:waaa/features/home/presentation/pages/notifications_page.dart';
import 'package:waaa/features/home/presentation/pages/search_page.dart';

import 'package:waaa/injection_container.dart' as di;

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
          appBar: MainAppBar(),
          body: BlocBuilder<BottomNavigationCubit, BottomNavigationState>(
            bloc: navigationCubit,
            builder: (context, state) {
              switch (state.currentPage) {
                case 0:
                  return const HomePage();
                case 1:
                  return const SearchPage();
                case 2:
                  return Container();
                case 3:
                  return const NotificationsPage();
                case 4:
                  return ProfilPage(
                    currentUser: authBloc.state.user!,
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
                items: [
                  BottomNavigationBarItem(
                    icon: Icon(
                      FeatherIcons.home,
                      color: blackColor,
                    ),
                    label: localized(context).home,
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(
                      FeatherIcons.search,
                      color: blackColor,
                    ),
                    label: localized(context).search,
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(
                      FeatherIcons.plusCircle,
                      color: blackColor,
                    ),
                    label: localized(context).add_trip,
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(
                      FeatherIcons.send,
                      color: blackColor,
                    ),
                    label: localized(context).notifications,
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(
                      FeatherIcons.user,
                      color: blackColor,
                    ),
                    label: localized(context).profil,
                  ),
                ],
                currentIndex: navigationCubit.state.currentPage,
                onTap: (index) => {navigationCubit.moveToTab(index)},
                selectedItemColor: lightPrimaryColor,
              );
            },
          ),
        ),
      ),
    );
  }
}
