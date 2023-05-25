import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waaa/core/enums/register_enum.dart';
import 'package:waaa/core/theme/colors.dart';
import 'package:waaa/core/util/localized.dart';
import 'package:waaa/features/users/presentation/manager/bloc/register/register_bloc.dart';
import 'package:waaa/features/users/presentation/pages/welcome_page.dart';
import 'package:waaa/features/users/presentation/widgets/birthday_screen.widget.dart';
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
        if (state.errorType == RegisterErrorType.nationalityEmpty) {
          showFloatingFlushbar(
              context, null, localized(context).nationality_empty);
        }
        if (state.errorType == RegisterErrorType.residencyEmpty) {
          showFloatingFlushbar(
              context, null, localized(context).residency_empty);
        }
        if (state.errorType == RegisterErrorType.nativeLanguageEmpty) {
          showFloatingFlushbar(
              context, null, localized(context).native_language_empty);
        }
        if (state.errorType == RegisterErrorType.spokenLanguagesEmpty) {
          showFloatingFlushbar(
              context, null, localized(context).spoken_languages_empty);
        }
        if (state.errorType ==
            RegisterErrorType.spokenLanguageAlreadySelected) {
          showFloatingFlushbar(context, null,
              localized(context).spoken_language_already_selected);
        }
        if (state.errorType == RegisterErrorType.photoEmpty) {
          showFloatingFlushbar(context, null, localized(context).photo_empty);
        }
        if (state.errorType == RegisterErrorType.countrySelectError) {
          showFloatingFlushbar(context, null, localized(context).country_error);
        }
        if (state.errorType == RegisterErrorType.photoSelectError) {
          showFloatingFlushbar(context, null, localized(context).photo_error);
        }
        if (state.errorType == RegisterErrorType.registerFailed) {
          showFloatingFlushbar(
              context, null, localized(context).register_failed);
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
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
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
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                case RegisterStatus.complete:
                  return const WelcomePage();
                case RegisterStatus.birthdayStep:
                  return const BirthdayScreenWidget();
              }
            },
          ),
        ),
      ),
    );
  }
}
