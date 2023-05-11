part of 'event_detail_bloc.dart';

class EventDetailState extends Equatable {
  final CreateEventStep step;
  final String title;
  final bool isPublic;
  final String theme;
  final String address;
  final DateTime beginDateTime;
  final DateTime endDateTime;
  final String nbParticipate;
  final String photoPath;
  final List<User> coorganizer;
  final List<User> guests;
  final bool guestCanInvite;
  final bool isVisibleOnMyProfile;
  final String description;
  final XFile? photoFile;
  final String? errorMessage;

  const EventDetailState({
    required this.step,
    required this.title,
    required this.isPublic,
    required this.theme,
    required this.address,
    required this.beginDateTime,
    required this.endDateTime,
    required this.nbParticipate,
    required this.photoPath,
    required this.coorganizer,
    required this.guests,
    required this.guestCanInvite,
    required this.isVisibleOnMyProfile,
    required this.description,
    this.photoFile,
    this.errorMessage,
  });

  factory EventDetailState.initial() => EventDetailState(
        step: CreateEventStep.partOne,
        title: "",
        isPublic: true,
        theme: "",
        address: "",
        beginDateTime: DateTime.now(),
        endDateTime: DateTime.now(),
        nbParticipate: "",
        photoPath: "",
        coorganizer: const [],
        guests: const [],
        guestCanInvite: true,
        isVisibleOnMyProfile: true,
        description: "",
      );

  @override
  List<Object> get props {
    return [
      step,
      title,
      isPublic,
      theme,
      address,
      beginDateTime,
      endDateTime,
      nbParticipate,
      photoPath,
      coorganizer,
      guests,
      guestCanInvite,
      isVisibleOnMyProfile,
      description,
    ];
  }

  EventDetailState copyWith({
    CreateEventStep? step,
    String? title,
    bool? isPublic,
    String? theme,
    String? address,
    DateTime? beginDateTime,
    DateTime? endDateTime,
    String? nbParticipate,
    String? photoPath,
    List<User>? coorganizer,
    List<User>? guests,
    bool? guestCanInvite,
    bool? isVisibleOnMyProfile,
    String? description,
    XFile? photoFile,
    String? errorMessage,
  }) {
    return EventDetailState(
      step: step ?? this.step,
      title: title ?? this.title,
      isPublic: isPublic ?? this.isPublic,
      theme: theme ?? this.theme,
      address: address ?? this.address,
      beginDateTime: beginDateTime ?? this.beginDateTime,
      endDateTime: endDateTime ?? this.endDateTime,
      nbParticipate: nbParticipate ?? this.nbParticipate,
      photoPath: photoPath ?? this.photoPath,
      coorganizer: coorganizer ?? this.coorganizer,
      guests: guests ?? this.guests,
      guestCanInvite: guestCanInvite ?? this.guestCanInvite,
      isVisibleOnMyProfile: isVisibleOnMyProfile ?? this.isVisibleOnMyProfile,
      description: description ?? this.description,
      photoFile: photoFile ?? this.photoFile,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
