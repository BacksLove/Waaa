part of 'register_bloc.dart';

class RegisterState extends Equatable {
  final RegisterStatus status;
  final String username;
  final DateTime birthdate;
  final String nationality;
  final String residency;
  final String nativeLanguage;
  final List<String> spokenLanguages;
  final List<Hobby?> hobbies;
  final List<int> selectedHobbiesIndexes;
  final String photoUrl;
  final RegisterErrorType errorType;
  final XFile? photoFile;

  const RegisterState({
    required this.status,
    required this.username,
    required this.birthdate,
    required this.nationality,
    required this.residency,
    required this.nativeLanguage,
    required this.spokenLanguages,
    required this.hobbies,
    required this.selectedHobbiesIndexes,
    required this.photoUrl,
    required this.errorType,
    this.photoFile,
  });

  factory RegisterState.initial() => RegisterState(
      status: RegisterStatus.usernameStep,
      username: "",
      birthdate: DateTime.now(),
      nationality: "",
      residency: "",
      nativeLanguage: "",
      spokenLanguages: const [],
      hobbies: const [],
      selectedHobbiesIndexes: const [],
      errorType: RegisterErrorType.none,
      photoUrl: "");

  @override
  List<Object> get props {
    return [
      status,
      username,
      birthdate,
      nationality,
      residency,
      nativeLanguage,
      spokenLanguages,
      hobbies,
      selectedHobbiesIndexes,
      errorType,
      photoUrl,
    ];
  }

  @override
  bool get stringify => true;

  RegisterState copyWith({
    RegisterStatus? status,
    String? username,
    DateTime? birthdate,
    String? nationality,
    String? residency,
    String? nativeLanguage,
    List<String>? spokenLanguages,
    List<Hobby?>? hobbies,
    List<int>? selectedHobbiesIndexes,
    String? photoUrl,
    RegisterErrorType? errorType,
    XFile? photoFile,
  }) {
    return RegisterState(
        status: status ?? this.status,
        username: username ?? this.username,
        birthdate: birthdate ?? this.birthdate,
        nationality: nationality ?? this.nationality,
        residency: residency ?? this.residency,
        nativeLanguage: nativeLanguage ?? this.nativeLanguage,
        spokenLanguages: spokenLanguages ?? this.spokenLanguages,
        hobbies: hobbies ?? this.hobbies,
        selectedHobbiesIndexes:
            selectedHobbiesIndexes ?? this.selectedHobbiesIndexes,
        photoUrl: photoUrl ?? this.photoUrl,
        errorType: errorType ?? this.errorType,
        photoFile: photoFile ?? this.photoFile);
  }
}
