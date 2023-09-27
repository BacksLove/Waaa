import 'package:image_picker/image_picker.dart';
import 'package:waaa/features/users/domain/entities/search_item.dart';
import 'package:waaa/models/User.dart';

abstract class UserRepository {
  Future<User?> getUserById(String id);
  Future<List<User?>> getUsersByCity(String city);
  Future<List<User?>> searchUser(SearchItem searchItem);
  Future<bool> createUser(User user);
  Future<bool> updateUser(User user);
  Future<bool> deleteUser(String id);
  Future<String?> uploadPhoto(
      XFile file, String directory, String url, String photoName);
  Future<List<User?>> inviteUserList(String searchString);
}
