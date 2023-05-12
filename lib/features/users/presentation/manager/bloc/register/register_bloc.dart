import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:waaa/core/constants/constants.dart';
import 'package:waaa/features/auth/presentation/manager/auth_bloc/auth_bloc.dart';
import 'package:waaa/features/users/domain/entities/user_entity.dart';
import 'package:waaa/features/users/domain/use_cases/create_user.dart';
import 'package:waaa/features/users/domain/use_cases/upload_user_photo.dart';

import '../../../../../../core/enums/register_enum.dart';
import '../../../../../../core/usecases/usecase.dart';
import '../../../../../../core/util/list_from_indices.dart';
import '../../../../../hobbies/domain/entities/hobby.dart';

import 'package:waaa/injection_container.dart' as di;

import '../../../../../hobbies/domain/use_cases/get_hobbies.dart';

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
    // print(transition);
  }

  void _onValidateUsernameButtonPressed(
      ValidateUsernameButtonPressed event, Emitter<RegisterState> emit) async {
    try {
      if (event.username.isNotEmpty) {
        // TODO: Username taken

        emit(state.copyWith(
          status: RegisterStatus.countryStep,
          username: event.username,
          errorType: RegisterErrorType.none,
        ));
      } else {
        emit(state.copyWith(errorType: RegisterErrorType.usernameEmpty));
      }
    } catch (e) {
      //emit(state.copyWith(errorMessage: e.toString()));
      rethrow;
    }
  }

  void _onValidateCountriesButtonPressed(
      ValidateCountriesButtonPressed event, Emitter<RegisterState> emit) async {
    try {
      if (state.nationality.isEmpty) {
        emit(state.copyWith(errorType: RegisterErrorType.nationalityEmpty));
      } else if (state.residency.isEmpty) {
        emit(state.copyWith(errorType: RegisterErrorType.residencyEmpty));
      } else {
        emit(
          state.copyWith(
            status: RegisterStatus.languagesStep,
            errorType: RegisterErrorType.none,
          ),
        );
      }
    } catch (e) {
      //emit(state.copyWith(errorMessage: e.toString()));
      rethrow;
    }
  }

  void _onValidateLanguagesButtonPressed(
      ValidateLanguagesButtonPressed event, Emitter<RegisterState> emit) async {
    try {
      if (state.nativeLanguage.isEmpty) {
        emit(state.copyWith(errorType: RegisterErrorType.nationalityEmpty));
      } else if (state.spokenLanguages.isEmpty) {
        emit(state.copyWith(errorType: RegisterErrorType.spokenLanguagesEmpty));
      } else {
        emit(state.copyWith(status: RegisterStatus.loading));
        var hobbiesList = await di.sl<GetHobbies>().call(NoParams());
        emit(
          state.copyWith(
            status: RegisterStatus.hobbiesStep,
            hobbies: hobbiesList,
            errorType: RegisterErrorType.none,
          ),
        );
      }
    } catch (e) {
      //emit(state.copyWith(errorMessage: e.toString()));
      rethrow;
    }
  }

  void _onValidateHobbiesButtonPressed(
      ValidateHobbiesButtonPressed event, Emitter<RegisterState> emit) async {
    try {
      emit(state.copyWith(
        status: RegisterStatus.photoStep,
        selectedHobbiesIndexes: event.hobbiesIndexes,
        errorType: RegisterErrorType.none,
      ));
    } catch (e) {
      //emit(state.copyWith(errorMessage: e.toString()));
      rethrow;
    }
  }

  void _onValidatePhotoButtonPressed(
      ValidatePhotoButtonPressed event, Emitter<RegisterState> emit) async {
    try {
      if (event.photoUrl.isNotEmpty) {
        emit(state.copyWith(
          status: RegisterStatus.createUser,
          errorType: RegisterErrorType.none,
        ));
      } else {
        emit(state.copyWith(errorType: RegisterErrorType.photoEmpty));
      }
    } catch (e) {
      //emit(state.copyWith(errorMessage: e.toString()));
      rethrow;
    }
  }

  void _onRegisterUser(
      RegisterCompleteEvent event, Emitter<RegisterState> emit) async {
    emit(state.copyWith(status: RegisterStatus.loading));
    //var selectedHobbies = getListFromIndices(state.selectedHobbiesIndexes, state.hobbies);
    var userId = di.sl<SharedPreferences>().getString(userIdKey);
    late String? photoLink;
    if (state.photoUrl.isNotEmpty && userId != null) {
      photoLink = await di
          .sl<UploadUserPhoto>()
          .call(UploadUserPhotoParams(file: state.photoFile!, userId: userId));
    }

    User user = User(
        cognitoUserPoolId: userId,
        nativeLanguage: state.nativeLanguage,
        username: state.username,
        photo: photoLink,
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
    if (event.nationalityCountry.isNotEmpty) {
      emit(state.copyWith(
        nationality: event.nationalityCountry,
        errorType: RegisterErrorType.none,
      ));
    } else {
      emit(state.copyWith(errorType: RegisterErrorType.countrySelectError));
    }
  }

  void _onResidenceCountrySelected(
      ResidenceCountrySelected event, Emitter<RegisterState> emit) {
    if (event.residenceCountry.isNotEmpty) {
      emit(state.copyWith(
        residency: event.residenceCountry,
        errorType: RegisterErrorType.none,
      ));
    } else {
      emit(state.copyWith(errorType: RegisterErrorType.countrySelectError));
    }
  }

  void _onNativeLanguageSelected(
      NativeLanguageSelected event, Emitter<RegisterState> emit) {
    if (event.nativeLanguage.isNotEmpty) {
      emit(state.copyWith(
        nativeLanguage: event.nativeLanguage,
        errorType: RegisterErrorType.none,
      ));
    } else {
      emit(state.copyWith(
        errorType: RegisterErrorType.countrySelectError,
      ));
    }
  }

  void _onSpeakLanguagesSelected(
      SpeakLanguagesSelected event, Emitter<RegisterState> emit) {
    try {
      if (event.speakLanguage.isNotEmpty) {
        List<String> speaks = List.from(state.spokenLanguages);
        if (speaks.contains(event.speakLanguage)) {
          emit(state.copyWith(
              errorType: RegisterErrorType.spokenLanguageAlreadySelected));
        } else {
          speaks.add(event.speakLanguage);
          emit(state.copyWith(
            spokenLanguages: speaks,
            errorType: RegisterErrorType.none,
          ));
        }
      } else {
        emit(state.copyWith(errorType: RegisterErrorType.countrySelectError));
      }
    } catch (e) {
      //emit(state.copyWith(errorMessage: e.toString()));
      rethrow;
    }
  }

  void _onOpenImagePicker(
      OpenImagePicker event, Emitter<RegisterState> emit) async {
    final pickedFile = await imagePicker.pickImage(source: event.source);
    if (pickedFile != null) {
      emit(state.copyWith(photoUrl: pickedFile.path, photoFile: pickedFile));
    } else {
      emit(state.copyWith(
        errorType: RegisterErrorType.photoSelectError,
      ));
    }
  }
}
