import 'package:waaa/models/ModelProvider.dart';

abstract class FriendshipRepository {
  Future<Friendship?> getFriendshipStatus(String userId, String friendId);
}
