import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:waaa/core/enums/home_enum.dart';
import 'package:waaa/core/usecases/usecase.dart';
import 'package:waaa/core/util/mocks/users.dart';
import 'package:waaa/features/auth/presentation/manager/auth_bloc/auth_bloc.dart';
import 'package:waaa/features/events/domain/use_cases/get_waaa_events.dart';
import 'package:waaa/features/users/domain/use_cases/get_user_by_city.dart';

import 'package:waaa/injection_container.dart' as di;
import 'package:waaa/models/Event.dart';
import 'package:waaa/models/User.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  AuthBloc authBloc;

  HomeBloc(this.authBloc) : super(HomeState.initial()) {
    on<LoadData>(_onLoadData);

    add(LoadData());
  }

  @override
  void onTransition(Transition<HomeEvent, HomeState> transition) {
    super.onTransition(transition);
  }

  void _onLoadData(LoadData event, Emitter<HomeState> emit) async {
    emit(state.copyWith(status: HomeStatus.loading));
    User? currentUser = authBloc.state.user;
    if (currentUser != null) {
      final usersNear = await di
          .sl<GetUserByCity>()
          .call(const GetUserByCityParams(city: ""));
      final commonEvents = await di.sl<GetWaaaEvents>().call(NoParams());

      safePrint("EVENTS = ${commonEvents.first?.name}");

      emit(state.copyWith(
        status: HomeStatus.loaded,
        usersNear: usersNear,
        userEvents: currentUser.events,
        waaaEvents: commonEvents,
      ));
    } else {
      emit(state.copyWith(status: HomeStatus.loaded, usersNear: mockUsersList));
    }
  }
}
