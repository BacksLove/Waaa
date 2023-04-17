import 'package:equatable/equatable.dart';

import '../../../../core/usecases/usecase.dart';
import '../entities/user_entity.dart';
import '../repositories/user_repository.dart';

class GetUserByCity extends UseCase<List<User>?, GetUserByCityParams> {
  final UserRepository repository;

  GetUserByCity(this.repository);

  @override
  Future<List<User>?> call(GetUserByCityParams params) async {
    return await repository.getUsersByCity(params.city);
  }
}

class GetUserByCityParams extends Equatable {
  final String city;

  const GetUserByCityParams({required this.city}) : super();

  @override
  List<Object?> get props => [city];
}
