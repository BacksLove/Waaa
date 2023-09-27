part of 'create_trip_bloc.dart';

class CreateTripState extends Equatable {
  final TripsSteps steps;
  final List<Step> destinations;
  final String tripName;
  final String tripDescription;

  const CreateTripState({
    required this.steps,
    required this.destinations,
    required this.tripName,
    required this.tripDescription,
  });

  factory CreateTripState.initial() => const CreateTripState(
        steps: TripsSteps.travelStep,
        destinations: [],
        tripName: "",
        tripDescription: "",
      );

  @override
  List<Object> get props => [steps, destinations, tripName, tripDescription];

  CreateTripState copyWith({
    TripsSteps? steps,
    List<Step>? destinations,
    String? tripName,
    String? tripDescription,
  }) {
    return CreateTripState(
      steps: steps ?? this.steps,
      destinations: destinations ?? this.destinations,
      tripName: tripName ?? this.tripName,
      tripDescription: tripDescription ?? this.tripDescription,
    );
  }
}
