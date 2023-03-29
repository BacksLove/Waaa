import 'package:equatable/equatable.dart';


class LoginState extends Equatable {

  /*LoginState copyWith(String email, String password) {
    return LoginState(email: email ?? this.email, password: password ?? this.password);
  }*/

  @override
  List<Object?> get props => [];
}

class LoginInitialState extends LoginState {}

class LoginLoadingState extends LoginState {}

class LoginSucceedState extends LoginState {}

class LoginFailedState extends LoginState {
  final String errorMessage;

  LoginFailedState({required this.errorMessage});
}
