import 'package:waaa/features/users/data/data_sources/friendship_remote_datasource.dart';
import 'package:waaa/features/users/domain/repositories/friendship_repository.dart';
import 'package:waaa/models/DemandStatus.dart';
import 'package:waaa/models/ModelProvider.dart';

import '../../../../core/platform/network_info.dart';

class FriendshipRepositoryImpl implements FriendshipRepository {
  final FriendshipRemoteDatasource remoteDataSource;
  final NetworkInfo networkInfo;

  const FriendshipRepositoryImpl(
      {required this.remoteDataSource, required this.networkInfo});

  @override
  Future<Friendship?> getFriendshipStatus(
      String userId, String friendId) async {
    await networkInfo.isConnected;

    final getFriendshipStatus =
        remoteDataSource.getFriendshipStatus(userId, friendId);
    return getFriendshipStatus;
  }
}
