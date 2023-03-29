import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:waaa/core/constants/constants.dart';
import 'package:waaa/core/usecases/usecase.dart';
import 'package:waaa/features/auth/domain/use_cases/fetch_current_user.dart';
import 'package:waaa/features/auth/domain/use_cases/log_out.dart';
import 'package:waaa/features/auth/domain/use_cases/login_with_email.dart';
import 'package:waaa/features/auth/presentation/manager/login_bloc/login_event.dart';
import 'package:waaa/features/auth/presentation/manager/login_bloc/login_state.dart';
import '../../../domain/repositories/auth_repository.dart';

import 'package:waaa/injection_container.dart' as di;

import '../auth_bloc/auth_bloc.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthBloc authBloc;

  LoginBloc(this.authBloc) : super(LoginInitialState()) {
    on<LoginButtonPressed>(_onLoginButtonPressed);
    on<LogOutButtonPressed>(_onLogOutButtonPressed);
  }

  void _onLoginButtonPressed(LoginButtonPressed event, Emitter<LoginState> emit) async {
    emit(LoginLoadingState());
    try {
      var login = await di.sl<LoginWithEmail>().call(Params(email: event.email, password: event.password));
      var id = await di.sl<FetchCurrentUserAttributes>().call(NoParams());
      if (login) {
        await di.sl<SharedPreferences>().setString(userIdKey, id);
        authBloc.add(LoggedIn(id: id));
        emit(LoginSucceedState());
      } else {
        emit(LoginFailedState(errorMessage: "Wrong credentials"));
      }
    } catch (e) {
      print(e);
    }
  }

  void _onLogOutButtonPressed(LogOutButtonPressed event, Emitter<LoginState> emit) async {
    try {
      await di.sl<LogOut>().call(NoParams());
      emit(LoginInitialState());
    } catch (e) {
      print(e);
    }
  }
}
