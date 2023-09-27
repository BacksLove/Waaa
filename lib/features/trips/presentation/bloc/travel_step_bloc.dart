import 'dart:async';

import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';
import 'package:waaa/core/enums/trips_enum.dart';
import 'package:waaa/core/usecases/usecase.dart';
import 'package:waaa/features/trips/domain/usecases/get_all_tripcategories.dart';
import 'package:waaa/features/trips/presentation/bloc/create_trip_bloc.dart';
import 'package:waaa/models/ModelProvider.dart';

import 'package:waaa/injection_container.dart' as di;

part 'travel_step_event.dart';
part 'travel_step_state.dart';

class TravelStepBloc extends Bloc<TravelStepEvent, TravelStepState> {
  final CreateTripBloc createTripBloc;
  final imagePicker = ImagePicker();

  TravelStepBloc(this.createTripBloc) : super(TravelStepState.initial()) {
    on<OpenEventImagePicker>(_onOpenImagePicker);
    on<ToTheNextScreenEvent>(_toTheNextScreen);
    on<ToTheNexStepevent>(_toTheNextStep);
    on<ToThePreviousScreenEvent>(_toThePreviousScreen);
    on<NoDateCheckboxevent>(_onCheckedBox);
    on<StartDateSelectedEvent>(_onStartDateSelected);
    on<AddNewStepEvent>(_onNewStep);
    on<OnLoadDataEvent>(_onLoadData);

    add(OnLoadDataEvent());
  }

  void _onOpenImagePicker(
      OpenEventImagePicker event, Emitter<TravelStepState> emit) async {
    final pickedFile = await imagePicker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      emit(state.copyWith(
          photoPath: pickedFile.path,
          photoFile: pickedFile,
          error: TripsError.none));
    }
  }

  void _toTheNextScreen(
      ToTheNextScreenEvent event, Emitter<TravelStepState> emit) {
    switch (state.steps) {
      case TravelSteps.infos:
        {
          if (event.tripName != null && event.tripName!.isNotEmpty) {
            emit(state.copyWith(
              steps: TravelSteps.date,
              tripName: event.tripName,
              tripDescription: event.tripDescription,
              error: TripsError.none,
            ));
          } else {
            emit(state.copyWith(error: TripsError.tripNameEmpty));
          }
          break;
        }
      case TravelSteps.date:
        {
          emit(state.copyWith(
            steps: TravelSteps.trip,
            nextDate: state.tripStartdate,
            error: TripsError.none,
          ));
          break;
        }
      case TravelSteps.trip:
        break;
    }
  }

  void _toTheNextStep(ToTheNexStepevent event, Emitter<TravelStepState> emit) {
    safePrint("Bambam");
    if (state.destinations.isNotEmpty) {
      safePrint("Emit");
      createTripBloc.add(UpdateTripsEvent(
          destinations: state.destinations,
          name: state.tripName,
          description: state.tripDescription));
      safePrint("Fin emit");
      createTripBloc.add(CreateTripNextStepEvent());
    } else {
      safePrint("Errrrroooor");
      emit(state.copyWith(error: TripsError.destinationsEmpty));
    }
  }

  void _toThePreviousScreen(
      ToThePreviousScreenEvent event, Emitter<TravelStepState> emit) {
    switch (state.steps) {
      case TravelSteps.infos:
        break;
      case TravelSteps.date:
        emit(state.copyWith(steps: TravelSteps.infos));
        break;
      case TravelSteps.trip:
        emit(state.copyWith(steps: TravelSteps.date));
        break;
    }
  }

  void _onCheckedBox(NoDateCheckboxevent event, Emitter<TravelStepState> emit) {
    emit(state.copyWith(isAnActualTrip: !state.isAnActualTrip));
  }

  FutureOr<void> _onStartDateSelected(
      StartDateSelectedEvent event, Emitter<TravelStepState> emit) {
    emit(
        state.copyWith(tripStartdate: event.startDate, error: TripsError.none));
  }

  FutureOr<void> _onNewStep(
      AddNewStepEvent event, Emitter<TravelStepState> emit) async {
    // TODO : Décalage de toutes les dates
    int daysToAdd = event.days + (event.weeks * 7) + (event.months * 30);
    DateTime newStepDate;
    List<Step> steps = List.from(state.destinations);

    if (event.modifyStep) {
      DateTime beginDate = event.step!.begin!.getDateTime();
      newStepDate = beginDate.add(Duration(days: daysToAdd));
      final index = steps.indexOf(event.step!);

      steps.removeAt(index);

      final Step step = Step(
        country: event.country,
        city: event.city,
        status: Status.PUBLISHED,
        begin: TemporalDate(beginDate),
        end: TemporalDate(newStepDate),
        nbDays: daysToAdd,
        category: state.categories[event.categoryIndex],
      );

      steps.insert(index, step);
      emit(state.copyWith(destinations: steps));
    } else {
      newStepDate = state.nextDate.add(Duration(days: daysToAdd));
      final Step step = Step(
        country: event.country,
        city: event.city,
        status: Status.PUBLISHED,
        begin: TemporalDate(state.nextDate),
        end: TemporalDate(newStepDate),
        nbDays: daysToAdd,
        category: state.categories[event.categoryIndex],
      );

      steps.add(step);
      emit(state.copyWith(destinations: steps, nextDate: newStepDate));
    }
  }

  FutureOr<void> _onLoadData(
      OnLoadDataEvent event, Emitter<TravelStepState> emit) async {
    List<TripCategory?> categories =
        await di.sl<GetAllTripCategories>().call(NoParams());

    emit(state.copyWith(categories: categories));
  }
}
