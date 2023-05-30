import 'dart:async';

import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:waaa/features/events/domain/use_cases/get_event_by_id.dart';
import 'package:waaa/models/Event.dart';
import 'package:waaa/models/EventTopic.dart';

import '../../../../../../core/enums/event_enum.dart';

import 'package:waaa/injection_container.dart' as di;

part 'event_detail_event.dart';
part 'event_detail_state.dart';

class EventDetailBloc extends Bloc<EventDetailEvent, EventDetailState> {
  EventDetailBloc() : super(EventDetailState.initial()) {
    on<EventDetailLoadData>(_onLoadData);
  }

  void _onLoadData(
      EventDetailLoadData event, Emitter<EventDetailState> emit) async {
    try {
      emit(state.copyWith(status: EventDetailEnum.loading));
      if (event.eventId.isNotEmpty) {
        final finalEvent = await di
            .sl<GetEventsById>()
            .call(EventByIdParams(id: event.eventId));
        if (finalEvent != null) {
          emit(state.copyWith(
              status: EventDetailEnum.showDetail, currentEvent: finalEvent));
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
}
