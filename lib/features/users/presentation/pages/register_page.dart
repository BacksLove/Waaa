import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waaa/core/enums/register_enum.dart';
import 'package:waaa/core/theme/colors.dart';
import 'package:waaa/features/users/presentation/manager/bloc/register/register_bloc.dart';
import 'package:waaa/features/users/presentation/pages/welcome_page.dart';
import 'package:waaa/features/users/presentation/widgets/country_screen_widget.dart';
import 'package:waaa/features/users/presentation/widgets/hobbies_screen_widget.dart';
import 'package:waaa/features/users/presentation/widgets/language_screen_widget.dart';
import 'package:waaa/features/users/presentation/widgets/photo_screen_widget.dart';
import 'package:waaa/features/users/presentation/widgets/username_field_widget.dart';

import '../../../../component/snack_bar.dart';

import 'package:waaa/core/route/routes.dart' as route;
import 'package:waaa/injection_container.dart' as di;

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  late RegisterBloc registerBloc;

  @override
  void initState() {
    super.initState();
    registerBloc = di.sl<RegisterBloc>();
  }

  @override
  void dispose() {
    super.dispose();
    registerBloc.close();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterBloc, RegisterState>(
      listener: (context, state) {
        if (state.errorMessage != null) {
          if (state.errorMessage!.isNotEmpty) {
            showSnackBar(context, state.errorMessage!);
          }
        }
        if (state.status == RegisterStatus.complete) {
          Navigator.popAndPushNamed(context, route.homePage);
        }
      },
      child: WillPopScope(
        onWillPop: () async {
          return false;
        },
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: transparentColor,
            elevation: 0,
            leading: null,
          ),
          body: BlocBuilder<RegisterBloc, RegisterState>(
            builder: (context, state) {
              switch (state.status) {
                case RegisterStatus.loading:
                  return const CircularProgressIndicator();
                case RegisterStatus.usernameStep:
                  return const UsernameScreenWidget();
                case RegisterStatus.countryStep:
                  return const CountryScreenWidget();
                case RegisterStatus.languagesStep:
                  return const LanguageScreenWidget();
                case RegisterStatus.hobbiesStep:
                  return HobbiesScreenWidget(hobbies: state.hobbies);
                case RegisterStatus.photoStep:
                  return const PhotoScreenWidget();
                case RegisterStatus.createUser:
                  {
                    registerBloc.add(RegisterCompleteEvent());
                    return const CircularProgressIndicator();
                  }
                case RegisterStatus.complete:
                  return const WelcomePage();
              }
            },
          ),
        ),
      ),
    );
  }
}
