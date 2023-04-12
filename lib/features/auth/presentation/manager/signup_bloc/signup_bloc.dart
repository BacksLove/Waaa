import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:waaa/core/usecases/usecase.dart';
import 'package:waaa/features/auth/domain/use_cases/confirm_sign_up.dart';

import 'package:waaa/injection_container.dart' as di;

import '../../../domain/use_cases/get_current_auth_user copy.dart';
import '../../../domain/use_cases/sign_up_with_email.dart';
import '../auth_bloc/auth_bloc.dart';

part 'signup_event.dart';
part 'signup_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  final AuthBloc authBloc;

  SignupBloc(this.authBloc) : super(SignupInitialState()) {
    on<ValidateEmailButtonPressed>(_onValidateEmailButtonPressed);
    on<ValidatePasswordButtonPressed>(_onValidatePasswordButtonPressed);
    on<ValidateConfirmCodeButtonPressed>(_onValidateConfirmCodeButtonPressed);
  }

  void _onValidateEmailButtonPressed(
      ValidateEmailButtonPressed event, Emitter<SignupState> emit) async {
    if (state is SignupInitialState) {
      try {
        if (event.email.isNotEmpty) {
          emit(SignupPasswordState());
        }
      } catch (e) {
        rethrow;
      }
    }
  }

  void _onValidatePasswordButtonPressed(
      ValidatePasswordButtonPressed event, Emitter<SignupState> emit) async {
    try {
      if (event.password.isNotEmpty &&
          event.password.length > 8 &&
          (event.password == event.confirmPassword)) {
        await di
            .sl<SignUpWithEmail>()
            .call(SignUpParams(email: event.email, password: event.password));
        emit(SignupConfirmCodeState());
      } else {
        emit(SignupPasswordErrorState());
      }
    } catch (e) {
      rethrow;
    }
  }

  void _onValidateConfirmCodeButtonPressed(
      ValidateConfirmCodeButtonPressed event, Emitter<SignupState> emit) async {
    try {
      if (event.code.isNotEmpty) {
        emit(SignupLoadingState());
        await di
            .sl<ConfirmSignUp>()
            .call(ConfirmSignUpParams(email: event.email, code: event.code));
        var token = await di.sl<GetCurrentAuthUser>().call(NoParams());
        emit(SignUpCompletedState());
        authBloc.add(SignedUp(id: token.userId));
      }
    } catch (e) {
      rethrow;
    }
  }
}
