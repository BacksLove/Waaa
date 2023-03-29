import 'package:json_annotation/json_annotation.dart';
import 'package:waaa/features/events/domain/entities/event_topic_entity.dart';

part 'event_topic_model.g.dart';

@JsonSerializable(explicitToJson: true)
class EventTopicModel extends EventTopic {

  const EventTopicModel({required super.id, required super.name});

  factory EventTopicModel.fromJson(Map<String, dynamic> json) => _$EventTopicModelFromJson(json);

  Map<String, dynamic> toJson() => _$EventTopicModelToJson(this);
}