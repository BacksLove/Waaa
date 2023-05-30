import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'update_event_event.dart';
part 'update_event_state.dart';

class UpdateEventBloc extends Bloc<UpdateEventEvent, UpdateEventState> {
  UpdateEventBloc() : super(UpdateEventInitial()) {
    on<UpdateEventEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
