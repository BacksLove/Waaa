import 'package:equatable/equatable.dart';
import 'package:waaa/features/users/domain/repositories/friendship_repository.dart';
import 'package:waaa/models/ModelProvider.dart';

import '../../../../core/usecases/usecase.dart';

class GetFriendshipStatus
    extends UseCase<Friendship?, GetFriendshipStatusParams> {
  final FriendshipRepository repository;

  GetFriendshipStatus(this.repository);

  @override
  Future<Friendship?> call(GetFriendshipStatusParams params) async {
    return await repository.getFriendshipStatus(params.userId, params.friendId);
  }
}

class GetFriendshipStatusParams extends Equatable {
  final String userId;
  final String friendId;

  const GetFriendshipStatusParams(
      {required this.userId, required this.friendId})
      : super();

  @override
  List<Object?> get props => [userId, friendId];
}
