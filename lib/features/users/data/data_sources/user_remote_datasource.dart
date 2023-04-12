import 'package:amplify_flutter/amplify_flutter.dart';
import '../../domain/entities/user_entity.dart';

abstract class UserRemoteDatasource {
  Future<User> getUserById(String id);
  Future<List<User>> getUsersByCity(String city);
  Future<List<User>> getEventUsers(String id);
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
  Future<User> getUserById(String id) async {
    User user = const User(username: "username");
    try {
      /*var doc = '''query user {
          getUser(id: $id) {
            id
            bio
            birthday
            cognitoUserPoolId
            createdAt
            gender
            languagesSpeak
            lookingFor
            nativeLanguage
            photo
            privacy
            reporting
            role
            username
            suspended
            suspendedUntil
            updatedAt
            openDiscussion
          }
      }''';
      var operation =
          Amplify.API.query(request: GraphQLRequest<String>(document: doc));
      var result = await operation.response;
      print("Erreur =  ${result.errors}");
      print("Data =  ${result.data}");
      /*if (result.data != null) {
        print(result.data);
      }*/
*/
      return user;
    } catch (e) {
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
  Future<List<User>> getUsersByCity(String city) {
    // TODO: implement getUsersByCity
    throw UnimplementedError();
  }
}
