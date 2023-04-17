import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';
import 'package:waaa/features/auth/presentation/manager/auth_bloc/auth_bloc.dart';
import 'package:waaa/features/users/domain/entities/user_entity.dart';
import 'package:waaa/features/users/domain/use_cases/create_user.dart';

import '../../../../core/enums/register_enum.dart';
import '../../../../core/usecases/usecase.dart';
import '../../../../core/util/list_from_indices.dart';
import '../../../hobbies/domain/entities/hobby.dart';

import 'package:waaa/injection_container.dart' as di;

import '../../../hobbies/domain/use_cases/get_hobbies.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  AuthBloc authBloc;

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
  }

  @override
  void onTransition(Transition<RegisterEvent, RegisterState> transition) {
    super.onTransition(transition);
    print(transition);
  }

  void _onValidateUsernameButtonPressed(
      ValidateUsernameButtonPressed event, Emitter<RegisterState> emit) async {
    try {
      if (event.username.isNotEmpty) {
        emit(state.copyWith(
            status: RegisterStatus.countryStep, username: event.username));
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
        emit(state.copyWith(status: RegisterStatus.languagesStep));
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
          status: RegisterStatus.hobbiesStep, hobbies: hobbiesList));
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
          errorMessage: ""));
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
        emit(state.copyWith(status: RegisterStatus.createUser));
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
    var selectedHobbies =
        getListFromIndices(state.selectedHobbiesIndexes, state.hobbies);

    User user = User(
      // TODO : Add nationality and residence
      nativeLanguage: state.nativeLanguage,
      username: state.username,
      languagesSpeak: state.spokenLanguages,
      hobbies: selectedHobbies,
      photo: state.photoUrl,
    );
    try {
      await di.sl<CreateUser>().call(CreateUserParams(user: user));
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
      emit(state.copyWith(nationality: event.nationalityCountry));
    } else {
      emit(state.copyWith(
          errorMessage: "An error occured when selecting the nationality"));
    }
  }

  void _onResidenceCountrySelected(
      ResidenceCountrySelected event, Emitter<RegisterState> emit) {
    emit(state.copyWith(errorMessage: ""));
    if (event.residenceCountry.isNotEmpty) {
      emit(state.copyWith(residency: event.residenceCountry));
    } else {
      emit(state.copyWith(
          errorMessage: "An error occured when selecting the residence"));
    }
  }

  void _onNativeLanguageSelected(
      NativeLanguageSelected event, Emitter<RegisterState> emit) {
    emit(state.copyWith(errorMessage: ""));
    if (event.nativeLanguage.isNotEmpty) {
      emit(state.copyWith(nativeLanguage: event.nativeLanguage));
    } else {
      emit(state.copyWith(
          errorMessage: "An error occured when selecting the native language"));
    }
  }

  void _onSpeakLanguagesSelected(
      SpeakLanguagesSelected event, Emitter<RegisterState> emit) {}
}
