part of 'register_bloc.dart';

abstract class RegisterEvent extends Equatable {
  const RegisterEvent();

  @override
  List<Object?> get props => [];
}

class ValidateUsernameButtonPressed extends RegisterEvent {
  final String username;

  const ValidateUsernameButtonPressed({required this.username});
}

class ValidateCountriesButtonPressed extends RegisterEvent {
  final String nationalityCountry;
  final String residenceCountry;

  const ValidateCountriesButtonPressed({required this.nationalityCountry, required this.residenceCountry});
}

class ValidateLanguagesButtonPressed extends RegisterEvent {
  final String nativeLanguage;
  final List<String> otherSpeakLanguages;

  const ValidateLanguagesButtonPressed({required this.nativeLanguage, required this.otherSpeakLanguages});
}

class ValidateHobbiesButtonPressed extends RegisterEvent {
  final List<int> hobbiesIndexes;

  const ValidateHobbiesButtonPressed({required this.hobbiesIndexes});
}

class ValidatePhotoButtonPressed extends RegisterEvent {
  final String photoUrl;

  const ValidatePhotoButtonPressed({required this.photoUrl});
}

class OpenImagePicker extends RegisterEvent {
  final ImageSource source;

  const OpenImagePicker({required this.source});
}

class ProvideImagePath extends RegisterEvent {
  final String picturePath;

  const ProvideImagePath({required this.picturePath});
}

class RegisterCompleteEvent extends RegisterEvent {
  final String username;
  final String nationality;
  final String residence;
  final String nativeLanguage;
  final List<String> spokenLanguages;
  final List<int> selectedHobbies;
  final String photoUrl;

  const RegisterCompleteEvent({required this.username, required this.nationality, required this.residence, required this.nativeLanguage, required this.spokenLanguages, required this.selectedHobbies, required this.photoUrl});

}