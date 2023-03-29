part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object?> get props => [];
}

class AppStarted extends AuthEvent {}

class LoginFlow extends AuthEvent {}

class LoggedIn extends AuthEvent {
  final String id;

  const LoggedIn({required this.id});
}

class SignupFlow extends AuthEvent {}

class SignedUp extends AuthEvent {
  final String id;

  const SignedUp({required this.id});
}

class LoggedOut extends AuthEvent {}
