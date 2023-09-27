import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:waaa/core/queries/event_queries.dart';
import 'package:waaa/models/ModelProvider.dart';

abstract class EventRemoteDatasource {
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
      safePrint("errors: ${response.errors}");

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
  Future<Event?> createEvent(Event event) async {
    try {
      final request = ModelMutations.create(event);
      final response = await Amplify.API.mutate(request: request).response;

      if (response.data == null) {
        safePrint("errors: ${response.errors}");
        return null;
      }
      return response.data;
    } catch (e) {
      safePrint(e);
      return null;
    }
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
  Future<bool> participateToEvent(EventParticipant participant) async {
    try {
      final request = ModelMutations.create(participant);
      final response = await Amplify.API.mutate(request: request).response;

      if (response.data != null) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      safePrint(e);
      return false;
    }
    /*try {
      const graphQLDocument = addParticipantQuery;
      final request = GraphQLRequest<EventParticipant>(
        document: graphQLDocument,
        modelType: EventParticipant.classType,
        variables: <String, dynamic>{
          'eventParticipantsId': eventId,
          'userEventParticipationId': userId,
          'status': status
        },
        decodePath: "createEventParticipant",
      );
      final response = await Amplify.API.query(request: request).response;
      final event = response.data;

      safePrint("errors: ${response.errors}");

      if (event == null) {
        safePrint("errors: ${response.errors}");
        return false;
      }
      return true;
    } catch (e) {
      safePrint(e);
      return false;
    }*/
  }

  @override
  Future<bool> addCoownerToEvent(EventCoowner coowner) async {
    try {
      final request = ModelMutations.create(coowner);
      final response = await Amplify.API.mutate(request: request).response;

      if (response.data != null) {
        return true;
      } else {
        return false;
      }
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

      safePrint("errors: ${response.errors}");

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

  @override
  Future<List<EventTopic?>> getAllEventTopic() async {
    try {
      final request = ModelQueries.list(EventTopic.classType);
      final response = await Amplify.API.query(request: request).response;
      final eventTopics = response.data?.items;

      if (eventTopics == null) {
        safePrint("errors: ${response.errors}");
        return [];
      }
      return eventTopics;
    } on AuthException catch (e) {
      safePrint(e.message);
      return [];
    }
  }
}
