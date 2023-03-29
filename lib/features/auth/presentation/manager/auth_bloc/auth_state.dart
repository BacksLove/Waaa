part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthInitState extends AuthState {}

class AuthInProgressState extends AuthState {}

class AuthLoginState extends AuthState {}

class AuthSignupState extends AuthState {}

class AuthSignupIncompleteState extends AuthState {}

class AuthAuthenticatedState extends AuthState {}

class AuthUnauthenticatedState extends AuthState {}
