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

class ValidateCountriesButtonPressed extends RegisterEvent {}

class ValidateLanguagesButtonPressed extends RegisterEvent {}

class NationalityCountrySelected extends RegisterEvent {
  final String nationalityCountry;

  const NationalityCountrySelected({required this.nationalityCountry});
}

class ResidenceCountrySelected extends RegisterEvent {
  final String residenceCountry;

  const ResidenceCountrySelected({required this.residenceCountry});
}

class NativeLanguageSelected extends RegisterEvent {
  final String nativeLanguage;

  const NativeLanguageSelected({required this.nativeLanguage});
}

class SpeakLanguagesSelected extends RegisterEvent {
  final String speakLanguage;

  const SpeakLanguagesSelected({required this.speakLanguage});
}

class ValidateHobbiesButtonPressed extends RegisterEvent {
  final List<int> hobbiesIndexes;

  const ValidateHobbiesButtonPressed({required this.hobbiesIndexes});
}

class ValidatePhotoButtonPressed extends RegisterEvent {
  final String photoUrl;

  const ValidatePhotoButtonPressed({required this.photoUrl});
}

class ValidateBirthdayPressed extends RegisterEvent {
  final DateTime birthday;

  const ValidateBirthdayPressed({required this.birthday});
}

class OpenImagePicker extends RegisterEvent {
  final ImageSource source;

  const OpenImagePicker({required this.source});
}

class ProvideImagePath extends RegisterEvent {
  final String picturePath;

  const ProvideImagePath({required this.picturePath});
}

class RegisterCompleteEvent extends RegisterEvent {}
