// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      id: json['id'] as String?,
      role: json['role'] as String?,
      gender: $enumDecodeNullable(_$GenderEnumMap, json['gender']),
      lookingFor: $enumDecodeNullable(_$GenderEnumMap, json['lookingFor']),
      birthday: json['birthday'] == null
          ? null
          : DateTime.parse(json['birthday'] as String),
      username: json['username'] as String,
      bio: json['bio'] as String?,
      nativeLanguage: json['nativeLanguage'] as String?,
      languagesSpeak: (json['languagesSpeak'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      hobbies: (json['hobbies']['items'] as List<dynamic>?)
          ?.map((e) => Hobby.fromJson(e as Map<String, dynamic>))
          .toList(),
      events: (json['events']['items'] as List<dynamic>?)
          ?.map((e) => Event.fromJson(e as Map<String, dynamic>))
          .toList(),
      suspendedUntil: json['suspendedUntil'] == null
          ? null
          : DateTime.parse(json['suspendedUntil'] as String),
      reporting: json['reporting'] as int?,
      openDiscussion: json['openDiscussion'] as bool?,
      privacy: json['privacy'] as bool?,
      photo: json['photo'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'role': instance.role,
      'gender': _$GenderEnumMap[instance.gender],
      'lookingFor': _$GenderEnumMap[instance.lookingFor],
      'birthday': instance.birthday?.toIso8601String(),
      'username': instance.username,
      'bio': instance.bio,
      'nativeLanguage': instance.nativeLanguage,
      'languagesSpeak': instance.languagesSpeak,
      'hobbies': instance.hobbies?.map((e) => e.toJson()).toList(),
      'events': instance.events?.map((e) => e.toJson()).toList(),
      'suspendedUntil': instance.suspendedUntil?.toIso8601String(),
      'reporting': instance.reporting,
      'openDiscussion': instance.openDiscussion,
      'privacy': instance.privacy,
      'photo': instance.photo,
      'createdAt': instance.createdAt?.toIso8601String(),
    };

const _$GenderEnumMap = {
  Gender.MALE: 'MALE',
  Gender.FEMALE: 'FEMALE',
  Gender.OTHER: 'OTHER',
};
