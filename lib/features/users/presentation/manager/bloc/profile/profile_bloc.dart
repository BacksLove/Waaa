import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_map/plugin_api.dart';

import '../../../../domain/entities/user_entity.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(ProfileState.initial()) {
    on<ProfileEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<ProfileNewsTabPressed>(_onNewsTabPressed);
    on<ProfileTripTabPressed>(_onTripsTabPressed);
  }

  void _onNewsTabPressed(
      ProfileNewsTabPressed event, Emitter<ProfileState> emit) {
    emit(state.copyWith(isTripShowed: false));
  }

  void _onTripsTabPressed(
      ProfileTripTabPressed event, Emitter<ProfileState> emit) {
    emit(state.copyWith(isTripShowed: true));
  }
}
