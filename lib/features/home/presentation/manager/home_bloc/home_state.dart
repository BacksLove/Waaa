part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeLoadedState extends HomeState {
  final List<User> usersNear;
  final List<Event> userEvents;
  final List<Event> waaaEvents;

  const HomeLoadedState(
      {required this.usersNear,
      required this.userEvents,
      required this.waaaEvents});
}

class HomeLoadingFailedState extends HomeState {
  final String errorMessage;

  const HomeLoadingFailedState({required this.errorMessage});
}

class HomeToEventDetailState extends HomeState {
  final Event event;

  const HomeToEventDetailState({required this.event});
}
