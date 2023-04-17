part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object?> get props => [];
}

class AppStarted extends AuthEvent {}

class AuthStateChangedEvent extends AuthEvent {
  final AuthUser user;

  const AuthStateChangedEvent({required this.user});
}

class GoToLoginScreen extends AuthEvent {}

class GoToSignupScreen extends AuthEvent {}

class LoggedIn extends AuthEvent {
  final String id;

  const LoggedIn({required this.id});

  @override
  List<Object?> get props => [id];
}

class SignedUp extends AuthEvent {
  final String id;

  const SignedUp({required this.id});

  @override
  List<Object?> get props => [id];
}

class Registered extends AuthEvent {
  final User user;

  const Registered({required this.user});

  @override
  List<Object?> get props => [user];
}

class LoggedOut extends AuthEvent {}
