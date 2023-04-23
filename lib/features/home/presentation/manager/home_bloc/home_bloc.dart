import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:waaa/core/usecases/usecase.dart';
import 'package:waaa/features/auth/presentation/manager/auth_bloc/auth_bloc.dart';
import 'package:waaa/features/events/domain/use_cases/get_waaa_events.dart';

import '../../../../events/domain/entities/event_entity.dart';
import '../../../../users/domain/entities/user_entity.dart';

import 'package:waaa/injection_container.dart' as di;

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  AuthBloc authBloc;

  HomeBloc(this.authBloc) : super(HomeInitial()) {
    on<LoadData>(_onLoadData);

    add(LoadData());
  }

  @override
  void onTransition(Transition<HomeEvent, HomeState> transition) {
    super.onTransition(transition);
    //print(transition);
  }

  void _onLoadData(LoadData event, Emitter<HomeState> emit) async {
    emit(HomeLoadingState());
    late List<User> usersNear;
    late List<Event> commonEvents;
    late List<Event> userEvents;
    User? currentUser = authBloc.state.user;
    if (currentUser != null) {
      usersNear = [];
      if (currentUser.events != null) {
        userEvents = currentUser.events!;
      } else {
        userEvents = [];
      }
      commonEvents = await di.sl<GetWaaaEvents>().call(NoParams());
      emit(HomeLoadedState(
          usersNear: usersNear,
          userEvents: userEvents,
          waaaEvents: commonEvents));
    } else {
      emit(const HomeLoadingFailedState(errorMessage: "User not found"));
    }
  }
}
