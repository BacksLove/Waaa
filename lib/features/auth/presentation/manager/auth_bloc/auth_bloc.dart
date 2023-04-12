import 'dart:async';

import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:waaa/core/constants/constants.dart';
import 'package:waaa/core/enums/authentication_enum.dart';
import 'package:waaa/core/usecases/usecase.dart';
import 'package:waaa/features/auth/domain/use_cases/get_current_auth_session.dart';
import 'package:waaa/features/auth/domain/use_cases/get_current_auth_user%20copy.dart';
import 'package:waaa/features/users/domain/use_cases/get_user_by_id.dart';

import 'package:waaa/injection_container.dart' as di;

import '../../../../users/domain/entities/user_entity.dart';
import '../../../domain/use_cases/log_out.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(const AuthState.unknown()) {
    on<AppStarted>(_onAppStart);
    on<LoggedIn>(_onLogIn);
    on<SignedUp>(_onSignUp);
    on<Registered>(_onRegister);
    on<LoggedOut>(_onLogOut);
  }

  @override
  void onTransition(Transition<AuthEvent, AuthState> transition) {
    super.onTransition(transition);
    print(transition);
  }

  void _onAppStart(AppStarted event, Emitter<AuthState> emit) async {
    try {
      late String? token;
      late User? user;
      emit(const AuthState.unauthenticated());
      final AuthSession session =
          await di.sl<GetCurrentAuthSession>().call(NoParams());
      if (session.isSignedIn) {
        print("User loggé");
        token = di.sl<SharedPreferences>().getString(userIdKey);
        user = await di.sl<GetUserById>().call(GetUserByIdParams(id: token!));
        if (user.username.isNotEmpty) {
          print("C'est complet");
          emit(AuthState.authenticated(user));
        } else {
          print("C'est incomplet frerot");
          emit(const AuthState.registered());
        }
      } else {
        print("Pas d'utilisateur loggé");
        emit(const AuthState.unauthenticated());
      }
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  void _onLogIn(LoggedIn event, Emitter<AuthState> emit) async {
    User? user =
        await di.sl<GetUserById>().call(GetUserByIdParams(id: event.id));
    emit(AuthState.authenticated(user));
  }

  void _onSignUp(SignedUp event, Emitter<AuthState> emit) async {
    final String? token = di.sl<SharedPreferences>().getString(userIdKey);
    if (token != null) emit(const AuthState.registered());
  }

  void _onLogOut(LoggedOut event, Emitter<AuthState> emit) async {
    await di.sl<SharedPreferences>().remove(userIdKey);
    di.sl<LogOut>().call(NoParams());
    emit(const AuthState.unauthenticated());
  }

  void _onRegister(Registered event, Emitter<AuthState> emit) async {
    emit(AuthState.authenticated(event.user));
  }
}
