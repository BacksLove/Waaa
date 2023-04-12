part of 'auth_bloc.dart';

class AuthState extends Equatable {
  final AuthenticationStatus status;
  final User? user;

  const AuthState._({this.status = AuthenticationStatus.unknown, this.user});

  const AuthState.unknown() : this._();

  const AuthState.authenticated(User user)
      : this._(status: AuthenticationStatus.authenticated, user: user);

  const AuthState.unauthenticated()
      : this._(status: AuthenticationStatus.unauthenticated);

  const AuthState.registered()
      : this._(status: AuthenticationStatus.registered);

  @override
  List<Object?> get props => [status, user];

  /*factory AuthState.initial() {
    return const AuthState(
        status: AuthenticationStatus.unknown, userId: "", user: null);
  }

  @override
  List<Object?> get props => [status, userId, user];

  AuthState copyWith({
    AuthenticationStatus? status,
    String? userId,
    User? user,
  }) {
    return AuthState(
      status: status ?? this.status,
      userId: userId ?? this.userId,
      user: user ?? this.user,
    );
  }

  @override
  bool get stringify => true;*/
}
