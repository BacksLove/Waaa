/*
* Copyright 2021 Amazon.com, Inc. or its affiliates. All Rights Reserved.
*
* Licensed under the Apache License, Version 2.0 (the "License").
* You may not use this file except in compliance with the License.
* A copy of the License is located at
*
*  http://aws.amazon.com/apache2.0
*
* or in the "license" file accompanying this file. This file is distributed
* on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
* express or implied. See the License for the specific language governing
* permissions and limitations under the License.
*/

// NOTE: This file is generated and may not follow lint rules defined in your app
// Generated files can be excluded from analysis in analysis_options.yaml
// For more info, see: https://dart.dev/guides/language/analysis-options#excluding-code-from-analysis

// ignore_for_file: public_member_api_docs, annotate_overrides, dead_code, dead_codepublic_member_api_docs, depend_on_referenced_packages, file_names, library_private_types_in_public_api, no_leading_underscores_for_library_prefixes, no_leading_underscores_for_local_identifiers, non_constant_identifier_names, null_check_on_nullable_type_parameter, prefer_adjacent_string_concatenation, prefer_const_constructors, prefer_if_null_operators, prefer_interpolation_to_compose_strings, slash_for_doc_comments, sort_child_properties_last, unnecessary_const, unnecessary_constructor_name, unnecessary_late, unnecessary_new, unnecessary_null_aware_assignments, unnecessary_nullable_for_final_variable_declarations, unnecessary_string_interpolations, use_build_context_synchronously

import 'ModelProvider.dart';
import 'package:amplify_core/amplify_core.dart' as amplify_core;
import 'package:collection/collection.dart';


/** This is an auto generated class representing the Event type in your schema. */
class Event extends amplify_core.Model {
  static const classType = const _EventModelType();
  final String id;
  final String? _name;
  final EventTopic? _topic;
  final String? _description;
  final String? _country;
  final String? _city;
  final String? _address;
  final amplify_core.TemporalDate? _begin;
  final amplify_core.TemporalDate? _end;
  final String? _mainPhoto;
  final List<String>? _photos;
  final int? _hourBegin;
  final int? _hourEnd;
  final User? _owner;
  final List<EventCoowner>? _coowner;
  final int? _maxParticipants;
  final int? _minAgeRestriction;
  final bool? _isPublic;
  final bool? _canInviteParticipant;
  final int? _nbShare;
  final Audience? _audience;
  final List<EventParticipant>? _participants;
  final amplify_core.TemporalDateTime? _createdAt;
  final amplify_core.TemporalDateTime? _updatedAt;
  final String? _eventTopicId;
  final String? _eventTopicEventsId;

  @override
  getInstanceType() => classType;
  
  @Deprecated('[getId] is being deprecated in favor of custom primary key feature. Use getter [modelIdentifier] to get model identifier.')
  @override
  String getId() => id;
  
  EventModelIdentifier get modelIdentifier {
      return EventModelIdentifier(
        id: id
      );
  }
  
  String get name {
    try {
      return _name!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  EventTopic get topic {
    try {
      return _topic!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String get description {
    try {
      return _description!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String? get country {
    return _country;
  }
  
  String? get city {
    return _city;
  }
  
  String? get address {
    return _address;
  }
  
  amplify_core.TemporalDate? get begin {
    return _begin;
  }
  
  amplify_core.TemporalDate? get end {
    return _end;
  }
  
  String? get mainPhoto {
    return _mainPhoto;
  }
  
  List<String>? get photos {
    return _photos;
  }
  
  int? get hourBegin {
    return _hourBegin;
  }
  
  int? get hourEnd {
    return _hourEnd;
  }
  
  User? get owner {
    return _owner;
  }
  
  List<EventCoowner>? get coowner {
    return _coowner;
  }
  
  int? get maxParticipants {
    return _maxParticipants;
  }
  
  int? get minAgeRestriction {
    return _minAgeRestriction;
  }
  
  bool? get isPublic {
    return _isPublic;
  }
  
  bool? get canInviteParticipant {
    return _canInviteParticipant;
  }
  
  int? get nbShare {
    return _nbShare;
  }
  
  Audience? get audience {
    return _audience;
  }
  
  List<EventParticipant>? get participants {
    return _participants;
  }
  
  amplify_core.TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  amplify_core.TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  String get eventTopicId {
    try {
      return _eventTopicId!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String? get eventTopicEventsId {
    return _eventTopicEventsId;
  }
  
  const Event._internal({required this.id, required name, required topic, required description, country, city, address, begin, end, mainPhoto, photos, hourBegin, hourEnd, owner, coowner, maxParticipants, minAgeRestriction, isPublic, canInviteParticipant, nbShare, audience, participants, createdAt, updatedAt, required eventTopicId, eventTopicEventsId}): _name = name, _topic = topic, _description = description, _country = country, _city = city, _address = address, _begin = begin, _end = end, _mainPhoto = mainPhoto, _photos = photos, _hourBegin = hourBegin, _hourEnd = hourEnd, _owner = owner, _coowner = coowner, _maxParticipants = maxParticipants, _minAgeRestriction = minAgeRestriction, _isPublic = isPublic, _canInviteParticipant = canInviteParticipant, _nbShare = nbShare, _audience = audience, _participants = participants, _createdAt = createdAt, _updatedAt = updatedAt, _eventTopicId = eventTopicId, _eventTopicEventsId = eventTopicEventsId;
  
  factory Event({String? id, required String name, required EventTopic topic, required String description, String? country, String? city, String? address, amplify_core.TemporalDate? begin, amplify_core.TemporalDate? end, String? mainPhoto, List<String>? photos, int? hourBegin, int? hourEnd, User? owner, List<EventCoowner>? coowner, int? maxParticipants, int? minAgeRestriction, bool? isPublic, bool? canInviteParticipant, int? nbShare, Audience? audience, List<EventParticipant>? participants, amplify_core.TemporalDateTime? createdAt, required String eventTopicId, String? eventTopicEventsId}) {
    return Event._internal(
      id: id == null ? amplify_core.UUID.getUUID() : id,
      name: name,
      topic: topic,
      description: description,
      country: country,
      city: city,
      address: address,
      begin: begin,
      end: end,
      mainPhoto: mainPhoto,
      photos: photos != null ? List<String>.unmodifiable(photos) : photos,
      hourBegin: hourBegin,
      hourEnd: hourEnd,
      owner: owner,
      coowner: coowner != null ? List<EventCoowner>.unmodifiable(coowner) : coowner,
      maxParticipants: maxParticipants,
      minAgeRestriction: minAgeRestriction,
      isPublic: isPublic,
      canInviteParticipant: canInviteParticipant,
      nbShare: nbShare,
      audience: audience,
      participants: participants != null ? List<EventParticipant>.unmodifiable(participants) : participants,
      createdAt: createdAt,
      eventTopicId: eventTopicId,
      eventTopicEventsId: eventTopicEventsId);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Event &&
      id == other.id &&
      _name == other._name &&
      _topic == other._topic &&
      _description == other._description &&
      _country == other._country &&
      _city == other._city &&
      _address == other._address &&
      _begin == other._begin &&
      _end == other._end &&
      _mainPhoto == other._mainPhoto &&
      DeepCollectionEquality().equals(_photos, other._photos) &&
      _hourBegin == other._hourBegin &&
      _hourEnd == other._hourEnd &&
      _owner == other._owner &&
      DeepCollectionEquality().equals(_coowner, other._coowner) &&
      _maxParticipants == other._maxParticipants &&
      _minAgeRestriction == other._minAgeRestriction &&
      _isPublic == other._isPublic &&
      _canInviteParticipant == other._canInviteParticipant &&
      _nbShare == other._nbShare &&
      _audience == other._audience &&
      DeepCollectionEquality().equals(_participants, other._participants) &&
      _createdAt == other._createdAt &&
      _eventTopicId == other._eventTopicId &&
      _eventTopicEventsId == other._eventTopicEventsId;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("Event {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("name=" + "$_name" + ", ");
    buffer.write("description=" + "$_description" + ", ");
    buffer.write("country=" + "$_country" + ", ");
    buffer.write("city=" + "$_city" + ", ");
    buffer.write("address=" + "$_address" + ", ");
    buffer.write("begin=" + (_begin != null ? _begin!.format() : "null") + ", ");
    buffer.write("end=" + (_end != null ? _end!.format() : "null") + ", ");
    buffer.write("mainPhoto=" + "$_mainPhoto" + ", ");
    buffer.write("photos=" + (_photos != null ? _photos!.toString() : "null") + ", ");
    buffer.write("hourBegin=" + (_hourBegin != null ? _hourBegin!.toString() : "null") + ", ");
    buffer.write("hourEnd=" + (_hourEnd != null ? _hourEnd!.toString() : "null") + ", ");
    buffer.write("owner=" + (_owner != null ? _owner!.toString() : "null") + ", ");
    buffer.write("maxParticipants=" + (_maxParticipants != null ? _maxParticipants!.toString() : "null") + ", ");
    buffer.write("minAgeRestriction=" + (_minAgeRestriction != null ? _minAgeRestriction!.toString() : "null") + ", ");
    buffer.write("isPublic=" + (_isPublic != null ? _isPublic!.toString() : "null") + ", ");
    buffer.write("canInviteParticipant=" + (_canInviteParticipant != null ? _canInviteParticipant!.toString() : "null") + ", ");
    buffer.write("nbShare=" + (_nbShare != null ? _nbShare!.toString() : "null") + ", ");
    buffer.write("audience=" + (_audience != null ? amplify_core.enumToString(_audience)! : "null") + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null") + ", ");
    buffer.write("eventTopicId=" + "$_eventTopicId" + ", ");
    buffer.write("eventTopicEventsId=" + "$_eventTopicEventsId");
    buffer.write("}");
    
    return buffer.toString();
  }
  
  Event copyWith({String? name, EventTopic? topic, String? description, String? country, String? city, String? address, amplify_core.TemporalDate? begin, amplify_core.TemporalDate? end, String? mainPhoto, List<String>? photos, int? hourBegin, int? hourEnd, User? owner, List<EventCoowner>? coowner, int? maxParticipants, int? minAgeRestriction, bool? isPublic, bool? canInviteParticipant, int? nbShare, Audience? audience, List<EventParticipant>? participants, amplify_core.TemporalDateTime? createdAt, String? eventTopicId, String? eventTopicEventsId}) {
    return Event._internal(
      id: id,
      name: name ?? this.name,
      topic: topic ?? this.topic,
      description: description ?? this.description,
      country: country ?? this.country,
      city: city ?? this.city,
      address: address ?? this.address,
      begin: begin ?? this.begin,
      end: end ?? this.end,
      mainPhoto: mainPhoto ?? this.mainPhoto,
      photos: photos ?? this.photos,
      hourBegin: hourBegin ?? this.hourBegin,
      hourEnd: hourEnd ?? this.hourEnd,
      owner: owner ?? this.owner,
      coowner: coowner ?? this.coowner,
      maxParticipants: maxParticipants ?? this.maxParticipants,
      minAgeRestriction: minAgeRestriction ?? this.minAgeRestriction,
      isPublic: isPublic ?? this.isPublic,
      canInviteParticipant: canInviteParticipant ?? this.canInviteParticipant,
      nbShare: nbShare ?? this.nbShare,
      audience: audience ?? this.audience,
      participants: participants ?? this.participants,
      createdAt: createdAt ?? this.createdAt,
      eventTopicId: eventTopicId ?? this.eventTopicId,
      eventTopicEventsId: eventTopicEventsId ?? this.eventTopicEventsId);
  }
  
  Event copyWithModelFieldValues({
    ModelFieldValue<String>? name,
    ModelFieldValue<EventTopic>? topic,
    ModelFieldValue<String>? description,
    ModelFieldValue<String?>? country,
    ModelFieldValue<String?>? city,
    ModelFieldValue<String?>? address,
    ModelFieldValue<amplify_core.TemporalDate?>? begin,
    ModelFieldValue<amplify_core.TemporalDate?>? end,
    ModelFieldValue<String?>? mainPhoto,
    ModelFieldValue<List<String>?>? photos,
    ModelFieldValue<int?>? hourBegin,
    ModelFieldValue<int?>? hourEnd,
    ModelFieldValue<User?>? owner,
    ModelFieldValue<List<EventCoowner>?>? coowner,
    ModelFieldValue<int?>? maxParticipants,
    ModelFieldValue<int?>? minAgeRestriction,
    ModelFieldValue<bool?>? isPublic,
    ModelFieldValue<bool?>? canInviteParticipant,
    ModelFieldValue<int?>? nbShare,
    ModelFieldValue<Audience?>? audience,
    ModelFieldValue<List<EventParticipant>?>? participants,
    ModelFieldValue<amplify_core.TemporalDateTime?>? createdAt,
    ModelFieldValue<String>? eventTopicId,
    ModelFieldValue<String?>? eventTopicEventsId
  }) {
    return Event._internal(
      id: id,
      name: name == null ? this.name : name.value,
      topic: topic == null ? this.topic : topic.value,
      description: description == null ? this.description : description.value,
      country: country == null ? this.country : country.value,
      city: city == null ? this.city : city.value,
      address: address == null ? this.address : address.value,
      begin: begin == null ? this.begin : begin.value,
      end: end == null ? this.end : end.value,
      mainPhoto: mainPhoto == null ? this.mainPhoto : mainPhoto.value,
      photos: photos == null ? this.photos : photos.value,
      hourBegin: hourBegin == null ? this.hourBegin : hourBegin.value,
      hourEnd: hourEnd == null ? this.hourEnd : hourEnd.value,
      owner: owner == null ? this.owner : owner.value,
      coowner: coowner == null ? this.coowner : coowner.value,
      maxParticipants: maxParticipants == null ? this.maxParticipants : maxParticipants.value,
      minAgeRestriction: minAgeRestriction == null ? this.minAgeRestriction : minAgeRestriction.value,
      isPublic: isPublic == null ? this.isPublic : isPublic.value,
      canInviteParticipant: canInviteParticipant == null ? this.canInviteParticipant : canInviteParticipant.value,
      nbShare: nbShare == null ? this.nbShare : nbShare.value,
      audience: audience == null ? this.audience : audience.value,
      participants: participants == null ? this.participants : participants.value,
      createdAt: createdAt == null ? this.createdAt : createdAt.value,
      eventTopicId: eventTopicId == null ? this.eventTopicId : eventTopicId.value,
      eventTopicEventsId: eventTopicEventsId == null ? this.eventTopicEventsId : eventTopicEventsId.value
    );
  }
  
  Event.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _name = json['name'],
      _topic = json['topic']?['serializedData'] != null
        ? EventTopic.fromJson(new Map<String, dynamic>.from(json['topic']['serializedData']))
        : null,
      _description = json['description'],
      _country = json['country'],
      _city = json['city'],
      _address = json['address'],
      _begin = json['begin'] != null ? amplify_core.TemporalDate.fromString(json['begin']) : null,
      _end = json['end'] != null ? amplify_core.TemporalDate.fromString(json['end']) : null,
      _mainPhoto = json['mainPhoto'],
      _photos = json['photos']?.cast<String>(),
      _hourBegin = (json['hourBegin'] as num?)?.toInt(),
      _hourEnd = (json['hourEnd'] as num?)?.toInt(),
      _owner = json['owner']?['serializedData'] != null
        ? User.fromJson(new Map<String, dynamic>.from(json['owner']['serializedData']))
        : null,
      _coowner = json['coowner'] is List
        ? (json['coowner'] as List)
          .where((e) => e?['serializedData'] != null)
          .map((e) => EventCoowner.fromJson(new Map<String, dynamic>.from(e['serializedData'])))
          .toList()
        : null,
      _maxParticipants = (json['maxParticipants'] as num?)?.toInt(),
      _minAgeRestriction = (json['minAgeRestriction'] as num?)?.toInt(),
      _isPublic = json['isPublic'],
      _canInviteParticipant = json['canInviteParticipant'],
      _nbShare = (json['nbShare'] as num?)?.toInt(),
      _audience = amplify_core.enumFromString<Audience>(json['audience'], Audience.values),
      _participants = json['participants'] is List
        ? (json['participants'] as List)
          .where((e) => e?['serializedData'] != null)
          .map((e) => EventParticipant.fromJson(new Map<String, dynamic>.from(e['serializedData'])))
          .toList()
        : null,
      _createdAt = json['createdAt'] != null ? amplify_core.TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? amplify_core.TemporalDateTime.fromString(json['updatedAt']) : null,
      _eventTopicId = json['eventTopicId'],
      _eventTopicEventsId = json['eventTopicEventsId'];
  
  Map<String, dynamic> toJson() => {
    'id': id, 'name': _name, 'topic': _topic?.toJson(), 'description': _description, 'country': _country, 'city': _city, 'address': _address, 'begin': _begin?.format(), 'end': _end?.format(), 'mainPhoto': _mainPhoto, 'photos': _photos, 'hourBegin': _hourBegin, 'hourEnd': _hourEnd, 'owner': _owner?.toJson(), 'coowner': _coowner?.map((EventCoowner? e) => e?.toJson()).toList(), 'maxParticipants': _maxParticipants, 'minAgeRestriction': _minAgeRestriction, 'isPublic': _isPublic, 'canInviteParticipant': _canInviteParticipant, 'nbShare': _nbShare, 'audience': amplify_core.enumToString(_audience), 'participants': _participants?.map((EventParticipant? e) => e?.toJson()).toList(), 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format(), 'eventTopicId': _eventTopicId, 'eventTopicEventsId': _eventTopicEventsId
  };
  
  Map<String, Object?> toMap() => {
    'id': id,
    'name': _name,
    'topic': _topic,
    'description': _description,
    'country': _country,
    'city': _city,
    'address': _address,
    'begin': _begin,
    'end': _end,
    'mainPhoto': _mainPhoto,
    'photos': _photos,
    'hourBegin': _hourBegin,
    'hourEnd': _hourEnd,
    'owner': _owner,
    'coowner': _coowner,
    'maxParticipants': _maxParticipants,
    'minAgeRestriction': _minAgeRestriction,
    'isPublic': _isPublic,
    'canInviteParticipant': _canInviteParticipant,
    'nbShare': _nbShare,
    'audience': _audience,
    'participants': _participants,
    'createdAt': _createdAt,
    'updatedAt': _updatedAt,
    'eventTopicId': _eventTopicId,
    'eventTopicEventsId': _eventTopicEventsId
  };

  static final amplify_core.QueryModelIdentifier<EventModelIdentifier> MODEL_IDENTIFIER = amplify_core.QueryModelIdentifier<EventModelIdentifier>();
  static final ID = amplify_core.QueryField(fieldName: "id");
  static final NAME = amplify_core.QueryField(fieldName: "name");
  static final TOPIC = amplify_core.QueryField(
    fieldName: "topic",
    fieldType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.model, ofModelName: 'EventTopic'));
  static final DESCRIPTION = amplify_core.QueryField(fieldName: "description");
  static final COUNTRY = amplify_core.QueryField(fieldName: "country");
  static final CITY = amplify_core.QueryField(fieldName: "city");
  static final ADDRESS = amplify_core.QueryField(fieldName: "address");
  static final BEGIN = amplify_core.QueryField(fieldName: "begin");
  static final END = amplify_core.QueryField(fieldName: "end");
  static final MAINPHOTO = amplify_core.QueryField(fieldName: "mainPhoto");
  static final PHOTOS = amplify_core.QueryField(fieldName: "photos");
  static final HOURBEGIN = amplify_core.QueryField(fieldName: "hourBegin");
  static final HOUREND = amplify_core.QueryField(fieldName: "hourEnd");
  static final OWNER = amplify_core.QueryField(
    fieldName: "owner",
    fieldType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.model, ofModelName: 'User'));
  static final COOWNER = amplify_core.QueryField(
    fieldName: "coowner",
    fieldType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.model, ofModelName: 'EventCoowner'));
  static final MAXPARTICIPANTS = amplify_core.QueryField(fieldName: "maxParticipants");
  static final MINAGERESTRICTION = amplify_core.QueryField(fieldName: "minAgeRestriction");
  static final ISPUBLIC = amplify_core.QueryField(fieldName: "isPublic");
  static final CANINVITEPARTICIPANT = amplify_core.QueryField(fieldName: "canInviteParticipant");
  static final NBSHARE = amplify_core.QueryField(fieldName: "nbShare");
  static final AUDIENCE = amplify_core.QueryField(fieldName: "audience");
  static final PARTICIPANTS = amplify_core.QueryField(
    fieldName: "participants",
    fieldType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.model, ofModelName: 'EventParticipant'));
  static final CREATEDAT = amplify_core.QueryField(fieldName: "createdAt");
  static final EVENTTOPICID = amplify_core.QueryField(fieldName: "eventTopicId");
  static final EVENTTOPICEVENTSID = amplify_core.QueryField(fieldName: "eventTopicEventsId");
  static var schema = amplify_core.Model.defineSchema(define: (amplify_core.ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "Event";
    modelSchemaDefinition.pluralName = "Events";
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.id());
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Event.NAME,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.hasOne(
      key: Event.TOPIC,
      isRequired: true,
      ofModelName: 'EventTopic',
      associatedKey: EventTopic.ID
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Event.DESCRIPTION,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Event.COUNTRY,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Event.CITY,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Event.ADDRESS,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Event.BEGIN,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.date)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Event.END,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.date)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Event.MAINPHOTO,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Event.PHOTOS,
      isRequired: false,
      isArray: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.collection, ofModelName: amplify_core.ModelFieldTypeEnum.string.name)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Event.HOURBEGIN,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Event.HOUREND,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.belongsTo(
      key: Event.OWNER,
      isRequired: false,
      targetNames: ['userEventsId'],
      ofModelName: 'User'
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.hasMany(
      key: Event.COOWNER,
      isRequired: false,
      ofModelName: 'EventCoowner',
      associatedKey: EventCoowner.EVENT
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Event.MAXPARTICIPANTS,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Event.MINAGERESTRICTION,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Event.ISPUBLIC,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.bool)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Event.CANINVITEPARTICIPANT,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.bool)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Event.NBSHARE,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Event.AUDIENCE,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.enumeration)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.hasMany(
      key: Event.PARTICIPANTS,
      isRequired: false,
      ofModelName: 'EventParticipant',
      associatedKey: EventParticipant.EVENT
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Event.CREATEDAT,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.dateTime)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.nonQueryField(
      fieldName: 'updatedAt',
      isRequired: false,
      isReadOnly: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.dateTime)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Event.EVENTTOPICID,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Event.EVENTTOPICEVENTSID,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
  });
}

class _EventModelType extends amplify_core.ModelType<Event> {
  const _EventModelType();
  
  @override
  Event fromJson(Map<String, dynamic> jsonData) {
    return Event.fromJson(jsonData);
  }
  
  @override
  String modelName() {
    return 'Event';
  }
}

/**
 * This is an auto generated class representing the model identifier
 * of [Event] in your schema.
 */
class EventModelIdentifier implements amplify_core.ModelIdentifier<Event> {
  final String id;

  /** Create an instance of EventModelIdentifier using [id] the primary key. */
  const EventModelIdentifier({
    required this.id});
  
  @override
  Map<String, dynamic> serializeAsMap() => (<String, dynamic>{
    'id': id
  });
  
  @override
  List<Map<String, dynamic>> serializeAsList() => serializeAsMap()
    .entries
    .map((entry) => (<String, dynamic>{ entry.key: entry.value }))
    .toList();
  
  @override
  String serializeAsString() => serializeAsMap().values.join('#');
  
  @override
  String toString() => 'EventModelIdentifier(id: $id)';
  
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    
    return other is EventModelIdentifier &&
      id == other.id;
  }
  
  @override
  int get hashCode =>
    id.hashCode;
}