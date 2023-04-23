import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:waaa/core/constants/constants.dart';
import 'package:waaa/features/auth/presentation/manager/auth_bloc/auth_bloc.dart';
import 'package:waaa/features/users/domain/entities/user_entity.dart';
import 'package:waaa/features/users/domain/use_cases/create_user.dart';
import 'package:waaa/features/users/domain/use_cases/upload_user_photo.dart';

import '../../../../core/enums/register_enum.dart';
import '../../../../core/usecases/usecase.dart';
import '../../../hobbies/domain/entities/hobby.dart';

import 'package:waaa/injection_container.dart' as di;

import '../../../hobbies/domain/use_cases/get_hobbies.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  AuthBloc authBloc;

  final ImagePicker imagePicker = ImagePicker();

  RegisterBloc(this.authBloc) : super(RegisterState.initial()) {
    on<ValidateUsernameButtonPressed>(_onValidateUsernameButtonPressed);
    on<ValidateCountriesButtonPressed>(_onValidateCountriesButtonPressed);
    on<NationalityCountrySelected>(_onNationalityCountrySelected);
    on<ResidenceCountrySelected>(_onResidenceCountrySelected);
    on<NativeLanguageSelected>(_onNativeLanguageSelected);
    on<SpeakLanguagesSelected>(_onSpeakLanguagesSelected);
    on<ValidateLanguagesButtonPressed>(_onValidateLanguagesButtonPressed);
    on<ValidateHobbiesButtonPressed>(_onValidateHobbiesButtonPressed);
    on<ValidatePhotoButtonPressed>(_onValidatePhotoButtonPressed);
    on<RegisterCompleteEvent>(_onRegisterUser);
    on<OpenImagePicker>(_onOpenImagePicker);
  }

  @override
  void onTransition(Transition<RegisterEvent, RegisterState> transition) {
    super.onTransition(transition);
    //print(transition);
  }

  void _onValidateUsernameButtonPressed(
      ValidateUsernameButtonPressed event, Emitter<RegisterState> emit) async {
    try {
      if (event.username.isNotEmpty) {
        emit(state.copyWith(
          status: RegisterStatus.countryStep,
          username: event.username,
          errorMessage: "",
        ));
      } else {
        emit(state.copyWith(errorMessage: "username shouldn't be empty"));
      }
    } catch (e) {
      emit(state.copyWith(errorMessage: e.toString()));
      rethrow;
    }
  }

  void _onValidateCountriesButtonPressed(
      ValidateCountriesButtonPressed event, Emitter<RegisterState> emit) async {
    try {
      emit(state.copyWith(errorMessage: ""));
      if (state.nationality.isEmpty) {
        emit(state.copyWith(
            errorMessage: "You have to select a country for nationality"));
      } else if (state.residency.isEmpty) {
        emit(state.copyWith(
            errorMessage: "You have to select a country for residence"));
      } else {
        emit(state.copyWith(
          status: RegisterStatus.languagesStep,
          errorMessage: "",
        ));
      }
    } catch (e) {
      emit(state.copyWith(errorMessage: e.toString()));
      rethrow;
    }
  }

  void _onValidateLanguagesButtonPressed(
      ValidateLanguagesButtonPressed event, Emitter<RegisterState> emit) async {
    try {
      emit(state.copyWith(status: RegisterStatus.loading, errorMessage: ""));
      var hobbiesList = await di.sl<GetHobbies>().call(NoParams());
      emit(state.copyWith(
        status: RegisterStatus.hobbiesStep,
        hobbies: hobbiesList,
        errorMessage: "",
      ));
    } catch (e) {
      emit(state.copyWith(errorMessage: e.toString()));
      rethrow;
    }
  }

  void _onValidateHobbiesButtonPressed(
      ValidateHobbiesButtonPressed event, Emitter<RegisterState> emit) async {
    try {
      emit(state.copyWith(
        status: RegisterStatus.photoStep,
        selectedHobbiesIndexes: event.hobbiesIndexes,
        errorMessage: "",
      ));
    } catch (e) {
      emit(state.copyWith(errorMessage: e.toString()));
      rethrow;
    }
  }

  void _onValidatePhotoButtonPressed(
      ValidatePhotoButtonPressed event, Emitter<RegisterState> emit) async {
    try {
      emit(state.copyWith(errorMessage: ""));
      if (event.photoUrl.isNotEmpty) {
        emit(state.copyWith(
          status: RegisterStatus.createUser,
          errorMessage: "",
        ));
      } else {
        emit(state.copyWith(errorMessage: "You have to choose a photo"));
      }
    } catch (e) {
      emit(state.copyWith(errorMessage: e.toString()));
      rethrow;
    }
  }

  void _onRegisterUser(
      RegisterCompleteEvent event, Emitter<RegisterState> emit) async {
    emit(state.copyWith(status: RegisterStatus.loading, errorMessage: ""));
    //var selectedHobbies = getListFromIndices(state.selectedHobbiesIndexes, state.hobbies);
    var userId = di.sl<SharedPreferences>().getString(userIdKey);
    User user = User(
        cognitoUserPoolId: userId,
        nativeLanguage: state.nativeLanguage,
        username: state.username,
        languagesSpeak: state.spokenLanguages);
    try {
      final bool creation =
          await di.sl<CreateUser>().call(CreateUserParams(user: user));
      if (creation) {
      } else {}

      emit(state.copyWith(status: RegisterStatus.complete));
      authBloc.add(Registered(user: user));
    } catch (e) {
      rethrow;
    }
  }

  void _onNationalityCountrySelected(
      NationalityCountrySelected event, Emitter<RegisterState> emit) {
    emit(state.copyWith(errorMessage: ""));
    if (event.nationalityCountry.isNotEmpty) {
      emit(state.copyWith(
        nationality: event.nationalityCountry,
        errorMessage: "",
      ));
    } else {
      emit(state.copyWith(
          errorMessage: "An error occured when selecting the nationality"));
    }
  }

  void _onResidenceCountrySelected(
      ResidenceCountrySelected event, Emitter<RegisterState> emit) {
    emit(state.copyWith(errorMessage: ""));
    if (event.residenceCountry.isNotEmpty) {
      emit(state.copyWith(
        residency: event.residenceCountry,
        errorMessage: "",
      ));
    } else {
      emit(state.copyWith(
          errorMessage: "An error occured when selecting the residence"));
    }
  }

  void _onNativeLanguageSelected(
      NativeLanguageSelected event, Emitter<RegisterState> emit) {
    emit(state.copyWith(errorMessage: ""));
    if (event.nativeLanguage.isNotEmpty) {
      emit(state.copyWith(
        nativeLanguage: event.nativeLanguage,
        errorMessage: "",
      ));
    } else {
      emit(state.copyWith(
          errorMessage: "An error occured when selecting the native language"));
    }
  }

  void _onSpeakLanguagesSelected(
      SpeakLanguagesSelected event, Emitter<RegisterState> emit) {
    try {
      if (event.speakLanguage.isNotEmpty) {
        List<String> speaks = List.from(state.spokenLanguages);
        if (speaks.contains(event.speakLanguage)) {
          emit(state.copyWith(errorMessage: "Country already selected"));
        } else {
          speaks.add(event.speakLanguage);
          emit(state.copyWith(
            spokenLanguages: speaks,
            errorMessage: "",
          ));
        }
      } else {
        emit(state.copyWith(
            errorMessage: "An error occured when selecting a spoken language"));
      }
    } catch (e) {
      emit(state.copyWith(errorMessage: e.toString()));
      rethrow;
    }
  }

  void _onOpenImagePicker(
      OpenImagePicker event, Emitter<RegisterState> emit) async {
    final pickedFile = await imagePicker.pickImage(source: event.source);
    final userId = di.sl<SharedPreferences>().getString(userIdKey);
    if (pickedFile != null && userId != null) {
      await di
          .sl<UploadUserPhoto>()
          .call(UploadUserPhotoParams(file: pickedFile, userId: userId));

      emit(state.copyWith(photoUrl: pickedFile.path));
    } else {
      emit(state.copyWith(
          errorMessage: "Something went wrong when choosing image"));
    }
  }
}
