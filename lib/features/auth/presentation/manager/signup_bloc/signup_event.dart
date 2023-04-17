part of 'signup_bloc.dart';

abstract class SignupEvent extends Equatable {
  const SignupEvent();

  @override
  List<Object?> get props => [];
}

class ValidateEmailButtonPressed extends SignupEvent {
  final String email;

  const ValidateEmailButtonPressed({required this.email});
}

class ValidatePasswordButtonPressed extends SignupEvent {
  final String email;
  final String password;
  final String confirmPassword;

  const ValidatePasswordButtonPressed(
      {required this.email,
      required this.password,
      required this.confirmPassword});
}

class ValidateConfirmCodeButtonPressed extends SignupEvent {
  final String email;
  final String password;
  final String code;

  const ValidateConfirmCodeButtonPressed(
      {required this.email, required this.password, required this.code});
}
