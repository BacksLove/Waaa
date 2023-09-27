// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'photo_step_bloc.dart';

class PhotoStepState extends Equatable {
  final List<XFile?> photoFile;
  final List<String> photoPath;
  final Step currentDestination;
  final int currentDestinationIndex;
  final StepDateStatus destinationDateStatus;

  const PhotoStepState({
    required this.photoFile,
    required this.photoPath,
    required this.currentDestination,
    required this.currentDestinationIndex,
    required this.destinationDateStatus,
  });

  factory PhotoStepState.initial() => PhotoStepState(
      photoFile: const [],
      photoPath: const [],
      currentDestination: Step(city: "", country: "", status: Status.DRAFTED),
      currentDestinationIndex: 0,
      destinationDateStatus: StepDateStatus.actual);

  @override
  List<Object> get props => [
        photoFile,
        photoPath,
        currentDestination,
        currentDestinationIndex,
        destinationDateStatus,
      ];

  PhotoStepState copyWith({
    List<XFile?>? photoFile,
    List<String>? photoPath,
    Step? currentDestination,
    int? currentDestinationIndex,
    StepDateStatus? destinationDateStatus,
  }) {
    return PhotoStepState(
      photoFile: photoFile ?? this.photoFile,
      photoPath: photoPath ?? this.photoPath,
      currentDestination: currentDestination ?? this.currentDestination,
      currentDestinationIndex:
          currentDestinationIndex ?? this.currentDestinationIndex,
      destinationDateStatus:
          destinationDateStatus ?? this.destinationDateStatus,
    );
  }
}
