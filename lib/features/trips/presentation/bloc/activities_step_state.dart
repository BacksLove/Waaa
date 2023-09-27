part of 'activities_step_bloc.dart';

class ActivitiesStepState extends Equatable {
  final List<Step> destinations;
  final List<StepActivities> stepActivities;
  final List<Activity?> activities;

  const ActivitiesStepState(
      {required this.destinations,
      required this.stepActivities,
      required this.activities});

  factory ActivitiesStepState.initial() => const ActivitiesStepState(
      destinations: [], stepActivities: [], activities: []);

  @override
  List<Object> get props => [destinations, activities, stepActivities];

  ActivitiesStepState copyWith({
    List<Step>? destinations,
    List<Activity?>? activities,
    List<StepActivities>? stepActivities,
  }) {
    return ActivitiesStepState(
      destinations: destinations ?? this.destinations,
      activities: activities ?? this.activities,
      stepActivities: stepActivities ?? this.stepActivities,
    );
  }
}
