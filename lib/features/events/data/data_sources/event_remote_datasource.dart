import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:waaa/core/queries/event_queries.dart';
import 'package:waaa/models/ModelProvider.dart';

abstract class EventRemoteDatasource {
  Future<bool> createEvent(Event event);
  Future<bool> updateEvent(Event event);
  Future<bool> deleteEvent(String id);
  Future<List<Event?>> getWaaEvents();
  Future<List<Event?>> getEventsByUserId(String id);
  Future<bool> participateToEvent(User user, Event event, DemandStatus status);
  Future<Event?> getEventById(String id);
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
      const graphQLDocument = waaaEventsQuery;
      final request = GraphQLRequest<PaginatedResult<Event>>(
        document: graphQLDocument,
        modelType: const PaginatedModelType(Event.classType),
        //variables: <String, String>{'id': someTodoId},
        decodePath: "listEvents",
      );
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

  @override
  Future<bool> participateToEvent(
      User user, Event event, DemandStatus status) async {
    try {
      final request = ModelMutations.create(
          EventParticipant(event: event, user: user, status: status));
      final response = await Amplify.API.mutate(request: request).response;

      if (response.data == null) {
        safePrint("errors: ${response.errors}");
        return false;
      }
      return true;
    } catch (e) {
      safePrint(e);
      return false;
    }
  }

  @override
  Future<Event?> getEventById(String id) async {
    try {
      const graphQLDocument = eventByIdQuery;
      final request = GraphQLRequest<Event>(
        document: graphQLDocument,
        modelType: Event.classType,
        variables: <String, String>{'id': id},
        decodePath: "getEvent",
      );
      final response = await Amplify.API.query(request: request).response;
      final event = response.data;

      if (event == null) {
        safePrint("errors: ${response.errors}");
        return null;
      }
      return event;
    } on AuthException catch (e) {
      safePrint(e.message);
      return null;
    }
  }
}
