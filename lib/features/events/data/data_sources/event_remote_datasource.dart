import 'dart:convert';

import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:waaa/models/Event.dart';

abstract class EventRemoteDatasource {
  Future<bool> createEvent(Event event);
  Future<bool> updateEvent(Event event);
  Future<bool> deleteEvent(String id);
  Future<List<Event?>> getWaaEvents();
  Future<List<Event?>> getEventsByUserId(String id);
}

class EventRemoteDatasourceImpl implements EventRemoteDatasource {
  @override
  Future<List<Event?>> getEventsByUserId(String id) async {
    try {
      //final queryPredicates
      final request = ModelQueries.list(Event.classType);
      final response = await Amplify.API.query(request: request).response;
      final events = response.data?.items;

      if (events == null) {
        safePrint("errors: ${response.errors}");
        return [];
      }
      return events;
    } on AuthException catch (e) {
      safePrint(e.message);
      return [];
    }
  }

  @override
  Future<List<Event?>> getWaaEvents() async {
    try {
      //final queryPredicates = Event
      final request = ModelQueries.list<Event>(Event.classType);
      final response = await Amplify.API.query(request: request).response;
      final events = response.data?.items;

      if (events == null || events.isEmpty) {
        safePrint("errors: ${response.errors}");
        return [];
      }
      return events;
    } on AuthException catch (e) {
      safePrint(e.message);
      return [];
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
