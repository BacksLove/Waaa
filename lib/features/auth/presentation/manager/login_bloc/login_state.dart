// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import '../../../../../core/enums/login_enum.dart';

class LoginState extends Equatable {
  final LoginStatus status;
  final String? errorMesssage;
  final bool isPassworHidden;

  const LoginState({
    required this.status,
    this.errorMesssage,
    this.isPassworHidden = true,
  });

  @override
  List<Object?> get props => [status, errorMesssage];

  LoginState copyWith({
    LoginStatus? status,
    String? errorMesssage,
    bool? isPassworHidden,
  }) {
    return LoginState(
      status: status ?? this.status,
      errorMesssage: errorMesssage ?? this.errorMesssage,
      isPassworHidden: isPassworHidden ?? this.isPassworHidden,
    );
  }
}
