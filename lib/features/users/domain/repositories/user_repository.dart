import 'package:waaa/features/users/domain/entities/user_entity.dart';

abstract class UserRepository {
  Future<User> getUserById(String id);
  Future<List<User>> getUsersByCity(String city);
  Future<List<User>> getEventUsers(String id);
  Future<bool> createUser(User user);
  Future<bool> updateUser(User user);
  Future<bool> deleteUser(String id);
}
