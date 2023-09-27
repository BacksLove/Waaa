import 'package:equatable/equatable.dart';
import 'package:waaa/core/usecases/usecase.dart';
import 'package:waaa/features/users/domain/repositories/user_repository.dart';
import 'package:waaa/models/ModelProvider.dart';

class InviteUserList extends UseCase<List<User?>, InviteUserListParams> {
  final UserRepository repository;

  InviteUserList(this.repository);

  @override
  Future<List<User?>> call(InviteUserListParams params) async {
    return await repository.inviteUserList(params.searchItem);
  }
}

class InviteUserListParams extends Equatable {
  final String searchItem;

  const InviteUserListParams({required this.searchItem}) : super();

  @override
  List<Object?> get props => [searchItem];
}
