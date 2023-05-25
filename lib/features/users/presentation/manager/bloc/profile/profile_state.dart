// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'profile_bloc.dart';

class ProfileState extends Equatable {
  final ProfileStatus status;
  final User currentUser;
  final bool isItMe;
  final bool isTripShowed;
  final List<Marker>? tripsMarkers;

  const ProfileState(
      {required this.status,
      required this.currentUser,
      required this.isItMe,
      required this.isTripShowed,
      this.tripsMarkers});

  factory ProfileState.initial() => ProfileState(
        status: ProfileStatus.initial,
        currentUser: User(username: ""),
        isItMe: false,
        isTripShowed: true,
      );

  @override
  List<Object> get props => [status, currentUser, isItMe, isTripShowed];

  ProfileState copyWith({
    ProfileStatus? status,
    User? currentUser,
    bool? isItMe,
    bool? isTripShowed,
    List<Marker>? tripsMarkers,
  }) {
    return ProfileState(
      status: status ?? this.status,
      currentUser: currentUser ?? this.currentUser,
      isItMe: isItMe ?? this.isItMe,
      isTripShowed: isTripShowed ?? this.isTripShowed,
      tripsMarkers: tripsMarkers ?? this.tripsMarkers,
    );
  }
}
