import 'package:waaa/features/users/domain/entities/user_entity.dart';

class ProfilePageArguments {
  final User user;
  final bool isFromSearching;

  const ProfilePageArguments(
      {required this.user, required this.isFromSearching});
}
