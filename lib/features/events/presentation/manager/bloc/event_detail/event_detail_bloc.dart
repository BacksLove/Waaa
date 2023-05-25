import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:waaa/models/Event.dart';
import 'package:waaa/models/EventTopic.dart';

import '../../../../../../core/enums/event_enum.dart';

part 'event_detail_event.dart';
part 'event_detail_state.dart';

class EventDetailBloc extends Bloc<EventDetailEvent, EventDetailState> {
  EventDetailBloc() : super(EventDetailState.initial()) {
    on<EventDetailEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
