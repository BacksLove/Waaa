// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      id: json['id'] as String?,
      cognitoUserPoolId: json['cognitoUserPoolId'] as String?,
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
      hobbies: (json['hobbies'] as List<dynamic>?)
          ?.map((e) => Hobby.fromJson(e as Map<String, dynamic>))
          .toList(),
      events: (json['events'] as List<dynamic>?)
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

Map<String, dynamic> _$UserToJson(User instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('cognitoUserPoolId', instance.cognitoUserPoolId);
  writeNotNull('role', instance.role);
  writeNotNull('gender', _$GenderEnumMap[instance.gender]);
  writeNotNull('lookingFor', _$GenderEnumMap[instance.lookingFor]);
  writeNotNull('birthday', instance.birthday?.toIso8601String());
  val['username'] = instance.username;
  writeNotNull('bio', instance.bio);
  writeNotNull('nativeLanguage', instance.nativeLanguage);
  writeNotNull('languagesSpeak', instance.languagesSpeak);
  writeNotNull('hobbies', instance.hobbies?.map((e) => e.toJson()).toList());
  writeNotNull('events', instance.events?.map((e) => e.toJson()).toList());
  writeNotNull('suspendedUntil', instance.suspendedUntil?.toIso8601String());
  writeNotNull('reporting', instance.reporting);
  writeNotNull('openDiscussion', instance.openDiscussion);
  writeNotNull('privacy', instance.privacy);
  writeNotNull('photo', instance.photo);
  writeNotNull('createdAt', instance.createdAt?.toIso8601String());
  return val;
}

const _$GenderEnumMap = {
  Gender.MALE: 'MALE',
  Gender.FEMALE: 'FEMALE',
  Gender.OTHER: 'OTHER',
};
