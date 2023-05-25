part of 'home_bloc.dart';

class HomeState extends Equatable {
  final HomeStatus status;
  final List<User?> usersNear;
  final List<Event?> userEvents;
  final List<Event?> waaaEvents;

  const HomeState({
    required this.status,
    required this.usersNear,
    required this.userEvents,
    required this.waaaEvents,
  });

  factory HomeState.initial() => const HomeState(
        status: HomeStatus.initial,
        usersNear: [],
        userEvents: [],
        waaaEvents: [],
      );

  HomeState copyWith({
    HomeStatus? status,
    List<User?>? usersNear,
    List<Event?>? userEvents,
    List<Event?>? waaaEvents,
  }) {
    return HomeState(
      status: status ?? this.status,
      usersNear: usersNear ?? this.usersNear,
      userEvents: userEvents ?? this.userEvents,
      waaaEvents: waaaEvents ?? this.waaaEvents,
    );
  }

  @override
  List<Object> get props => [status, usersNear, userEvents, waaaEvents];
}
