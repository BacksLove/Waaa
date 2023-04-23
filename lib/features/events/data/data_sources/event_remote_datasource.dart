import 'dart:convert';

import 'package:amplify_flutter/amplify_flutter.dart';

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
  Future<List<Event>> getEventsByUserId(String id) async {
    List<Event> eventList = [];
    try {
      const doc = '''query MyQuery {
  listEvents(filter: {userEventsId: {eq: "03fe759a-d30a-4b33-a2b8-8e2e205f0d49"}}) {
    items {
      address
      begin
      city
      country
      createdAt
      description
      end
      hourBegin
      id
      hourEnd
      isPublic
      language
      mainPhoto
      maxParticipants
      minAgeRestriction
      minParticipants
      name
      photos
      userEventsId
      participants {
        items {
          user {
            id
            languagesSpeak
            photo
            username
          }
        }
      }
    }
  }
}''';
      var operation =
          Amplify.API.query(request: GraphQLRequest<String>(document: doc));
      var result = await operation.response;

      if (result.data != null) {
        var eventsJSON = json.decode(result.data!)["listEvents"]["items"];
        eventList = (eventsJSON).map<Event>((e) => Event.fromJson(e)).toList();
      }
      return eventList;
    } on AuthException catch (e) {
      safePrint(e.message);
      return eventList;
    }
  }

  @override
  Future<List<Event>> getWaaEvents() async {
    List<Event> eventList = [];
    try {
      const doc = '''query MyQuery {
  listEvents {
    items {
      address
      begin
      city
      country
      createdAt
      description
      end
      hourBegin
      id
      hourEnd
      isPublic
      language
      mainPhoto
      maxParticipants
      minAgeRestriction
      minParticipants
      name
      photos
      userEventsId
    }
  }
}''';
      var operation =
          Amplify.API.query(request: GraphQLRequest<String>(document: doc));
      var result = await operation.response;

      if (result.data != null) {
        var eventsJSON = json.decode(result.data!)["listEvents"]["items"];
        eventList = (eventsJSON).map<Event>((e) => Event.fromJson(e)).toList();
      }
      return eventList;
    } on AuthException catch (e) {
      safePrint(e.message);
      return eventList;
    }
  }

  @override
  Future<bool> createEvent(Event event) {
    throw UnimplementedError();
  }

  @override
  Future<bool> deleteEvent(String id) {
    throw UnimplementedError();
  }

  @override
  Future<bool> updateEvent(Event event) {
    throw UnimplementedError();
  }
}
