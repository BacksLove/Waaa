part of 'create_trip_bloc.dart';

abstract class CreateTripEvent extends Equatable {
  const CreateTripEvent();

  @override
  List<Object> get props => [];
}

class CreateTripNextStepEvent extends CreateTripEvent {}

class UpdateTripsEvent extends CreateTripEvent {
  final List<Step> destinations;
  final String name;
  final String description;

  const UpdateTripsEvent({
    required this.destinations,
    required this.name,
    required this.description,
  });
}
