import 'package:equatable/equatable.dart';
import 'package:waaa/core/usecases/usecase.dart';
import 'package:waaa/features/events/domain/repositories/event_repository.dart';
import 'package:waaa/models/ModelProvider.dart';

class CreateEvent extends UseCase<Event?, CreateEventParams> {
  final EventRepository repository;

  CreateEvent(this.repository);

  @override
  Future<Event?> call(CreateEventParams params) async {
    return await repository.createEvent(params.event);
  }
}

class CreateEventParams extends Equatable {
  final Event event;

  const CreateEventParams({required this.event}) : super();

  @override
  List<Object?> get props => [event];
}
