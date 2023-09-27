part of 'travel_step_bloc.dart';

class TravelStepState extends Equatable {
  final TravelSteps steps;
  final TripsError error;

  final String tripName;
  final String tripDescription;
  final DateTime tripStartdate;
  final DateTime nextDate;
  final List<Step> destinations;
  final List<TripCategory?> categories;
  final bool isAnActualTrip;
  final String photoPath;
  final XFile? photoFile;
  final DateTime maxDate;

  const TravelStepState({
    required this.tripName,
    required this.error,
    required this.tripDescription,
    required this.tripStartdate,
    required this.nextDate,
    required this.destinations,
    required this.categories,
    required this.steps,
    required this.photoPath,
    this.photoFile,
    required this.isAnActualTrip,
    required this.maxDate,
  });

  factory TravelStepState.initial() => TravelStepState(
        steps: TravelSteps.infos,
        error: TripsError.none,
        photoPath: "",
        photoFile: null,
        isAnActualTrip: false,
        maxDate: DateTime(
            DateTime.now().year + 10, DateTime.now().month, DateTime.now().day),
        destinations: const [],
        categories: const [],
        tripStartdate: DateTime.now(),
        nextDate: DateTime.now(),
        tripDescription: "",
        tripName: "",
      );

  @override
  List<Object> get props => [
        steps,
        error,
        photoPath,
        isAnActualTrip,
        tripName,
        tripDescription,
        tripStartdate,
        nextDate,
        destinations,
        categories,
      ];

  TravelStepState copyWith({
    TravelSteps? steps,
    TripsError? error,
    String? tripName,
    String? tripDescription,
    DateTime? tripStartdate,
    DateTime? nextDate,
    List<Step>? destinations,
    List<TripCategory?>? categories,
    bool? isAnActualTrip,
    String? photoPath,
    XFile? photoFile,
    DateTime? maxDate,
  }) {
    return TravelStepState(
      steps: steps ?? this.steps,
      error: error ?? this.error,
      tripName: tripName ?? this.tripName,
      tripDescription: tripDescription ?? this.tripDescription,
      tripStartdate: tripStartdate ?? this.tripStartdate,
      nextDate: nextDate ?? this.nextDate,
      destinations: destinations ?? this.destinations,
      categories: categories ?? this.categories,
      isAnActualTrip: isAnActualTrip ?? this.isAnActualTrip,
      photoPath: photoPath ?? this.photoPath,
      photoFile: photoFile ?? this.photoFile,
      maxDate: maxDate ?? this.maxDate,
    );
  }
}
