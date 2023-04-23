import 'package:waaa/features/events/domain/entities/event_topic_entity.dart';

abstract class EventTopicRemoteDatasource {
  Future<EventTopic> getAllEventTopic();
  Future<EventTopic> getEventTopicById(String id);
}

class EventTopicRemoteDatasourceImpl implements EventTopicRemoteDatasource {
  @override
  Future<EventTopic> getAllEventTopic() {
    //
    throw UnimplementedError();
  }

  @override
  Future<EventTopic> getEventTopicById(String id) {
    throw UnimplementedError();
  }
}
