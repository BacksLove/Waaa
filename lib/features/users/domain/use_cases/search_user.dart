import 'package:equatable/equatable.dart';
import 'package:waaa/features/users/domain/entities/search_item.dart';
import 'package:waaa/features/users/domain/repositories/user_repository.dart';
import 'package:waaa/models/User.dart';

import '../../../../core/usecases/usecase.dart';

class SearchUser extends UseCase<List<User?>, SearchUserParams> {
  final UserRepository repository;

  SearchUser(this.repository);

  @override
  Future<List<User?>> call(SearchUserParams params) async {
    return await repository.searchUser(params.searchItem);
  }
}

class SearchUserParams extends Equatable {
  final SearchItem searchItem;

  const SearchUserParams({required this.searchItem}) : super();

  @override
  List<Object?> get props => [searchItem];
}
