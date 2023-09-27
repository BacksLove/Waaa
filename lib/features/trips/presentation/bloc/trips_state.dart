// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'trips_bloc.dart';

class TripsState extends Equatable {
  final TripDetailStatus status;
  final Trip? currentTrip;
  final TripTabShowed tabShowed;
  final List<String> everyPhotos;
  final List<StepCountry> everyStepCountries;

  const TripsState({
    required this.status,
    this.currentTrip,
    required this.tabShowed,
    required this.everyPhotos,
    required this.everyStepCountries,
  });

  factory TripsState.initial() => const TripsState(
        status: TripDetailStatus.none,
        currentTrip: null,
        tabShowed: TripTabShowed.trip,
        everyPhotos: [],
        everyStepCountries: [],
      );

  @override
  List<Object> get props =>
      [status, tabShowed, everyPhotos, everyStepCountries];

  TripsState copyWith({
    TripDetailStatus? status,
    Trip? currentTrip,
    TripTabShowed? tabShowed,
    List<String>? everyPhotos,
    List<StepCountry>? everyStepCountries,
  }) {
    return TripsState(
      status: status ?? this.status,
      currentTrip: currentTrip ?? this.currentTrip,
      tabShowed: tabShowed ?? this.tabShowed,
      everyPhotos: everyPhotos ?? this.everyPhotos,
      everyStepCountries: everyStepCountries ?? this.everyStepCountries,
    );
  }
}
