import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';
import 'package:waaa/core/enums/event_enum.dart';
import 'package:waaa/core/util/input_converter.dart';
import 'package:waaa/models/Event.dart';
import 'package:waaa/models/User.dart';

part 'create_event_event.dart';
part 'create_event_state.dart';

class CreateEventBloc extends Bloc<CreateEventEvent, CreateEventState> {
  final imagePicker = ImagePicker();

  CreateEventBloc() : super(CreateEventState.initial()) {
    on<CreateEventEvent>((event, emit) {});
    on<OpenEventImagePicker>(_onOpenImagePicker);
    on<ToNextEventStepPressed>(_onNextEventStepPressed);
  }

  void _onOpenImagePicker(
      OpenEventImagePicker event, Emitter<CreateEventState> emit) async {
    final pickedFile = await imagePicker.pickImage(source: event.source);

    if (pickedFile != null) {
      emit(state.copyWith(photoPath: pickedFile.path, photoFile: pickedFile));
    }
  }

  void _onNextEventStepPressed(
      ToNextEventStepPressed event, Emitter<CreateEventState> emit) {
    if (event.title.isEmpty ||
        event.address.isEmpty ||
        event.theme.isEmpty ||
        event.beginDateTime.isEmpty ||
        event.endDateTime.isEmpty ||
        event.nbParticipate.isEmpty) {
      emit(state.copyWith(
          errorMessage: "all field must be filled to go to the next step"));
    } else {
      final beginDate = DateConverter().stringToDate(event.beginDateTime);
      final endDate = DateConverter().stringToDate(event.endDateTime);

      emit(
        state.copyWith(
          step: CreateEventStep.partTwo,
          title: event.title,
          isPublic: event.isPublic,
          address: event.address,
          theme: event.theme,
          beginDateTime: beginDate,
          endDateTime: endDate,
          nbParticipate: event.nbParticipate,
        ),
      );
    }
  }
}
