import 'package:equatable/equatable.dart';

class EventTopic extends Equatable {

  final String id;
  final String name;

  const EventTopic({required this.id, required this.name});

  @override
  List<Object?> get props => [id, name];
}