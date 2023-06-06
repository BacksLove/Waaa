import 'dart:async';

import 'package:aws_common/aws_common.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/plugin_api.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:waaa/core/constants/constants.dart';
import 'package:waaa/core/enums/user_enum.dart';
import 'package:waaa/core/util/functions.dart';
import 'package:waaa/core/util/input_converter.dart';
import 'package:waaa/core/util/localized.dart';
import 'package:waaa/features/users/domain/use_cases/get_friendship_status.dart';
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
        final userId = di.sl<SharedPreferences>().getString(userCognitoIdKey);
        bool isItMe = userId == currentUser.cognitoUserPoolId ? true : false;
        final userAge = DateConverter().getAge(currentUser.birthday);
        int userFollowers = getFollowersFromUser(currentUser);

        final friendStatus = await getFriendStatus(currentUser);

        emit(
          state.copyWith(
            status: ProfileStatus.loaded,
            currentUser: currentUser,
            isItMe: isItMe,
            isTripShowed: true,
            age: userAge,
            followers: userFollowers.toString(),
            friendStatus: friendStatus,
          ),
        );
      }
    } catch (e) {
      safePrint(e);
    }
  }
}

Future<ProfileFriendStatus> getFriendStatus(User user) async {
  final userId = di.sl<SharedPreferences>().getString(userIdKey);

  final result = await di
      .sl<GetFriendshipStatus>()
      .call(GetFriendshipStatusParams(userId: userId!, friendId: user.id));

  if (result != null) {
    final status = result.status;
    if (status == DemandStatus.ACCEPTED) {
      return ProfileFriendStatus.followed;
    }
    if (status == DemandStatus.BLOCKED) {
      return ProfileFriendStatus.blocked;
    }
    if (status == DemandStatus.REJECTED) {
      return ProfileFriendStatus.rejected;
    }
    if (status == DemandStatus.REQUESTED) {
      if (result.sender.id == userId) {
        return ProfileFriendStatus.waitResponse;
      } else {
        return ProfileFriendStatus.waitAction;
      }
    }
  }

  return ProfileFriendStatus.canFollow;
}

String getNameFromStatus(BuildContext context, ProfileFriendStatus status) {
  switch (status) {
    case ProfileFriendStatus.canFollow:
      return localized(context).follow;
    case ProfileFriendStatus.blocked:
      return localized(context).blocked;
    case ProfileFriendStatus.rejected:
      return "refusé";
    case ProfileFriendStatus.unfollow:
      return localized(context).unfollow;
    case ProfileFriendStatus.waitResponse:
      return "en attente";
    case ProfileFriendStatus.waitAction:
      return localized(context).accept;
    case ProfileFriendStatus.followed:
      return "Suivi";
  }
}
