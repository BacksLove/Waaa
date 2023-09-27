part of 'event_detail_bloc.dart';

abstract class EventDetailEvent extends Equatable {
  const EventDetailEvent();

  @override
  List<Object> get props => [];
}

class EventDetailLoadData extends EventDetailEvent {
  final String eventId;

  const EventDetailLoadData({required this.eventId});
}

class EventGoToUpdatePressed extends EventDetailEvent {}

class EventGoToDetailPressed extends EventDetailEvent {}

class EventUpdateEvent extends EventDetailEvent {}

class EventParticipate extends EventDetailEvent {}
