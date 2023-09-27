import 'dart:async';

import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:waaa/core/constants/constants.dart';
import 'package:waaa/core/enums/event_enum.dart';
import 'package:waaa/core/usecases/usecase.dart';
import 'package:waaa/core/util/functions.dart';
import 'package:waaa/core/util/input_converter.dart';
import 'package:waaa/features/events/domain/use_cases/add_coowner.dart';
import 'package:waaa/features/events/domain/use_cases/create_event.dart';
import 'package:waaa/features/events/domain/use_cases/get_all_event_topic.dart';
import 'package:waaa/features/events/domain/use_cases/participate_to_event.dart';
import 'package:waaa/features/users/domain/use_cases/get_user_by_id.dart';
import 'package:waaa/features/users/domain/use_cases/invite_userlist.dart';
import 'package:waaa/features/users/domain/use_cases/upload_user_photo.dart';
import 'package:waaa/models/DemandStatus.dart';
import 'package:waaa/models/Event.dart';
import 'package:waaa/models/EventParticipant.dart';
import 'package:waaa/models/EventTopic.dart';
import 'package:waaa/models/ModelProvider.dart';
import 'package:waaa/models/User.dart';

import 'package:waaa/injection_container.dart' as di;

part 'create_event_event.dart';
part 'create_event_state.dart';

class CreateEventBloc extends Bloc<CreateEventEvent, CreateEventState> {
  final imagePicker = ImagePicker();

  CreateEventBloc() : super(CreateEventState.initial()) {
    on<CreateEventEvent>((event, emit) {});
    on<OpenEventImagePicker>(_onOpenImagePicker);
    on<ToNextEventStepPressed>(_onNextEventStepPressed);
    on<CreateEventLoadData>(_onLoadData);
    on<ValidateEventPressed>(_onCreateEvent);
    on<SearchUserEvent>(_onSearchUserEvent);
    on<AddUserToInviteEvent>(_onAddUserInviteEvent);
    on<AddUserToCoorganizerEvent>(_onAddUserCoorganizerEvent);
    on<DeleteUserFromInviteEvent>(_onDeleteUserInviteEvent);
    on<DeleteUserFromCoorganizerEvent>(_onDeleteUserCoorganizerEvent);
    on<GuestCanInviteSwitch>(_onGuestCanInvite);
    on<IsVisibleSwicth>(_onIsVisible);
    on<ChooseThemeEvent>(_onThemeChoose);
    on<CountrySelectedEvent>(_onCountrySelected);
    on<CitySelectedEvent>(_onCitySelected);
  }

  void _onOpenImagePicker(
      OpenEventImagePicker event, Emitter<CreateEventState> emit) async {
    final pickedFile = await imagePicker.pickImage(source: event.source);

    if (pickedFile != null) {
      emit(state.copyWith(
          photoPath: pickedFile.path, photoFile: pickedFile, errorMessage: ""));
    }
  }

  void _onNextEventStepPressed(
      ToNextEventStepPressed event, Emitter<CreateEventState> emit) {
    if (event.title.isEmpty ||
        event.address.isEmpty ||
        event.beginDateTime.isEmpty ||
        event.endDateTime.isEmpty ||
        event.nbParticipate.isEmpty) {
      emit(state.copyWith(
          errorMessage: "all field must be filled to go to the next step"));
    } else {
      final beginDate = DateConverter().stringToDate(event.beginDateTime);
      final endDate = DateConverter().stringToDate(event.endDateTime);

      emit(
        state.copyWith(
          step: CreateEventStep.partTwo,
          title: event.title,
          isPublic: event.isPublic,
          address: event.address,
          beginDateTime: beginDate,
          endDateTime: endDate,
          nbParticipate: event.nbParticipate,
          errorMessage: "",
        ),
      );
    }
  }

  void _onLoadData(
      CreateEventLoadData event, Emitter<CreateEventState> emit) async {
    final userId = di.sl<SharedPreferences>().getString(userCognitoIdKey);
    if (userId != null) {
      final eventTopic = await di.sl<GetAllEventTopic>().call(NoParams());
      final user =
          await di.sl<GetUserById>().call(GetUserByIdParams(id: userId));
      final userFriend = getFriendFromUser(user!);

      emit(state.copyWith(eventTopic: eventTopic, friendList: userFriend));
    }
  }

  FutureOr<void> _onCreateEvent(
      ValidateEventPressed event, Emitter<CreateEventState> emit) async {
    emit(state.copyWith(step: CreateEventStep.creating));
    var userId = di.sl<SharedPreferences>().getString(userCognitoIdKey);

    var eventTopic =
        state.eventTopic.where((element) => element?.name == state.theme).first;

    final finalUser =
        await di.sl<GetUserById>().call(GetUserByIdParams(id: userId!));

    String? photoLink;
    if (state.photoPath.isNotEmpty) {
      photoLink = await di.sl<UploadPhoto>().call(
            UploadUserPhotoParams(
              file: state.photoFile!,
              directory: eventPhotoDir,
              url: eventPhotoUrl,
              photoName: "$userId${state.title}",
            ),
          );
    }

    Event eventToCreate = Event(
      owner: finalUser,
      name: state.title,
      topic: eventTopic!,
      isPublic: state.isPublic,
      begin: TemporalDate(state.beginDateTime),
      end: TemporalDate(state.endDateTime),
      hourBegin: state.beginDateTime.hour,
      hourEnd: state.endDateTime.hour,
      nbShare: 0,
      address: state.address,
      country: state.country,
      city: state.city,
      mainPhoto: photoLink,
      description: event.description,
      eventTopicId: eventTopic.id,
      eventTopicEventsId: eventTopic.id,
      createdAt: TemporalDateTime(DateTime.now()),
    );

    /*final List<EventParticipant> participants =
        usersToEventParticipant(state.guests, eventToCreate);
    final List<EventParticipant> coowner =
        usersToEventParticipant(state.coorganizer, eventToCreate);*/

    final eventCreated = await di
        .sl<CreateEvent>()
        .call(CreateEventParams(event: eventToCreate));
    if (eventCreated != null) {
      for (var user in state.guests) {
        final EventParticipant part = EventParticipant(
            event: eventToCreate, user: user, status: DemandStatus.ACCEPTED);
        await di
            .sl<ParticipateToEvent>()
            .call(ParticipateToEventParams(participant: part));
      }
      for (var user in state.coorganizer) {
        final EventCoowner coowner =
            EventCoowner(event: eventToCreate, user: user);
        await di.sl<AddCoowner>().call(AddCoownerParams(coowner: coowner));
      }

      emit(state.copyWith(step: CreateEventStep.done));
    } else {
      emit(state.copyWith(step: CreateEventStep.errorCreating));
    }
  }

  void _onSearchUserEvent(
      SearchUserEvent event, Emitter<CreateEventState> emit) async {
    if (event.searchString.isNotEmpty) {
      safePrint(state.searchUserList);
      final userList = await di
          .sl<InviteUserList>()
          .call(InviteUserListParams(searchItem: event.searchString));
      emit(state.copyWith(searchUserList: userList, errorMessage: ""));
    }
  }

  void _onAddUserInviteEvent(
      AddUserToInviteEvent event, Emitter<CreateEventState> emit) {
    if (event.user.username != "") {
      List<User> guest = List.from(state.guests);
      if (!guest.contains(event.user)) {
        guest.add(event.user);
        emit(state.copyWith(guests: guest));
      }
    }
  }

  void _onAddUserCoorganizerEvent(
      AddUserToCoorganizerEvent event, Emitter<CreateEventState> emit) {
    if (event.user.username != "") {
      List<User> coorganizer = List.from(state.coorganizer);
      if (!coorganizer.contains(event.user)) {
        coorganizer.add(event.user);
        emit(state.copyWith(coorganizer: coorganizer));
      }
    }
  }

  void _onDeleteUserInviteEvent(
      DeleteUserFromInviteEvent event, Emitter<CreateEventState> emit) {
    List<User> guest = List.from(state.guests);
    guest.remove(event.user);
    emit(state.copyWith(guests: guest));
  }

  void _onDeleteUserCoorganizerEvent(
      DeleteUserFromCoorganizerEvent event, Emitter<CreateEventState> emit) {
    List<User> coorganizer = List.from(state.coorganizer);
    coorganizer.remove(event.user);
    emit(state.copyWith(coorganizer: coorganizer));
  }

  void _onGuestCanInvite(
      GuestCanInviteSwitch event, Emitter<CreateEventState> emit) {
    emit(state.copyWith(guestCanInvite: !state.guestCanInvite));
  }

  void _onIsVisible(IsVisibleSwicth event, Emitter<CreateEventState> emit) {
    emit(state.copyWith(isVisibleOnMyProfile: !state.isVisibleOnMyProfile));
  }

  void _onThemeChoose(ChooseThemeEvent event, Emitter<CreateEventState> emit) {
    if (event.theme.isNotEmpty) {
      emit(state.copyWith(theme: event.theme));
    }
  }

  void _onCountrySelected(
      CountrySelectedEvent event, Emitter<CreateEventState> emit) {
    if (event.country.isNotEmpty) {
      emit(state.copyWith(country: event.country));
    }
  }

  void _onCitySelected(
      CitySelectedEvent event, Emitter<CreateEventState> emit) {
    if (event.city.isNotEmpty) {
      emit(state.copyWith(city: event.city));
    }
  }
}
