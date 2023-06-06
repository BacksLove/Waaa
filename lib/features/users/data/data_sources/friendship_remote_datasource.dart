import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:waaa/core/queries/friendship_queries.dart';
import 'package:waaa/models/ModelProvider.dart';

abstract class FriendshipRemoteDatasource {
  Future<Friendship?> getFriendshipStatus(String userId, String friendId);
  Future<bool> addFriendship(String userId, String friendId);
  Future<bool> updateFriendship(
      String userId, String friendId, DemandStatus status);
}

class FriendshipRemoteDatasourceImpl implements FriendshipRemoteDatasource {
  @override
  Future<Friendship?> getFriendshipStatus(
      String userId, String friendId) async {
    try {
      const graphQLDocument = getFrienshipStatusQuery;
      final request = GraphQLRequest<PaginatedResult<Friendship>>(
        document: graphQLDocument,
        modelType: const PaginatedModelType(Friendship.classType),
        variables: <String, String>{'userId': userId, 'friendId': friendId},
        decodePath: "listFriendships",
      );
      final response = await Amplify.API.query(request: request).response;

      final friends = response.data?.items.first;

      if (friends == null) {
        safePrint("errors: ${response.errors}");
        return null;
      }
      return friends;
    } catch (e) {
      safePrint(e);
      return null;
    }
  }

  @override
  Future<bool> addFriendship(String userId, String friendId) async {
    try {
      const graphQLDocument = addFriendshipQuery;
      final request = GraphQLRequest<Friendship>(
        document: graphQLDocument,
        modelType: Friendship.classType,
        variables: <String, String>{'userId': userId, 'friendId': friendId},
        decodePath: "createFriendship",
      );
      final response = await Amplify.API.query(request: request).response;

      final friends = response.data;

      if (friends == null) {
        safePrint("errors: ${response.errors}");
        return false;
      }
      return true;
    } catch (e) {
      safePrint(e);
      return false;
    }
  }

  @override
  Future<bool> updateFriendship(
      String userId, String friendId, DemandStatus status) async {
    try {
      final friendShip = await getFriendshipStatus(userId, friendId);
      if (friendShip == null) return false;
      const graphQLDocument = updateFriendshipQuery;
      final request = GraphQLRequest<Friendship>(
        document: graphQLDocument,
        modelType: Friendship.classType,
        variables: <String, dynamic>{'id': friendShip.id, 'status': status},
        decodePath: "updateFriendship",
      );
      final response = await Amplify.API.query(request: request).response;

      final friends = response.data;

      if (friends == null) {
        safePrint("errors: ${response.errors}");
        return false;
      }
      return true;
    } catch (e) {
      safePrint(e);
      return false;
    }
  }
}



// canfollow = Requested
// unfollow = Rejected