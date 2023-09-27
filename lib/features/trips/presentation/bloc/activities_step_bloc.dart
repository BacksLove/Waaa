import 'package:aws_common/aws_common.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:waaa/core/usecases/usecase.dart';
import 'package:waaa/features/trips/domain/usecases/get_all_activities.dart';
import 'package:waaa/features/trips/presentation/bloc/create_trip_bloc.dart';
import 'package:waaa/models/ModelProvider.dart';

import 'package:waaa/injection_container.dart' as di;

part 'activities_step_event.dart';
part 'activities_step_state.dart';

class ActivitiesBloc extends Bloc<ActivitiesStepEvent, ActivitiesStepState> {
  final CreateTripBloc createTripBloc;

  ActivitiesBloc(this.createTripBloc) : super(ActivitiesStepState.initial()) {
    on<OnLoadActivityEvent>(_onLoad);

    add(OnLoadActivityEvent());
  }

  void _onLoad(
      OnLoadActivityEvent event, Emitter<ActivitiesStepState> emit) async {
    final activities = await di.sl<GetAllActivities>().call(NoParams());
    final List<Step> dest = List.from(createTripBloc.state.destinations);
    //List<StepActivities> stepActivities;

    //final StepActivities stepActivities = StepActivities(step: step, activity: activity)
    safePrint(activities);
    safePrint(activities.toString());
    emit(state.copyWith(
      activities: activities,
      destinations: dest,
    ));
  }
}
