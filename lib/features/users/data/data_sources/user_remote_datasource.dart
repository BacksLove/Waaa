import 'package:waaa/features/auth/domain/entities/aws_user_entity.dart';
import 'package:waaa/features/users/data/models/user_model.dart';

import '../../../auth/data/models/aws_user_model.dart';
import '../../domain/entities/user_entity.dart';

abstract class UserRemoteDatasource {
  Future<User> getUserById(String id);
  Future<List<User>> getUsersByCity(String city);
  Future<List<User>> getEventUsers(String id);
  Future<bool> createUser(AwsUser user);
  Future<bool> updateUser(AwsUser user);
  Future<bool> deleteUser(AwsUser user);
}

class UserRemoteDatasourceImpl implements UserRemoteDatasource {
  @override
  Future<bool> createUser(AwsUser user) {
    // TODO: implement createUser
    throw UnimplementedError();
  }

  @override
  Future<bool> deleteUser(AwsUser user) {
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
    throw UnimplementedError();
  }

  @override
  Future<bool> updateUser(AwsUser user) {
    // TODO: implement updateUser
    throw UnimplementedError();
  }

  @override
  Future<List<User>> getUsersByCity(String city) {
    // TODO: implement getUsersByCity
    throw UnimplementedError();
  }

}