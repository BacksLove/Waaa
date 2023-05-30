part of '../update_event/update_event_bloc.dart';

abstract class UpdateEventState extends Equatable {
  const UpdateEventState();

  @override
  List<Object> get props => [];
}

class UpdateEventInitial extends UpdateEventState {}
