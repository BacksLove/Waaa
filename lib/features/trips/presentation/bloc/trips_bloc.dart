import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:waaa/core/enums/trips_enum.dart';
import 'package:waaa/features/trips/domain/entities/step_countries.dart';
import 'package:waaa/features/trips/domain/usecases/get_trip_by_id.dart';
import 'package:waaa/models/ModelProvider.dart';

import 'package:waaa/injection_container.dart' as di;

part 'trips_event.dart';
part 'trips_state.dart';

class TripsBloc extends Bloc<TripsEvent, TripsState> {
  TripsBloc() : super(TripsState.initial()) {
    on<LoadTripDetailEvent>(_onLoad);
    on<SwitchTabsEvent>(_onSwitch);
  }

  void _onLoad(LoadTripDetailEvent event, Emitter<TripsState> emit) async {
    emit(state.copyWith(status: TripDetailStatus.loading));
    if (event.id.isNotEmpty) {
      final trip =
          await di.sl<GetTripById>().call(TripByIdParams(id: event.id));
      if (trip != null) {
        //! Les photos
        List<String> photos = [];
        List<StepCountry> countries;
        if (trip.steps != null) {
          for (var step in trip.steps!) {
            if (step.photos != null && step.photos!.isNotEmpty) {
              for (var photoPath in step.photos!) {
                photos.add(photoPath);
              }
            }
            if (step.country.isNotEmpty) {}
          }
        }

        emit(state.copyWith(
          status: TripDetailStatus.loaded,
          currentTrip: trip,
          everyPhotos: photos,
        ));
      } else {
        emit(state.copyWith(status: TripDetailStatus.error));
      }
    }
  }

  void _onSwitch(SwitchTabsEvent event, Emitter<TripsState> emit) {
    emit(state.copyWith(tabShowed: event.tabShowed));
  }
}
