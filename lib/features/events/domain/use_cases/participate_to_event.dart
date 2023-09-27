import 'package:equatable/equatable.dart';
import 'package:waaa/models/ModelProvider.dart';

import '../../../../core/usecases/usecase.dart';
import '../repositories/event_repository.dart';

class ParticipateToEvent extends UseCase<bool, ParticipateToEventParams> {
  final EventRepository repository;

  ParticipateToEvent(this.repository);

  @override
  Future<bool> call(ParticipateToEventParams params) async {
    return await repository.participateToEvent(params.participant);
  }
}

class ParticipateToEventParams extends Equatable {
  final EventParticipant participant;

  const ParticipateToEventParams({required this.participant}) : super();

  @override
  List<Object?> get props => [participant];
}
