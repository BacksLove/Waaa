part of 'trips_bloc.dart';

abstract class TripsEvent extends Equatable {
  const TripsEvent();

  @override
  List<Object> get props => [];
}

class LoadTripDetailEvent extends TripsEvent {
  final String id;

  const LoadTripDetailEvent({required this.id});
}

class SwitchTabsEvent extends TripsEvent {
  final TripTabShowed tabShowed;

  const SwitchTabsEvent({required this.tabShowed});
}
