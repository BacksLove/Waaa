import 'package:waaa/models/Event.dart';
import 'package:waaa/models/EventTopic.dart';

import '../../../../core/platform/network_info.dart';
import '../../domain/repositories/event_repository.dart';
import '../data_sources/event_remote_datasource.dart';

class EventRepositoryImpl implements EventRepository {
  final EventRemoteDatasource remoteDataSource;
  final NetworkInfo networkInfo;

  EventRepositoryImpl(this.networkInfo, this.remoteDataSource);

  @override
  Future<bool> createEvent(Event event) {
    throw UnimplementedError();
  }

  @override
  Future<bool> deleteEvent(String id) {
    throw UnimplementedError();
  }

  @override
  Future<List<Event?>> getEventsByUserId(String id) async {
    await networkInfo.isConnected;
    final remoteEventByUser = await remoteDataSource.getEventsByUserId(id);

    return remoteEventByUser;
  }

  @override
  Future<List<Event?>> getWaaEvents() async {
    await networkInfo.isConnected;
    final remoteEventsWaaa = await remoteDataSource.getWaaEvents();

    return remoteEventsWaaa;
  }

  @override
  Future<bool> updateEvent(Event event) {
    throw UnimplementedError();
  }

  @override
  Future<Event?> getEventById(String id) async {
    await networkInfo.isConnected;
    final remoteEventById = await remoteDataSource.getEventById(id);

    return remoteEventById;
  }

  @override
  Future<List<EventTopic?>> getAllEventTopic() async {
    await networkInfo.isConnected;
    final remoteAllEventTopic = await remoteDataSource.getAllEventTopic();

    return remoteAllEventTopic;
  }
}
