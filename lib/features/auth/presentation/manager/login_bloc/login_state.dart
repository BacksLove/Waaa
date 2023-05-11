// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import '../../../../../core/enums/login_enum.dart';

class LoginState extends Equatable {
  final LoginStatus status;
  final LoginErrorType? errorType;
  final bool isPassworHidden;

  const LoginState({
    required this.status,
    this.errorType,
    this.isPassworHidden = true,
  });

  @override
  List<Object?> get props => [status, errorType, isPassworHidden];

  LoginState copyWith({
    LoginStatus? status,
    LoginErrorType? errorType,
    bool? isPassworHidden,
  }) {
    return LoginState(
      status: status ?? this.status,
      errorType: errorType ?? this.errorType,
      isPassworHidden: isPassworHidden ?? this.isPassworHidden,
    );
  }
}
