part of 'event_detail_bloc.dart';

class EventDetailState extends Equatable {
  final EventDetailEnum status;
  final Event currentEvent;
  final bool ownerView;

  const EventDetailState(
      {required this.status,
      required this.currentEvent,
      required this.ownerView});

  factory EventDetailState.initial() => EventDetailState(
        status: EventDetailEnum.loading,
        currentEvent: Event(
            name: "",
            topic: EventTopic(name: ""),
            description: "",
            eventTopicId: ""),
        ownerView: false,
      );

  @override
  List<Object> get props => [status, currentEvent, ownerView];

  EventDetailState copyWith({
    EventDetailEnum? status,
    Event? currentEvent,
    bool? ownerView,
  }) {
    return EventDetailState(
      status: status ?? this.status,
      currentEvent: currentEvent ?? this.currentEvent,
      ownerView: ownerView ?? this.ownerView,
    );
  }

  @override
  bool get stringify => true;
}
