// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import '../../../../../core/enums/login_enum.dart';

class LoginState extends Equatable {
  final LoginStatus status;
  final LoginErrorType? errorType;
  final bool isPassworHidden;
  final bool hasAcceptConditions;

  const LoginState({
    required this.status,
    this.errorType,
    this.isPassworHidden = true,
    this.hasAcceptConditions = false,
  });

  @override
  List<Object?> get props =>
      [status, errorType, isPassworHidden, hasAcceptConditions];

  LoginState copyWith({
    LoginStatus? status,
    LoginErrorType? errorType,
    bool? isPassworHidden,
    bool? hasAcceptConditions,
  }) {
    return LoginState(
      status: status ?? this.status,
      errorType: errorType ?? this.errorType,
      isPassworHidden: isPassworHidden ?? this.isPassworHidden,
      hasAcceptConditions: hasAcceptConditions ?? this.hasAcceptConditions,
    );
  }
}
