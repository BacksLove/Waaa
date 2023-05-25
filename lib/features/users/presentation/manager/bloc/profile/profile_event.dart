part of 'profile_bloc.dart';

abstract class ProfileEvent extends Equatable {
  const ProfileEvent();

  @override
  List<Object> get props => [];
}

class ProfileTripTabPressed extends ProfileEvent {}

class ProfileTripsYearSelected extends ProfileEvent {}

class ProfileMapMarkerTapped extends ProfileEvent {}

class ProfileNewsTabPressed extends ProfileEvent {}

class ProfileLoadData extends ProfileEvent {
  final String userId;

  const ProfileLoadData({required this.userId});
}
