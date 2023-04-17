import 'dart:convert';

import 'package:amplify_flutter/amplify_flutter.dart';
import '../../domain/entities/user_entity.dart';

abstract class UserRemoteDatasource {
  Future<User?> getUserById(String id);
  Future<List<User>?> getUsersByCity(String city);
  Future<bool> createUser(User user);
  Future<bool> updateUser(User user);
  Future<bool> deleteUser(String id);
}

class UserRemoteDatasourceImpl implements UserRemoteDatasource {
  @override
  Future<bool> createUser(User user) {
    // TODO: implement createUser
    throw UnimplementedError();
  }

  @override
  Future<bool> deleteUser(String id) {
    // TODO: implement deletetUser
    throw UnimplementedError();
  }

  @override
  Future<List<User>> getEventUsers(String id) {
    // TODO: implement getEventUser
    throw UnimplementedError();
  }

  @override
  Future<User?> getUserById(String id) async {
    try {
      var doc = '''query MyQuery {
  getUser(id: "$id") {
    id
    username
    photo
    role
    gender
    lookingFor
    birthday
    nativeLanguage
    languagesSpeak
    suspended
    suspendedUntil
    reporting
    privacy
    createdAt
    bio
    events {
      items {
        address
      begin
      city
      country
      createdAt
      description
      end
      hourBegin
      id
      hourEnd
      isPublic
      language
      mainPhoto
      maxParticipants
      minAgeRestriction
      minParticipants
      name
      photos
      userEventsId
      }
    }
    hobbies {
      items {
        name
        id
      }
    }
    friends {
      items {
        id
        status
        friend {
          username
          id
          photo
        }
      }
    }
  }
}''';
      print("Dans remote avant d'executer");
      var operation =
          Amplify.API.query(request: GraphQLRequest<String>(document: doc));
      var result = await operation.response;
      print("Execution passée");
      if (result.data != null) {
        print("On entre quand meme");
        var userJSON = json.decode(result.data!)["getUser"];
        if (userJSON != null) {
          var user = User.fromJson(userJSON);
          print("Current User = ${user.username}");
          return user;
        }
      }
      print("Loupé , pas trouvé en base");
      return null;
    } catch (e) {
      print("Tchieeeee");
      safePrint(e);
      rethrow;
    }
  }

  @override
  Future<bool> updateUser(User user) {
    // TODO: implement updateUser
    throw UnimplementedError();
  }

  @override
  Future<List<User>?> getUsersByCity(String city) async {
    // TODO: implement getUsersByCity
    throw UnimplementedError();
  }
}
