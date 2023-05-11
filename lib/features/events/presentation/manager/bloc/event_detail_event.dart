part of 'event_detail_bloc.dart';

abstract class EventDetailEvent extends Equatable {
  const EventDetailEvent();

  @override
  List<Object> get props => [];
}

class OpenEventImagePicker extends EventDetailEvent {
  final ImageSource source;

  const OpenEventImagePicker({required this.source});
}

class ToNextEventStepPressed extends EventDetailEvent {
  final String title;
  final bool isPublic;
  final String theme;
  final String address;
  final String beginDateTime;
  final String endDateTime;
  final String nbParticipate;

  const ToNextEventStepPressed({
    required this.title,
    required this.isPublic,
    required this.theme,
    required this.address,
    required this.beginDateTime,
    required this.endDateTime,
    required this.nbParticipate,
  });
}

class ValidateEventPressed extends EventDetailEvent {
  final Event currentEvent;

  const ValidateEventPressed({required this.currentEvent});
}
