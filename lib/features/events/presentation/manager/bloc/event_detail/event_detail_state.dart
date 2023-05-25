part of 'event_detail_bloc.dart';

class EventDetailState extends Equatable {
  final EventDetailEnum status;
  final Event currentEvent;

  const EventDetailState({required this.status, required this.currentEvent});

  factory EventDetailState.initial() => EventDetailState(
        status: EventDetailEnum.loading,
        currentEvent: Event(
            name: "",
            topic: EventTopic(name: ""),
            description: "",
            eventTopicId: ""),
      );

  @override
  List<Object> get props => [status, currentEvent];

  EventDetailState copyWith({
    EventDetailEnum? status,
    Event? currentEvent,
  }) {
    return EventDetailState(
      status: status ?? this.status,
      currentEvent: currentEvent ?? this.currentEvent,
    );
  }

  @override
  bool get stringify => true;
}
