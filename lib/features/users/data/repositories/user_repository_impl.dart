import 'package:image_picker/image_picker.dart';
import 'package:waaa/features/users/data/data_sources/user_remote_datasource.dart';
import 'package:waaa/features/users/domain/entities/search_item.dart';
import 'package:waaa/features/users/domain/repositories/user_repository.dart';
import 'package:waaa/models/User.dart';

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
  Future<List<User?>> getUsersByCity(String city) {
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
  Future<String?> uploadPhoto(
      XFile file, String directory, String url, String photoName) async {
    await networkInfo.isConnected;
    final remote =
        remoteDataSource.uploadPhoto(file, directory, url, photoName);

    return remote;
  }

  @override
  Future<List<User?>> searchUser(SearchItem searchItem) async {
    await networkInfo.isConnected;
    final remote = remoteDataSource.searchUser(searchItem);

    return remote;
  }

  @override
  Future<List<User?>> inviteUserList(String searchString) async {
    await networkInfo.isConnected;
    final remote = remoteDataSource.inviteUserList(searchString);

    return remote;
  }
}
