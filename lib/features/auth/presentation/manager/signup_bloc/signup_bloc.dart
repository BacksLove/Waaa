import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:waaa/features/auth/domain/use_cases/confirm_sign_up.dart';

import 'package:waaa/injection_container.dart' as di;

part 'signup_event.dart';
part 'signup_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {

  SignupBloc() : super(SignupInitialState()) {
    on<ValidateEmailButtonPressed>(_onValidateEmailButtonPressed);
    on<ValidatePasswordButtonPressed>(_onValidatePasswordButtonPressed);
    on<ValidateConfirmCodeButtonPressed>(_onValidateConfirmCodeButtonPressed);
  }

  void _onValidateEmailButtonPressed(ValidateEmailButtonPressed event, Emitter<SignupState> emit) async {
    if (state is SignupInitialState) {
      try {
        if (event.email.isNotEmpty) {
          emit(SignupPasswordState());
        }
      } catch (e) {
        print(e);
      }
    }
  }

  void _onValidatePasswordButtonPressed(ValidatePasswordButtonPressed event, Emitter<SignupState> emit) async {
    if (state is SignupPasswordState || state is SignupPasswordErrorState) {
      try {
        if (event.password.isNotEmpty && event.password.length > 8 && (event.password == event.confirmPassword)) {
          //di.sl<SignUpWithEmail>().call(Params(email: event.email, password: event.password));
          //await authRepository.signUpWithEmail(event.email, event.password);
          //await authRepository.fetchCurrentUserAttributes();
          emit(SignupConfirmCodeState());
        } else {
          emit(SignupPasswordErrorState());
        }
      } catch (e) {
        print(e);
      }
    }
  }

  void _onValidateConfirmCodeButtonPressed(ValidateConfirmCodeButtonPressed event, Emitter<SignupState> emit) async {
    if (state is SignupConfirmCodeState) {
      try {
        if (event.code.isNotEmpty) {
          emit(SignupLoadingState());
          //await di.sl<ConfirmSignUp>().call(Params(email: event.email, code: event.code));
          emit(SignUpCompletedState());
        }
      } catch (e) {
        print(e);
      }
    }
  }

}
