import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';
import 'package:waaa/core/enums/event_enum.dart';
import 'package:waaa/core/util/input_converter.dart';
import 'package:waaa/features/users/domain/entities/user_entity.dart';

import '../../../domain/entities/event_entity.dart';

part 'event_detail_event.dart';
part 'event_detail_state.dart';

class EventDetailBloc extends Bloc<EventDetailEvent, EventDetailState> {
  final imagePicker = ImagePicker();

  EventDetailBloc() : super(EventDetailState.initial()) {
    on<EventDetailEvent>((event, emit) {});
    on<OpenEventImagePicker>(_onOpenImagePicker);
    on<ToNextEventStepPressed>(_onNextEventStepPressed);
  }

  void _onOpenImagePicker(
      OpenEventImagePicker event, Emitter<EventDetailState> emit) async {
    final pickedFile = await imagePicker.pickImage(source: event.source);

    if (pickedFile != null) {
      emit(state.copyWith(photoPath: pickedFile.path, photoFile: pickedFile));
    }
  }

  void _onNextEventStepPressed(
      ToNextEventStepPressed event, Emitter<EventDetailState> emit) {
    if (event.title.isEmpty ||
        event.address.isEmpty ||
        event.theme.isEmpty ||
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
          theme: event.theme,
          beginDateTime: beginDate,
          endDateTime: endDate,
          nbParticipate: event.nbParticipate,
        ),
      );
    }
  }
}
