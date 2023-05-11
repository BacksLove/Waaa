enum LoginStatus {
  initial,
  loading,
  error,
  succeed,
}

enum LoginErrorType {
  none,
  emptyEmail,
  emptyPassword,
  userNotFound,
}
