import 'package:equatable/equatable.dart';
import 'package:waaa/models/ModelProvider.dart';

import '../../../../core/usecases/usecase.dart';
import '../repositories/event_repository.dart';

class AddCoowner extends UseCase<bool, AddCoownerParams> {
  final EventRepository repository;

  AddCoowner(this.repository);

  @override
  Future<bool> call(AddCoownerParams params) async {
    return await repository.addCoownerToEvent(params.coowner);
  }
}

class AddCoownerParams extends Equatable {
  final EventCoowner coowner;

  const AddCoownerParams({required this.coowner}) : super();

  @override
  List<Object?> get props => [coowner];
}
