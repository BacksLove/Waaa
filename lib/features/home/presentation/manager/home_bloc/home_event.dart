part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class LoadData extends HomeEvent {}

class HomeEventPressed extends HomeEvent {
  final Event event;

  const HomeEventPressed({required this.event});
}
