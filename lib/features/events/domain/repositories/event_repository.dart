import 'package:waaa/models/ModelProvider.dart';

abstract class EventRepository {
  Future<Event?> createEvent(Event event);
  Future<bool> updateEvent(Event event);
  Future<bool> deleteEvent(String id);
  Future<List<Event?>> getWaaEvents();
  Future<List<Event?>> getEventsByUserId(String id);
  Future<bool> participateToEvent(EventParticipant participant);
  Future<bool> addCoownerToEvent(EventCoowner coowner);
  Future<Event?> getEventById(String id);
  Future<List<EventTopic?>> getAllEventTopic();
}
