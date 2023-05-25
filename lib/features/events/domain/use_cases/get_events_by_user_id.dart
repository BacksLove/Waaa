import 'package:equatable/equatable.dart';
import 'package:waaa/models/Event.dart';

import '../../../../core/usecases/usecase.dart';
import '../repositories/event_repository.dart';

class GetEventsByUserId extends UseCase<List<Event?>, EventByUserIdParams> {
  final EventRepository repository;

  GetEventsByUserId(this.repository);

  @override
  Future<List<Event?>> call(EventByUserIdParams params) async {
    return await repository.getEventsByUserId(params.id);
  }
}

class EventByUserIdParams extends Equatable {
  final String id;

  const EventByUserIdParams({required this.id}) : super();

  @override
  List<Object?> get props => [id];
}
