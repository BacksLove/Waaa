import 'package:equatable/equatable.dart';

abstract class LoginEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoginEmailChanged extends LoginEvent {
  final String email;

  LoginEmailChanged(this.email);

  @override
  List<Object?> get props => [email];
}

class LoginPasswordChanged extends LoginEvent {
  final String password;

  LoginPasswordChanged(this.password);

  @override
  List<Object?> get props => [password];
}

class LoginButtonPressed extends LoginEvent {
  final String email;
  final String password;

  LoginButtonPressed(this.email, this.password) : super();
}

class AcceptConditions extends LoginEvent {}

class ShowPasswordPressed extends LoginEvent {}

class FacebookButtonPressed extends LoginEvent {}

class GoogleButtonPressed extends LoginEvent {}

class LogOutButtonPressed extends LoginEvent {}
