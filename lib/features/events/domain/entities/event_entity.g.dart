// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Event _$EventFromJson(Map<String, dynamic> json) => Event(
      id: json['id'] as String?,
      name: json['name'] as String,
      description: json['description'] as String?,
      participants: (json['participants'] as List<dynamic>?)
          ?.map((e) => User.fromJson(e as Map<String, dynamic>))
          .toList(),
      address: json['address'] as String,
      country: json['country'] as String,
      city: json['city'] as String,
      begin: DateTime.parse(json['begin'] as String),
      end: DateTime.parse(json['end'] as String),
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      hourBegin: json['hourBegin'] as int,
      hourEnd: json['hourEnd'] as int?,
      maxParticipants: json['maxParticipants'] as int,
      minParticipants: json['minParticipants'] as int,
      isPublic: json['isPublic'] as bool,
      mainPhoto: json['mainPhoto'] as String,
      minAgeRestriction: json['minAgeRestriction'] as int?,
      language: json['language'] as String?,
      photos:
          (json['photos'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$EventToJson(Event instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'participants': instance.participants?.map((e) => e.toJson()).toList(),
      'address': instance.address,
      'country': instance.country,
      'city': instance.city,
      'begin': instance.begin.toIso8601String(),
      'end': instance.end.toIso8601String(),
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'hourBegin': instance.hourBegin,
      'hourEnd': instance.hourEnd,
      'maxParticipants': instance.maxParticipants,
      'minParticipants': instance.minParticipants,
      'isPublic': instance.isPublic,
      'mainPhoto': instance.mainPhoto,
      'minAgeRestriction': instance.minAgeRestriction,
      'language': instance.language,
      'photos': instance.photos,
    };
