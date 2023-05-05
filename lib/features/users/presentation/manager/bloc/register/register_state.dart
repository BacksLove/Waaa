part of 'register_bloc.dart';

class RegisterState extends Equatable {
  final RegisterStatus status;
  final String username;
  final String nationality;
  final String residency;
  final String nativeLanguage;
  final List<String> spokenLanguages;
  final List<Hobby> hobbies;
  final List<int> selectedHobbiesIndexes;
  final String photoUrl;
  final String? errorMessage;

  const RegisterState({
    required this.status,
    required this.username,
    required this.nationality,
    required this.residency,
    required this.nativeLanguage,
    required this.spokenLanguages,
    required this.hobbies,
    required this.selectedHobbiesIndexes,
    required this.photoUrl,
    this.errorMessage,
  });

  factory RegisterState.initial() => const RegisterState(
      status: RegisterStatus.usernameStep,
      username: "",
      nationality: "",
      residency: "",
      nativeLanguage: "",
      spokenLanguages: [],
      hobbies: [],
      selectedHobbiesIndexes: [],
      photoUrl: "");

  @override
  List<Object> get props {
    return [
      status,
      username,
      nationality,
      residency,
      nativeLanguage,
      spokenLanguages,
      hobbies,
      selectedHobbiesIndexes,
      photoUrl,
    ];
  }

  @override
  bool get stringify => true;

  RegisterState copyWith({
    RegisterStatus? status,
    String? username,
    String? nationality,
    String? residency,
    String? nativeLanguage,
    List<String>? spokenLanguages,
    List<Hobby>? hobbies,
    List<int>? selectedHobbiesIndexes,
    String? photoUrl,
    String? errorMessage,
  }) {
    return RegisterState(
      status: status ?? this.status,
      username: username ?? this.username,
      nationality: nationality ?? this.nationality,
      residency: residency ?? this.residency,
      nativeLanguage: nativeLanguage ?? this.nativeLanguage,
      spokenLanguages: spokenLanguages ?? this.spokenLanguages,
      hobbies: hobbies ?? this.hobbies,
      selectedHobbiesIndexes:
          selectedHobbiesIndexes ?? this.selectedHobbiesIndexes,
      photoUrl: photoUrl ?? this.photoUrl,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}

/*class RegisterInitial extends RegisterState {}

// Username
class RegisterUsernameState extends RegisterState {
  final String steps = "1";
}

// Countries buttons
class RegisterCountriesState extends RegisterState {
  final String? nationality;
  final String? residence;
  final String steps = "2";

  const RegisterCountriesState({this.nationality, this.residence});

  RegisterCountriesState copyWith({
    String? nationality,
    String? residence,
  }) {
    return RegisterCountriesState(
      nationality: nationality ?? this.nationality,
      residence: residence ?? this.residence,
    );
  }
}

class NationalityCountrySelectedState extends RegisterState {
  final String nationality;

  const NationalityCountrySelectedState({required this.nationality});
}

class ResidenceCountrySelectedState extends RegisterState {
  final String residence;

  const ResidenceCountrySelectedState({required this.residence});
}

// Languages buttons
class RegisterLanguagesState extends RegisterState {
  final String steps = "3";
}

class NativeLanguageSelectedState extends RegisterState {
  final String nativeLangue;

  const NativeLanguageSelectedState({required this.nativeLangue});
}

class SpokenLanguagesSelectedState extends RegisterState {
  final String spokenLanguages;

  const SpokenLanguagesSelectedState({required this.spokenLanguages});
}

class RegisterHobbiesState extends RegisterState {
  final List<Hobby> hobbies;
  final String steps = "4";

  const RegisterHobbiesState({required this.hobbies});
}

class RegisterPhotoState extends RegisterState {
  final String steps = "5";
}

class RegisterCompleteState extends RegisterState {}

class RegisterErrorState extends RegisterState {
  final String errorMessage;

  const RegisterErrorState({required this.errorMessage});
}

class RegisterLoadingState extends RegisterState {}
*/
