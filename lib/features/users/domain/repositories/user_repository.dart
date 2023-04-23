import 'package:image_picker/image_picker.dart';
import 'package:waaa/features/users/domain/entities/user_entity.dart';

abstract class UserRepository {
  Future<User?> getUserById(String id);
  Future<List<User>?> getUsersByCity(String city);
  Future<bool> createUser(User user);
  Future<bool> updateUser(User user);
  Future<bool> deleteUser(String id);
  Future<String?> uploadUserPhoto(XFile file, String userId);
}
