import 'package:waaa/models/User.dart';

class ProfilePageArguments {
  final User user;
  final bool isFromSearching;

  const ProfilePageArguments(
      {required this.user, required this.isFromSearching});
}
