part of 'create_event_bloc.dart';

class CreateEventState extends Equatable {
  final CreateEventStep step;
  final String title;
  final bool isPublic;
  final String theme;
  final String address;
  final DateTime beginDateTime;
  final DateTime endDateTime;
  final String nbParticipate;
  final String photoPath;
  final String country;
  final String city;
  final List<User> coorganizer;
  final List<User> guests;
  final List<User?> searchUserList;
  final List<User> friendList;
  final bool guestCanInvite;
  final bool isVisibleOnMyProfile;
  final String description;
  final List<EventTopic?> eventTopic;
  final XFile? photoFile;
  final String? errorMessage;

  const CreateEventState({
    required this.step,
    required this.title,
    required this.isPublic,
    required this.theme,
    required this.address,
    required this.beginDateTime,
    required this.endDateTime,
    required this.searchUserList,
    required this.friendList,
    required this.nbParticipate,
    required this.photoPath,
    required this.country,
    required this.city,
    required this.coorganizer,
    required this.guests,
    required this.guestCanInvite,
    required this.isVisibleOnMyProfile,
    required this.description,
    required this.eventTopic,
    this.photoFile,
    this.errorMessage,
  });

  factory CreateEventState.initial() => CreateEventState(
        step: CreateEventStep.partOne,
        title: "",
        isPublic: true,
        theme: "",
        address: "",
        beginDateTime: DateTime.now(),
        endDateTime: DateTime.now(),
        nbParticipate: "",
        photoPath: "",
        searchUserList: const [],
        friendList: const [],
        coorganizer: const [],
        guests: const [],
        guestCanInvite: true,
        isVisibleOnMyProfile: true,
        description: "",
        eventTopic: const [],
        city: '',
        country: '',
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
      searchUserList,
      friendList,
      guests,
      guestCanInvite,
      isVisibleOnMyProfile,
      description,
      eventTopic,
    ];
  }

  CreateEventState copyWith({
    CreateEventStep? step,
    String? title,
    bool? isPublic,
    String? theme,
    String? address,
    DateTime? beginDateTime,
    DateTime? endDateTime,
    String? nbParticipate,
    String? photoPath,
    String? country,
    String? city,
    List<User>? coorganizer,
    List<User>? guests,
    List<User?>? searchUserList,
    List<User>? friendList,
    bool? guestCanInvite,
    bool? isVisibleOnMyProfile,
    String? description,
    List<EventTopic?>? eventTopic,
    XFile? photoFile,
    String? errorMessage,
  }) {
    return CreateEventState(
      step: step ?? this.step,
      title: title ?? this.title,
      isPublic: isPublic ?? this.isPublic,
      theme: theme ?? this.theme,
      address: address ?? this.address,
      beginDateTime: beginDateTime ?? this.beginDateTime,
      endDateTime: endDateTime ?? this.endDateTime,
      nbParticipate: nbParticipate ?? this.nbParticipate,
      photoPath: photoPath ?? this.photoPath,
      country: country ?? this.country,
      city: city ?? this.city,
      coorganizer: coorganizer ?? this.coorganizer,
      searchUserList: searchUserList ?? this.searchUserList,
      friendList: friendList ?? this.friendList,
      guests: guests ?? this.guests,
      guestCanInvite: guestCanInvite ?? this.guestCanInvite,
      isVisibleOnMyProfile: isVisibleOnMyProfile ?? this.isVisibleOnMyProfile,
      description: description ?? this.description,
      eventTopic: eventTopic ?? this.eventTopic,
      photoFile: photoFile ?? this.photoFile,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
