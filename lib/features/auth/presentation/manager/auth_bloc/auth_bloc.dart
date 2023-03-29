import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:waaa/core/constants/constants.dart';

import 'package:waaa/injection_container.dart' as di;

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthUnauthenticatedState()) {
    on<AppStarted>(_onAppStart);
    on<LoginFlow>(_onLogInFlow);
    on<SignupFlow>(_onSignupFlow);
    on<LoggedIn>(_onLogIn);
    on<SignedUp>(_onSignUp);
    on<LoggedOut>(_onLogOut);
  }

  void _onAppStart(AppStarted event, Emitter<AuthState> emit) async {
    final String? token = await di.sl<SharedPreferences>().getString(userIdKey);
    if (token != "") {
      emit(AuthAuthenticatedState());
    } else {
      emit(AuthUnauthenticatedState());
    }
  }

  void _onLogIn(LoggedIn event, Emitter<AuthState> emit) async {
    emit(AuthInProgressState());
    await di.sl<SharedPreferences>().setString(userIdKey, event.id);
    emit(AuthAuthenticatedState());
  }

  void _onLogInFlow(LoginFlow event, Emitter<AuthState> emit) async {
    emit(AuthLoginState());
  }

  void _onSignupFlow(SignupFlow event, Emitter<AuthState> emit) async {
    emit(AuthSignupState());
  }

  void _onSignUp(SignedUp event, Emitter<AuthState> emit) async {
    emit(AuthInProgressState());
    final String? token = await di.sl<SharedPreferences>().getString(userIdKey);
    emit(AuthSignupIncompleteState());
  }

  void _onLogOut(LoggedOut event, Emitter<AuthState> emit) async {
    emit(AuthInProgressState());
    await di.sl<SharedPreferences>().remove(userIdKey);
    emit(AuthUnauthenticatedState());
  }

}

