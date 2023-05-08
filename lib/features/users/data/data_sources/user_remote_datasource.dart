import 'dart:convert';
import 'dart:io';

import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:waaa/core/constants/constants.dart';
import 'package:waaa/core/util/json_to_graphql.dart';
import '../../domain/entities/user_entity.dart';

abstract class UserRemoteDatasource {
  Future<User?> getUserById(String id);
  Future<List<User>?> getUsersByCity(String city);
  Future<bool> createUser(User user);
  Future<bool> updateUser(User user);
  Future<bool> deleteUser(String id);
  Future<String?> uploadUserPhoto(XFile file, String userId);
}

class UserRemoteDatasourceImpl implements UserRemoteDatasource {
  @override
  Future<bool> createUser(User user) async {
    try {
      var userEncoded = user.toJson().toString();
      var userGood = doubleQuotesAroundValues(userEncoded);
      var doc = '''
      mutation Mutation {
          createUser(input: $userGood}) {
                  id,
                  username
                }
              } 
          ''';
      var operation =
          Amplify.API.mutate(request: GraphQLRequest<String>(document: doc));
      var result = await operation.response;
      if (result.data != null) {
        return true;
      }
      return false;
    } catch (e) {
      safePrint(e);
      return false;
    }
  }

  @override
  Future<bool> deleteUser(String id) {
    throw UnimplementedError();
  }

  @override
  Future<User?> getUserById(String id) async {
    try {
      var doc = '''query MyQuery {
  getUser(cognitoUserPoolId: "$id") {
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
      var operation =
          Amplify.API.query(request: GraphQLRequest<String>(document: doc));
      var result = await operation.response;
      if (result.data != null) {
        var userJSON = json.decode(result.data!)["getUser"];
        if (userJSON != null) {
          var user = User.fromJson(userJSON);
          return user;
        }
      }
      return null;
    } catch (e) {
      safePrint(e);
      rethrow;
    }
  }

  @override
  Future<bool> updateUser(User user) {
    throw UnimplementedError();
  }

  @override
  Future<List<User>?> getUsersByCity(String city) async {
    throw UnimplementedError();
  }

  @override
  Future<String?> uploadUserPhoto(XFile file, String userId) async {
    try {
      final awsFile = File(file.path);
      await Amplify.Storage.uploadFile(
        local: awsFile,
        key: '$userPhotoDir$userId.png',
      );
      final photoUrl = await Amplify.Storage.getUrl(key: '$userId.png');
      return photoUrl.toString();
    } on StorageException catch (e) {
      safePrint('Error uploading file: ${e.message}');
      rethrow;
    }
  }
}
