import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/usecases/usecase.dart';
import '../../../hobbies/domain/entities/hobby.dart';
import '../../../hobbies/domain/use_cases/get_hobbies.dart';
import '../../domain/entities/user_entity.dart';

import 'package:waaa/injection_container.dart' as di;

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(RegisterInitial()) {
    on<RegisterEvent>((event, emit) {
      on<ValidateUsernameButtonPressed>(_onValidateUsernameButtonPressed);
      on<ValidateCountriesButtonPressed>(_onValidateCountriesButtonPressed);
      on<ValidateLanguagesButtonPressed>(_onValidateLanguagesButtonPressed);
      on<ValidateHobbiesButtonPressed>(_onValidateHobbiesButtonPressed);
      on<ValidatePhotoButtonPressed>(_onValidatePhotoButtonPressed);
    });
  }

  void _onValidateUsernameButtonPressed(ValidateUsernameButtonPressed event, Emitter<RegisterState> emit) async {
    if (state is RegisterInitial) {
      try {
        if (event.username.isNotEmpty) {
          emit(RegisterCountriesState());
        }
      } catch (e) {
        print(e);
      }
    }
  }

  void _onValidateCountriesButtonPressed(ValidateCountriesButtonPressed event, Emitter<RegisterState> emit) async {
    if (state is RegisterCountriesState) {
      try {
        emit(RegisterLanguagesState());
      } catch (e) {
        print(e);
      }
    }
  }

  void _onValidateLanguagesButtonPressed(ValidateLanguagesButtonPressed event, Emitter<RegisterState> emit) async {
    if (state is RegisterLanguagesState) {
      try {
        var hobbiesList = await di.sl<GetHobbies>().call(NoParams());
        emit(RegisterHobbiesState(hobbies: hobbiesList));
      } catch (e) {
        print(e);
      }
    }
  }

  void _onValidateHobbiesButtonPressed(ValidateHobbiesButtonPressed event, Emitter<RegisterState> emit) async {
    if (state is RegisterHobbiesState) {
      try {
        emit(RegisterPhotoState());
      } catch (e) {
        print(e);
      }
    }
  }

  void _onValidatePhotoButtonPressed(ValidatePhotoButtonPressed event, Emitter<RegisterState> emit) async {
    if (state is RegisterPhotoState) {
      try {
        //await authRepository.signUpWithEmail(event.user.email, event.password);
        emit(RegisterCompleteState());
      } catch (e) {
        print(e);
      }
    }
  }
}
