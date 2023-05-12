enum LoginStatus {
  initial,
  loading,
  error,
  succeed,
}

enum LoginErrorType {
  none,
  conditionsNotChecked,
  emptyEmail,
  emptyPassword,
  userNotFound,
}
