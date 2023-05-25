import 'package:waaa/models/Event.dart';

abstract class EventRepository {
  Future<bool> createEvent(Event event);
  Future<bool> updateEvent(Event event);
  Future<bool> deleteEvent(String id);
  Future<List<Event?>> getWaaEvents();
  Future<List<Event?>> getEventsByUserId(String id);
}
