import 'dart:io';

import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_api/model_queries.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:waaa/core/constants/constants.dart';
import 'package:waaa/core/queries/user_queries.dart';
import 'package:waaa/core/util/mocks/users.dart';
import 'package:waaa/features/users/domain/entities/search_item.dart';
import 'package:waaa/models/User.dart';

abstract class UserRemoteDatasource {
  Future<User?> getUserById(String id);
  Future<List<User?>> getUsersByCity(String city);
  Future<List<User?>> searchUser(SearchItem searchItem);
  Future<bool> createUser(User user);
  Future<bool> updateUser(User user);
  Future<bool> deleteUser(String id);
  Future<String?> uploadUserPhoto(XFile file, String userId);
}

class UserRemoteDatasourceImpl implements UserRemoteDatasource {
  @override
  Future<bool> createUser(User user) async {
    try {
      final request = ModelMutations.create(user);
      final response = await Amplify.API.mutate(request: request).response;

      if (response.data == null) {
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
  Future<bool> deleteUser(String id) {
    throw UnimplementedError();
  }

  @override
  Future<User?> getUserById(String id) async {
    try {
      const graphQLDocument = getUserByIdQuery;
      final request = GraphQLRequest<PaginatedResult<User>>(
        document: graphQLDocument,
        modelType: const PaginatedModelType(User.classType),
        variables: <String, String>{'id': id},
        decodePath: "UsersByCognitoID",
      );
      final response = await Amplify.API.query(request: request).response;
      final user = response.data?.items;

      if (user == null || user.isEmpty) {
        safePrint("errors: ${response.errors}");
        return null;
      }
      return user.first;
    } on AuthException catch (e) {
      safePrint(e.message);
      return null;
    }
  }

  @override
  Future<bool> updateUser(User user) {
    throw UnimplementedError();
  }

  @override
  Future<List<User?>> getUsersByCity(String city) async {
    try {
      final request = ModelQueries.list<User>(User.classType);
      final response = await Amplify.API.query(request: request).response;

      final users = response.data?.items;
      if (users == null) {
        safePrint('errors: ${response.errors}');
        return [];
      }
      return users;
    } on AuthException catch (e) {
      safePrint(e.message);
      return [];
    }
  }

  @override
  Future<String?> uploadUserPhoto(XFile file, String userId) async {
    try {
      final awsFile = File(file.path);
      await Amplify.Storage.uploadFile(
        local: awsFile,
        key: '$userPhotoDir$userId.png',
      );
      final String result = "$userPhotoUrl$userId.png";
      return result;
    } on StorageException catch (e) {
      safePrint('Error uploading file: ${e.message}');
      rethrow;
    }
  }

  @override
  Future<List<User?>> searchUser(SearchItem searchItem) async {
    /*try {
      final queryPredicate = User.USERNAME.eq(searchItem.username).or(User
          .BIRTHDAY
          .ge(searchItem.minAge!)
          .and(User.BIRTHDAY.le(searchItem.maxAge!)));
      final request = ModelQueries.list<User>(
        User.classType,
        where: queryPredicate,
      );
      final response = await Amplify.API.query(request: request).response;

      final users = response.data?.items;
      if (users == null) {
        safePrint('errors: ${response.errors}');
        return [];
      }
      return users;
    } on AuthException catch (e) {
      safePrint(e.message);
      return [];
    }*/
    return mockUsersList;
  }
}
