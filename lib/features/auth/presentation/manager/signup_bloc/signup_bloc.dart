import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:waaa/core/usecases/usecase.dart';
import 'package:waaa/features/auth/domain/use_cases/confirm_sign_up.dart';
import 'package:waaa/features/auth/domain/use_cases/login_with_email.dart';

import 'package:waaa/injection_container.dart' as di;

import '../../../domain/use_cases/get_current_auth_user.dart';
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

  @override
  void onTransition(Transition<SignupEvent, SignupState> transition) {
    super.onTransition(transition);
    print(transition);
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
          event.password.length > 7 &&
          (event.password == event.confirmPassword)) {
        var signup = await di
            .sl<SignUpWithEmail>()
            .call(SignUpParams(email: event.email, password: event.password));
        if (signup) {
          emit(SignupConfirmCodeState());
        } else {
          emit(SignupErrorState());
        }
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
        var confirmed = await di
            .sl<ConfirmSignUp>()
            .call(ConfirmSignUpParams(email: event.email, code: event.code));
        if (confirmed) {
          await di
              .sl<LoginWithEmail>()
              .call(Params(email: event.email, password: event.password));
          var token = await di.sl<GetCurrentAuthUser>().call(NoParams());
          emit(SignUpCompletedState());
          authBloc.add(SignedUp(id: token.userId));
        } else {
          emit(SignupErrorState());
        }
      }
    } catch (e) {
      rethrow;
    }
  }
}
