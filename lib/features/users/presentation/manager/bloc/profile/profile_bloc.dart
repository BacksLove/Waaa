import 'dart:async';

import 'package:aws_common/aws_common.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_map/plugin_api.dart';
import 'package:scroll_date_picker/scroll_date_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:waaa/core/constants/constants.dart';
import 'package:waaa/core/enums/user_enum.dart';
import 'package:waaa/core/util/input_converter.dart';
import 'package:waaa/features/users/domain/use_cases/get_user_by_id.dart';

import 'package:waaa/injection_container.dart' as di;
import 'package:waaa/models/DemandStatus.dart';
import 'package:waaa/models/User.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(ProfileState.initial()) {
    on<ProfileLoadData>(_onLoadData);
    on<ProfileNewsTabPressed>(_onNewsTabPressed);
    on<ProfileTripTabPressed>(_onTripsTabPressed);
  }

  @override
  void onTransition(Transition<ProfileEvent, ProfileState> transition) {
    //safePrint(transition);
    super.onTransition(transition);
  }

  void _onNewsTabPressed(
      ProfileNewsTabPressed event, Emitter<ProfileState> emit) {
    emit(state.copyWith(isTripShowed: false));
  }

  void _onTripsTabPressed(
      ProfileTripTabPressed event, Emitter<ProfileState> emit) {
    emit(state.copyWith(isTripShowed: true));
  }

  void _onLoadData(ProfileLoadData event, Emitter<ProfileState> emit) async {
    try {
      emit(state.copyWith(status: ProfileStatus.loading));
      final User? currentUser =
          await di.sl<GetUserById>().call(GetUserByIdParams(id: event.userId));
      if (currentUser == null) {
        emit(state.copyWith(status: ProfileStatus.failed));
      } else {
        final userId = di.sl<SharedPreferences>().getString(userIdKey);
        bool isItMe = userId == currentUser.cognitoUserPoolId ? true : false;
        final userAge = DateConverter().getAge(currentUser.birthday);
        safePrint("age = $userAge");
        int userFollowers = 0;

        if (currentUser.friendsReceiver != null &&
            currentUser.friendsReceiver!.isNotEmpty) {
          for (var friend in currentUser.friendsReceiver!) {
            if (friend.status == DemandStatus.ACCEPTED) userFollowers++;
          }
        }
        if (currentUser.friendsSender != null &&
            currentUser.friendsSender!.isNotEmpty) {
          for (var friend in currentUser.friendsSender!) {
            if (friend.status == DemandStatus.ACCEPTED) userFollowers++;
          }
        }

        emit(
          state.copyWith(
            status: ProfileStatus.loaded,
            currentUser: currentUser,
            isItMe: isItMe,
            isTripShowed: true,
            age: userAge,
            followers: userFollowers.toString(),
          ),
        );
      }
    } catch (e) {
      safePrint(e);
    }
  }
}
