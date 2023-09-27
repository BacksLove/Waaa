part of 'event_detail_bloc.dart';

class EventDetailState extends Equatable {
  final EventDetailEnum status;
  final Event currentEvent;
  final bool ownerView;
  final bool participate;

  const EventDetailState({
    required this.status,
    required this.currentEvent,
    required this.ownerView,
    required this.participate,
  });

  factory EventDetailState.initial() => EventDetailState(
        status: EventDetailEnum.loading,
        currentEvent: Event(
            name: "",
            topic: EventTopic(name: ""),
            description: "",
            eventTopicId: ""),
        ownerView: false,
        participate: false,
      );

  @override
  List<Object> get props => [status, currentEvent, ownerView, participate];

  EventDetailState copyWith({
    EventDetailEnum? status,
    Event? currentEvent,
    bool? ownerView,
    bool? participate,
  }) {
    return EventDetailState(
      status: status ?? this.status,
      currentEvent: currentEvent ?? this.currentEvent,
      ownerView: ownerView ?? this.ownerView,
      participate: participate ?? this.participate,
    );
  }

  @override
  bool get stringify => true;
}
