part of 'photo_step_bloc.dart';

abstract class PhotoStepEvent extends Equatable {
  const PhotoStepEvent();

  @override
  List<Object> get props => [];
}

class OpenEventImagePicker extends PhotoStepEvent {}

class RemovePhotoFromListEvent extends PhotoStepEvent {
  final String photoPath;

  const RemovePhotoFromListEvent({required this.photoPath});
}

class OnLoadDataEvent extends PhotoStepEvent {}

class OnNextPressedEvent extends PhotoStepEvent {}
