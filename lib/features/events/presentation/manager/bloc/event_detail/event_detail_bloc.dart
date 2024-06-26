import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:waaa/core/constants/constants.dart';
import 'package:waaa/features/events/domain/use_cases/get_event_by_id.dart';
import 'package:waaa/features/events/domain/use_cases/participate_to_event.dart';
import 'package:waaa/features/users/domain/use_cases/get_user_by_id.dart';
import 'package:waaa/models/ModelProvider.dart';

import '../../../../../../core/enums/event_enum.dart';

import 'package:waaa/injection_container.dart' as di;

part 'event_detail_event.dart';
part 'event_detail_state.dart';

class EventDetailBloc extends Bloc<EventDetailEvent, EventDetailState> {
  EventDetailBloc() : super(EventDetailState.initial()) {
    on<EventDetailLoadData>(_onLoadData);
    on<EventGoToUpdatePressed>(_onShowUpdate);
    on<EventGoToDetailPressed>(_onShowDetail);
    on<EventParticipate>(_onParticipate);
  }

  void _onLoadData(
      EventDetailLoadData event, Emitter<EventDetailState> emit) async {
    try {
      emit(state.copyWith(status: EventDetailEnum.loading));
      final userId = di.sl<SharedPreferences>().getString(userCognitoIdKey);
      if (event.eventId.isNotEmpty) {
        final finalEvent = await di
            .sl<GetEventsById>()
            .call(EventByIdParams(id: event.eventId));
        if (finalEvent != null) {
          bool ownerView =
              (userId != null && userId == finalEvent.owner?.cognitoUserPoolId);
          bool participate = isAParticipant(userId, finalEvent);

          emit(state.copyWith(
            status: EventDetailEnum.showDetail,
            currentEvent: finalEvent,
            ownerView: ownerView,
            participate: participate,
          ));
        } else {
          emit(state.copyWith(status: EventDetailEnum.failed));
        }
      }
    } catch (e) {
      emit(state.copyWith(status: EventDetailEnum.failed));
      safePrint(e);
      return;
    }
  }

  void _onShowUpdate(
      EventGoToUpdatePressed event, Emitter<EventDetailState> emit) {
    emit(state.copyWith(status: EventDetailEnum.updateDetail));
  }

  void _onShowDetail(
      EventGoToDetailPressed event, Emitter<EventDetailState> emit) {
    emit(state.copyWith(status: EventDetailEnum.showDetail));
  }

  void _onParticipate(
      EventParticipate event, Emitter<EventDetailState> emit) async {
    final String? userId =
        di.sl<SharedPreferences>().getString(userCognitoIdKey);
    final user =
        await di.sl<GetUserById>().call(GetUserByIdParams(id: userId!));
    bool isPublicEvent = state.currentEvent.isPublic ?? false;
    if (!state.participate) {
      if (user != null) {
        final EventParticipant participant = EventParticipant(
            event: state.currentEvent,
            user: user,
            status:
                isPublicEvent ? DemandStatus.ACCEPTED : DemandStatus.REQUESTED);

        await di
            .sl<ParticipateToEvent>()
            .call(ParticipateToEventParams(participant: participant));

        emit(state.copyWith(participate: true));
      }
    } else {
      // TODO: Remove Participation
      emit(state.copyWith(participate: false));
    }

    // error
  }
}

bool isAParticipant(String? userID, Event event) {
  if (event.participants != null) {
    for (var participant in event.participants!) {
      if (userID == participant.user.cognitoUserPoolId) return true;
    }
  }

  return false;
}
