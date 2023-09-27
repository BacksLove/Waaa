part of 'travel_step_bloc.dart';

abstract class TravelStepEvent extends Equatable {
  const TravelStepEvent();

  @override
  List<Object> get props => [];
}

class OnLoadDataEvent extends TravelStepEvent {}

class OpenEventImagePicker extends TravelStepEvent {}

class ToTheNextScreenEvent extends TravelStepEvent {
  final String? tripName;
  final String? tripDescription;

  const ToTheNextScreenEvent({this.tripName, this.tripDescription});
}

class ToThePreviousScreenEvent extends TravelStepEvent {}

class ToTheNexStepevent extends TravelStepEvent {}

class NoDateCheckboxevent extends TravelStepEvent {}

class StartDateSelectedEvent extends TravelStepEvent {
  final DateTime startDate;

  const StartDateSelectedEvent({required this.startDate});
}

class AddNewStepEvent extends TravelStepEvent {
  final String country;
  final String city;
  final int days;
  final int weeks;
  final int months;
  final int categoryIndex;
  final bool modifyStep;
  final Step? step;

  const AddNewStepEvent({
    required this.country,
    required this.city,
    required this.days,
    required this.weeks,
    required this.months,
    required this.categoryIndex,
    required this.modifyStep,
    this.step,
  });
}
