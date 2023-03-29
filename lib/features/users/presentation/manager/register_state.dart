part of 'register_bloc.dart';

abstract class RegisterState extends Equatable {
  const RegisterState();
  
  @override
  List<Object> get props => [];
}

class RegisterInitial extends RegisterState {}

// Username
class RegisterUsernameState extends RegisterState {
  final String steps = "1";
}

// Countries buttons
class RegisterCountriesState extends RegisterState {
  final String steps = "2";
}
class NationalityCountrySelectedState extends RegisterState{}
class ResidenceCountrySelectedState extends RegisterState {}

// Languages buttons
class RegisterLanguagesState extends RegisterState {
  final String steps = "3";
}
class NativeLanguageSelectedState extends RegisterState {}
class SpokenLanguagesSelectedState extends RegisterState {}


class RegisterHobbiesState extends RegisterState {
  final List<Hobby> hobbies;
  final String steps = "4";

  const RegisterHobbiesState({required this.hobbies});
}

class RegisterPhotoState extends RegisterState {
  final String steps = "5";
}

class RegisterCompleteState extends RegisterState {}