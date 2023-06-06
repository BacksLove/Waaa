enum ProfileStatus {
  initial,
  loading,
  loaded,
  failed,
}

enum ProfileMenuItem {
  follow,
  report,
  block,
}

enum ProfileSubMenuItem {
  fakeProfile,
  harassment,
  abusiveLanguage,
}

enum ProfileFriendStatus {
  canFollow,
  followed,
  unfollow,
  rejected,
  blocked,
  waitResponse,
  waitAction,
}
