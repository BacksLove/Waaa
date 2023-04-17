part of 'signup_bloc.dart';

class SignupState extends Equatable {
  const SignupState();

  @override
  List<Object> get props => [];
}

// Initial State
class SignupInitialState extends SignupState {}

// Password field
class SignupPasswordState extends SignupState {}

class SignupPasswordErrorState extends SignupState {
  final String errorMessage =
      "Le mot de passe entré ne respecte pas les conditions de validation.\nIl doit contenir au moins 8 caractères";
}

class SignupErrorState extends SignupState {}

// Confirm Code field
class SignupConfirmCodeState extends SignupState {}

class SignupLoadingState extends SignupState {}

class SignUpCompletedState extends SignupState {}
