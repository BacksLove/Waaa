import 'package:equatable/equatable.dart';
import 'package:waaa/models/Event.dart';

import '../../../../core/usecases/usecase.dart';
import '../repositories/event_repository.dart';

class GetEventsById extends UseCase<Event?, EventByIdParams> {
  final EventRepository repository;

  GetEventsById(this.repository);

  @override
  Future<Event?> call(EventByIdParams params) async {
    return await repository.getEventById(params.id);
  }
}

class EventByIdParams extends Equatable {
  final String id;

  const EventByIdParams({required this.id}) : super();

  @override
  List<Object?> get props => [id];
}
