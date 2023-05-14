enum RegisterStatus {
  loading,
  usernameStep,
  birthdayStep,
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
