import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';
import 'package:waaa/features/auth/presentation/manager/auth_bloc/auth_bloc.dart';
import 'package:waaa/features/users/domain/entities/user_entity.dart';
import 'package:waaa/features/users/domain/use_cases/create_user.dart';

import '../../../../core/usecases/usecase.dart';
import '../../../hobbies/domain/entities/hobby.dart';

import 'package:waaa/injection_container.dart' as di;

import '../../../hobbies/domain/use_cases/get_hobbies.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  AuthBloc authBloc;

  RegisterBloc(this.authBloc) : super(RegisterInitial()) {
    on<RegisterEvent>((event, emit) {
      on<ValidateUsernameButtonPressed>(_onValidateUsernameButtonPressed);
      on<ValidateCountriesButtonPressed>(_onValidateCountriesButtonPressed);
      on<ValidateLanguagesButtonPressed>(_onValidateLanguagesButtonPressed);
      on<ValidateHobbiesButtonPressed>(_onValidateHobbiesButtonPressed);
      on<ValidatePhotoButtonPressed>(_onValidatePhotoButtonPressed);
      on<RegisterCompleteEvent>(_onRegisterUser);
    });
  }

  void _onValidateUsernameButtonPressed(
      ValidateUsernameButtonPressed event, Emitter<RegisterState> emit) async {
    if (state is RegisterInitial) {
      try {
        if (event.username.isNotEmpty) {
          emit(RegisterCountriesState());
        }
      } catch (e) {
        rethrow;
      }
    }
  }

  void _onValidateCountriesButtonPressed(
      ValidateCountriesButtonPressed event, Emitter<RegisterState> emit) async {
    if (state is RegisterCountriesState) {
      try {
        emit(RegisterLanguagesState());
      } catch (e) {
        rethrow;
      }
    }
  }

  void _onValidateLanguagesButtonPressed(
      ValidateLanguagesButtonPressed event, Emitter<RegisterState> emit) async {
    if (state is RegisterLanguagesState) {
      try {
        var hobbiesList = await di.sl<GetHobbies>().call(NoParams());
        emit(RegisterHobbiesState(hobbies: hobbiesList));
      } catch (e) {
        rethrow;
      }
    }
  }

  void _onValidateHobbiesButtonPressed(
      ValidateHobbiesButtonPressed event, Emitter<RegisterState> emit) async {
    if (state is RegisterHobbiesState) {
      try {
        emit(RegisterPhotoState());
      } catch (e) {
        rethrow;
      }
    }
  }

  void _onValidatePhotoButtonPressed(
      ValidatePhotoButtonPressed event, Emitter<RegisterState> emit) async {
    if (state is RegisterPhotoState) {
      try {
        emit(RegisterCompleteState());
      } catch (e) {
        rethrow;
      }
    }
  }

  void _onRegisterUser(
      RegisterCompleteEvent event, Emitter<RegisterState> emit) async {
    var listHobbies = await di.sl<GetHobbies>().call(NoParams());
    var selectedHobbies =
        getListFromIndices(event.selectedHobbies, listHobbies);

    User user = User(
      // TODO : Add nationality and residence
      nativeLanguage: event.nativeLanguage,
      username: event.username,
      languagesSpeak: event.spokenLanguages,
      hobbies: selectedHobbies,
      photo: event.photoUrl,
    );
    try {
      await di.sl<CreateUser>().call(CreateUserParams(user: user));
      authBloc.add(Registered(user: user));
    } catch (e) {
      rethrow;
    }
  }
}

List<T> getListFromIndices<T>(List<int> indices, List<T> elements) {
  List<T> result = [];
  for (int index in indices) {
    if (index >= 0 && index < elements.length) {
      result.add(elements[index]);
    }
  }
  return result;
}
