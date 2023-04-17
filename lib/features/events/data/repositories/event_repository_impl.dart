import 'package:waaa/features/events/domain/entities/event_entity.dart';

import '../../../../core/platform/network_info.dart';
import '../../domain/repositories/event_repository.dart';
import '../data_sources/event_remote_datasource.dart';

class EventRepositoryImpl implements EventRepository {
  final EventRemoteDatasource remoteDataSource;
  final NetworkInfo networkInfo;

  EventRepositoryImpl(this.networkInfo, this.remoteDataSource);

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
  Future<List<Event>> getEventsByUserId(String id) async {
    await networkInfo.isConnected;
    final remoteEventByUser = await remoteDataSource.getEventsByUserId(id);

    return remoteEventByUser;
  }

  @override
  Future<List<Event>> getWaaEvents() async {
    await networkInfo.isConnected;
    final remoteEventsWaaa = await remoteDataSource.getWaaEvents();

    return remoteEventsWaaa;
  }

  @override
  Future<bool> updateEvent(Event event) {
    // TODO: implement updateEvent
    throw UnimplementedError();
  }
}
