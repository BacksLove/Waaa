import 'package:aws_common/aws_common.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:waaa/core/constants/constants.dart';
import 'package:waaa/core/usecases/usecase.dart';
import 'package:waaa/features/auth/domain/use_cases/get_current_auth_user.dart';
import 'package:waaa/features/auth/domain/use_cases/login_with_email.dart';
import 'package:waaa/features/auth/presentation/manager/login_bloc/login_event.dart';
import 'package:waaa/features/auth/presentation/manager/login_bloc/login_state.dart';

import 'package:waaa/injection_container.dart' as di;

import '../../../../../core/enums/login_enum.dart';
import '../auth_bloc/auth_bloc.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthBloc authBloc;
  bool isPasswordShowed = false;

  LoginBloc(this.authBloc)
      : super(const LoginState(status: LoginStatus.initial)) {
    on<LoginButtonPressed>(_onLoginButtonPressed);
    on<LogOutButtonPressed>(_onLogOutButtonPressed);
    on<FacebookButtonPressed>(_onFacebookButtonPressed);
    on<GoogleButtonPressed>(_onGoogleButtonPressed);
    on<ShowPasswordPressed>(_onShowPasswordPressed);
    on<AcceptConditions>(_onAcceptTermsPressed);
  }

  @override
  void onTransition(Transition<LoginEvent, LoginState> transition) {
    super.onTransition(transition);
    safePrint(transition);
  }

  void _onLoginButtonPressed(
      LoginButtonPressed event, Emitter<LoginState> emit) async {
    emit(state.copyWith(status: LoginStatus.loading));
    try {
      if (event.email.isEmpty) {
        emit(state.copyWith(errorType: LoginErrorType.emptyEmail));
      } else if (event.password.isEmpty) {
        emit(state.copyWith(errorType: LoginErrorType.emptyPassword));
      } else if (state.hasAcceptConditions == false) {
        emit(state.copyWith(errorType: LoginErrorType.conditionsNotChecked));
      } else {
        var login = await di
            .sl<LoginWithEmail>()
            .call(Params(email: event.email, password: event.password));
        if (login) {
          var id = await di.sl<GetCurrentAuthUser>().call(NoParams());
          await di.sl<SharedPreferences>().setString(userIdKey, id.userId);
          emit(
            state.copyWith(
              status: LoginStatus.succeed,
              errorType: LoginErrorType.none,
            ),
          );
          authBloc.add(LoggedIn(id: id.userId));
        } else {
          emit(state.copyWith(
              status: LoginStatus.error,
              errorType: LoginErrorType.userNotFound));
        }
      }
    } catch (e) {
      rethrow;
    }
  }

  void _onLogOutButtonPressed(
      LogOutButtonPressed event, Emitter<LoginState> emit) async {
    try {
      authBloc.add(LoggedOut());
    } catch (e) {
      rethrow;
    }
  }

  void _onGoogleButtonPressed(
      GoogleButtonPressed event, Emitter<LoginState> emit) {}

  void _onFacebookButtonPressed(
      FacebookButtonPressed event, Emitter<LoginState> emit) {}

  void _onShowPasswordPressed(
      ShowPasswordPressed event, Emitter<LoginState> emit) {
    emit(state.copyWith(
        isPassworHidden: !state.isPassworHidden,
        errorType: LoginErrorType.none));
  }

  void _onAcceptTermsPressed(AcceptConditions event, Emitter<LoginState> emit) {
    emit(state.copyWith(
        hasAcceptConditions: !state.hasAcceptConditions,
        errorType: LoginErrorType.none));
  }
}
