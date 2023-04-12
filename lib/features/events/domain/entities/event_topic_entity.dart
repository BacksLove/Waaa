import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'event_topic_entity.g.dart';

@JsonSerializable(explicitToJson: true)
class EventTopic extends Equatable {
  final String id;
  final String name;

  const EventTopic({required this.id, required this.name});

  @override
  List<Object?> get props => [id, name];

  factory EventTopic.fromJson(Map<String, dynamic> json) =>
      _$EventTopicFromJson(json);

  Map<String, dynamic> toJson() => _$EventTopicToJson(this);
}
