// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'friends_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Friends _$FriendsFromJson(Map<String, dynamic> json) => Friends(
      id: json['id'] as String,
      status: json['status'] as String,
      friend: User.fromJson(json['friend'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$FriendsToJson(Friends instance) => <String, dynamic>{
      'id': instance.id,
      'status': instance.status,
      'friend': instance.friend.toJson(),
    };
