import 'dart:convert';
import 'dart:io';

import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:waaa/core/constants/constants.dart';
import 'package:waaa/core/environment/graphql_config.dart';
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
  static GraphQLConfig graphQLConfig = GraphQLConfig();
  GraphQLClient client = graphQLConfig.clientToQuery();

  @override
  Future<bool> createUser(User user) async {
    try {
      var userEncoded = user.toJson();
      safePrint(userEncoded);
      var doc = ''' mutation CreateUser(\$input: CreateUserInput!) {
          createUser(input: \$input) {
                  id,
                  cognitoUserPoolId,
                  username
                }
              } 
          ''';
      /*QueryResult result = await client.mutate(
        MutationOptions(
            fetchPolicy: FetchPolicy.noCache,
            document: gql(doc),
            variables: userEncoded),
      );*/
      var operation = Amplify.API.mutate(
        request: GraphQLRequest<String>(
          document: doc,
          variables: <String, dynamic>{
            'input': userEncoded,
          },
        ),
      );
      var result = await operation.response;
      safePrint(result.data);
      safePrint(result.errors);
      //safePrint(result.exception);
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
  UsersByCognitoID(cognitoUserPoolId: "b7e44208-90f4-4b68-b6e5-471f028200d9") {
    items {
    id
    cognitoUserPoolId
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
  }
}''';
      var operation =
          Amplify.API.query(request: GraphQLRequest<String>(document: doc));
      var result = await operation.response;
      if (result.data != null) {
        //safePrint("result = ${result.data}");
        var userJSON = json.decode(result.data!)["UsersByCognitoID"]["items"];
        safePrint("userJSON = $userJSON");
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
