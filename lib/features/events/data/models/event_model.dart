import 'package:waaa/features/events/domain/entities/event_entity.dart';

class EventModel extends Event {
  final String? id;

  const EventModel({this.id, required super.name, required super.participants, required super.address, required super.country, required super.city, required super.photoUrl});

}