part of 'create_event_bloc.dart';

abstract class CreateEventEvent extends Equatable {
  const CreateEventEvent();

  @override
  List<Object> get props => [];
}

class CreateEventLoadData extends CreateEventEvent {}

class OpenEventImagePicker extends CreateEventEvent {
  final ImageSource source;

  const OpenEventImagePicker({required this.source});
}

class ToNextEventStepPressed extends CreateEventEvent {
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

class ValidateEventPressed extends CreateEventEvent {
  final Event currentEvent;

  const ValidateEventPressed({required this.currentEvent});
}
