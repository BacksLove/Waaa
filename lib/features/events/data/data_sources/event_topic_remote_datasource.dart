import '../models/event_topic_model.dart';

abstract class EventTopicRemoteDatasource {
  Future<EventTopicModel> getAllEventTopic();
  Future<EventTopicModel> getEventTopicById(String id);
}

class EventTopicRemoteDatasourceImpl implements EventTopicRemoteDatasource {
  @override
  Future<EventTopicModel> getAllEventTopic() {
    // TODO: implement getAllEventTopic
    throw UnimplementedError();
  }

  @override
  Future<EventTopicModel> getEventTopicById(String id) {
    // TODO: implement getEventTopicById
    throw UnimplementedError();
  }

}