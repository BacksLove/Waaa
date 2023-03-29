import '../../domain/entities/event_entity.dart';

abstract class EventRemoteDatasource {
  Future<bool> createEvent(Event event);
  Future<bool> updateEvent(Event event);
  Future<bool> deleteEvent(String id);
  Future<List<Event>> getWaaEvents();
  Future<List<Event>> getEventsByUserId(String id);
}

class EventRemoteDatasourceImpl implements EventRemoteDatasource {
  @override
  Future<List<Event>> getEventsByUserId(String id) {
    // TODO: implement getEventsByUserId
    throw UnimplementedError();
  }

  @override
  Future<List<Event>> getWaaEvents() {
    // TODO: implement getWaaEvents
    throw UnimplementedError();
  }

  @override
  Future<bool> createEvent(Event event) {
    // TODO: implement createEvent
    throw UnimplementedError();
  }

  @override
  Future<bool> deleteEvent(String id) {
    // TODO: implement deleteEvent
    throw UnimplementedError();
  }

  @override
  Future<bool> updateEvent(Event event) {
    // TODO: implement updateEvent
    throw UnimplementedError();
  }



}