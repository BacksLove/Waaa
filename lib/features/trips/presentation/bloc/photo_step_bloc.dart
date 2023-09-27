import 'package:aws_common/aws_common.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';
import 'package:waaa/core/enums/trips_enum.dart';
import 'package:waaa/features/trips/presentation/bloc/create_trip_bloc.dart';
import 'package:waaa/models/ModelProvider.dart';

part 'photo_step_event.dart';
part 'photo_step_state.dart';

class PhotoStepBloc extends Bloc<PhotoStepEvent, PhotoStepState> {
  final CreateTripBloc createTripBloc;
  final imagePicker = ImagePicker();

  PhotoStepBloc(this.createTripBloc) : super(PhotoStepState.initial()) {
    on<OpenEventImagePicker>(_onOpenImagePicker);
    on<RemovePhotoFromListEvent>(onRemovePhoto);
    on<OnLoadDataEvent>(_onLoadData);
    on<OnNextPressedEvent>(_onNext);

    add(OnLoadDataEvent());
  }

  void _onOpenImagePicker(
      OpenEventImagePicker event, Emitter<PhotoStepState> emit) async {
    final pickedFile = await imagePicker.pickMultiImage();
    List<String> photoPath = [];

    if (pickedFile.isNotEmpty) {
      for (var files in pickedFile) {
        photoPath.add(files.path);
      }
      emit(state.copyWith(photoPath: photoPath, photoFile: pickedFile));
    }
  }

  void onRemovePhoto(
      RemovePhotoFromListEvent event, Emitter<PhotoStepState> emit) {}

  void _onLoadData(OnLoadDataEvent event, Emitter<PhotoStepState> emit) {
    Step firstDestination = createTripBloc.state.destinations.first;
    final DateTime currentDate = DateTime.now();
    StepDateStatus status = StepDateStatus.actual;
    if (firstDestination.end!.getDateTime().isBefore(currentDate)) {
      status = StepDateStatus.previous;
    }
    if (firstDestination.begin!.getDateTime().isAfter(currentDate)) {
      status = StepDateStatus.future;
    }
    if (firstDestination.begin!.getDateTime().isBefore(currentDate) &&
        firstDestination.end!.getDateTime().isAfter(currentDate)) {
      status = StepDateStatus.actual;
    }

    if (firstDestination.status == Status.DRAFTED) {
      status = StepDateStatus.bucketList;
    }

    emit(state.copyWith(
        currentDestination: firstDestination,
        currentDestinationIndex: 0,
        destinationDateStatus: status));
  }

  void _onNext(OnNextPressedEvent event, Emitter<PhotoStepState> emit) {
    if (state.currentDestination == createTripBloc.state.destinations.last) {
      safePrint("ook");
      createTripBloc.add(CreateTripNextStepEvent());
    } else {
      final int newIndex = state.currentDestinationIndex + 1;
      Step destination = createTripBloc.state.destinations[newIndex];
      final DateTime currentDate = DateTime.now();
      StepDateStatus status = StepDateStatus.actual;

      if (destination.end!.getDateTime().isBefore(currentDate)) {
        status = StepDateStatus.previous;
      }
      if (destination.begin!.getDateTime().isAfter(currentDate)) {
        status = StepDateStatus.future;
      }
      if (destination.begin!.getDateTime().isBefore(currentDate) &&
          destination.end!.getDateTime().isAfter(currentDate)) {
        status = StepDateStatus.actual;
      }

      if (destination.status == Status.DRAFTED) {
        status = StepDateStatus.bucketList;
      }

      createTripBloc.state.destinations[state.currentDestinationIndex].copyWith(
        photos: state.photoPath,
      );

      // TODO: UploadPhoto

      emit(state.copyWith(
        currentDestination: destination,
        currentDestinationIndex: newIndex,
        destinationDateStatus: status,
        photoFile: [],
        photoPath: [],
      ));
    }
  }
}
