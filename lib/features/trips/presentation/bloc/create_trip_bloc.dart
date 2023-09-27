import 'dart:async';

import 'package:aws_common/aws_common.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:waaa/core/enums/trips_enum.dart';
import 'package:waaa/models/ModelProvider.dart';

part 'create_trip_event.dart';
part 'create_trip_state.dart';

class CreateTripBloc extends Bloc<CreateTripEvent, CreateTripState> {
  CreateTripBloc() : super(CreateTripState.initial()) {
    on<CreateTripNextStepEvent>(_toTheNextStep);
    on<UpdateTripsEvent>(_onUpdateTrip);
  }

  FutureOr<void> _toTheNextStep(
      CreateTripNextStepEvent event, Emitter<CreateTripState> emit) {
    switch (state.steps) {
      case TripsSteps.travelStep:
        emit(state.copyWith(steps: TripsSteps.photoStep));
        break;
      case TripsSteps.photoStep:
        emit(state.copyWith(steps: TripsSteps.activityStep));
        break;
      case TripsSteps.activityStep:
        emit(state.copyWith(steps: TripsSteps.locomotionStep));
        break;
      case TripsSteps.locomotionStep:
        emit(state.copyWith(steps: TripsSteps.homeSteps));
        break;
      case TripsSteps.homeSteps:
        emit(state.copyWith(steps: TripsSteps.participationStep));
        break;
      case TripsSteps.participationStep:
        emit(state.copyWith(steps: TripsSteps.resumeStep));
        break;
      case TripsSteps.resumeStep:
        break;
    }
  }

  void _onUpdateTrip(
      UpdateTripsEvent event, Emitter<CreateTripState> emit) async {
    safePrint("boumboum");
    emit(state.copyWith(
        destinations: event.destinations,
        tripName: event.name,
        tripDescription: event.description));

    safePrint("name : ${state.tripName} et ${state.tripDescription}");
  }
}
