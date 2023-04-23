import 'package:image_picker/image_picker.dart';
import 'package:waaa/features/users/data/data_sources/user_remote_datasource.dart';
import 'package:waaa/features/users/domain/entities/user_entity.dart';
import 'package:waaa/features/users/domain/repositories/user_repository.dart';

import '../../../../core/platform/network_info.dart';

class UserRepositoryImpl implements UserRepository {
  final UserRemoteDatasource remoteDataSource;
  final NetworkInfo networkInfo;

  const UserRepositoryImpl(
      {required this.remoteDataSource, required this.networkInfo});

  @override
  Future<bool> createUser(User user) {
    networkInfo.isConnected;
    final remote = remoteDataSource.createUser(user);

    return remote;
  }

  @override
  Future<bool> deleteUser(String id) {
    networkInfo.isConnected;
    final remote = remoteDataSource.deleteUser(id);

    return remote;
  }

  @override
  Future<User?> getUserById(String id) {
    networkInfo.isConnected;
    final remote = remoteDataSource.getUserById(id);

    return remote;
  }

  @override
  Future<List<User>?> getUsersByCity(String city) {
    networkInfo.isConnected;
    final remote = remoteDataSource.getUsersByCity(city);

    return remote;
  }

  @override
  Future<bool> updateUser(User user) {
    networkInfo.isConnected;
    final remote = remoteDataSource.updateUser(user);

    return remote;
  }

  @override
  Future<String?> uploadUserPhoto(XFile file, String userId) async {
    await networkInfo.isConnected;
    final remote = remoteDataSource.uploadUserPhoto(file, userId);

    return remote;
  }
}
