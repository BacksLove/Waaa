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
  final String address;
  final String beginDateTime;
  final String endDateTime;
  final String nbParticipate;

  const ToNextEventStepPressed({
    required this.title,
    required this.isPublic,
    required this.address,
    required this.beginDateTime,
    required this.endDateTime,
    required this.nbParticipate,
  });
}

class SearchUserEvent extends CreateEventEvent {
  final String searchString;

  const SearchUserEvent({required this.searchString});
}

class AddUserToCoorganizerEvent extends CreateEventEvent {
  final User user;

  const AddUserToCoorganizerEvent({required this.user});
}

class AddUserToInviteEvent extends CreateEventEvent {
  final User user;

  const AddUserToInviteEvent({required this.user});
}

class ValidateEventPressed extends CreateEventEvent {
  final String description;

  const ValidateEventPressed({required this.description});
}

class DeleteUserFromInviteEvent extends CreateEventEvent {
  final User user;

  const DeleteUserFromInviteEvent({required this.user});
}

class DeleteUserFromCoorganizerEvent extends CreateEventEvent {
  final User user;

  const DeleteUserFromCoorganizerEvent({required this.user});
}

class GuestCanInviteSwitch extends CreateEventEvent {}

class IsVisibleSwicth extends CreateEventEvent {}

class ChooseThemeEvent extends CreateEventEvent {
  final String theme;

  const ChooseThemeEvent({required this.theme});
}

class CountrySelectedEvent extends CreateEventEvent {
  final String country;

  const CountrySelectedEvent({required this.country});
}

class CitySelectedEvent extends CreateEventEvent {
  final String city;

  const CitySelectedEvent({required this.city});
}
