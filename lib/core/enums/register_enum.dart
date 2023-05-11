enum RegisterStatus {
  loading,
  usernameStep,
  countryStep,
  languagesStep,
  hobbiesStep,
  photoStep,
  createUser,
  complete
}

enum RegisterErrorType {
  none,
  usernameEmpty,
  usernameTaken,
  nationalityEmpty,
  residencyEmpty,
  nativeLanguageEmpty,
  spokenLanguagesEmpty,
  spokenLanguageAlreadySelected,
  countrySelectError,
  photoSelectError,
  photoEmpty,
}
