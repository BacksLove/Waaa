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
import 'package:amplify_core/amplify_core.dart';
import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';


/** This is an auto generated class representing the Trip type in your schema. */
@immutable
class Trip extends Model {
  static const classType = const _TripModelType();
  final String id;
  final TripCategory? _category;
  final bool? _visibility;
  final String? _type;
  final String? _title;
  final String? _about;
  final TripState? _state;
  final Status? _status;
  final TemporalDate? _begin;
  final TemporalDate? _end;
  final String? _reason;
  final int? _duration;
  final bool? _openToJoin;
  final bool? _isOfferTrip;
  final List<Step>? _steps;
  final User? _owner;
  final List<TripParticipant>? _participants;
  final TemporalDateTime? _createdAt;
  final TemporalDateTime? _updatedAt;
  final String? _tripCategoryId;
  final String? _tripCategoryTripsId;

  @override
  getInstanceType() => classType;
  
  @Deprecated('[getId] is being deprecated in favor of custom primary key feature. Use getter [modelIdentifier] to get model identifier.')
  @override
  String getId() => id;
  
  TripModelIdentifier get modelIdentifier {
      return TripModelIdentifier(
        id: id
      );
  }
  
  TripCategory? get category {
    return _category;
  }
  
  bool? get visibility {
    return _visibility;
  }
  
  String? get type {
    return _type;
  }
  
  String get title {
    try {
      return _title!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String? get about {
    return _about;
  }
  
  TripState? get state {
    return _state;
  }
  
  Status? get status {
    return _status;
  }
  
  TemporalDate? get begin {
    return _begin;
  }
  
  TemporalDate? get end {
    return _end;
  }
  
  String? get reason {
    return _reason;
  }
  
  int? get duration {
    return _duration;
  }
  
  bool? get openToJoin {
    return _openToJoin;
  }
  
  bool? get isOfferTrip {
    return _isOfferTrip;
  }
  
  List<Step>? get steps {
    return _steps;
  }
  
  User get owner {
    try {
      return _owner!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  List<TripParticipant>? get participants {
    return _participants;
  }
  
  TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  String? get tripCategoryId {
    return _tripCategoryId;
  }
  
  String? get tripCategoryTripsId {
    return _tripCategoryTripsId;
  }
  
  const Trip._internal({required this.id, category, visibility, type, required title, about, state, status, begin, end, reason, duration, openToJoin, isOfferTrip, steps, required owner, participants, createdAt, updatedAt, tripCategoryId, tripCategoryTripsId}): _category = category, _visibility = visibility, _type = type, _title = title, _about = about, _state = state, _status = status, _begin = begin, _end = end, _reason = reason, _duration = duration, _openToJoin = openToJoin, _isOfferTrip = isOfferTrip, _steps = steps, _owner = owner, _participants = participants, _createdAt = createdAt, _updatedAt = updatedAt, _tripCategoryId = tripCategoryId, _tripCategoryTripsId = tripCategoryTripsId;
  
  factory Trip({String? id, TripCategory? category, bool? visibility, String? type, required String title, String? about, TripState? state, Status? status, TemporalDate? begin, TemporalDate? end, String? reason, int? duration, bool? openToJoin, bool? isOfferTrip, List<Step>? steps, required User owner, List<TripParticipant>? participants, TemporalDateTime? createdAt, String? tripCategoryId, String? tripCategoryTripsId}) {
    return Trip._internal(
      id: id == null ? UUID.getUUID() : id,
      category: category,
      visibility: visibility,
      type: type,
      title: title,
      about: about,
      state: state,
      status: status,
      begin: begin,
      end: end,
      reason: reason,
      duration: duration,
      openToJoin: openToJoin,
      isOfferTrip: isOfferTrip,
      steps: steps != null ? List<Step>.unmodifiable(steps) : steps,
      owner: owner,
      participants: participants != null ? List<TripParticipant>.unmodifiable(participants) : participants,
      createdAt: createdAt,
      tripCategoryId: tripCategoryId,
      tripCategoryTripsId: tripCategoryTripsId);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Trip &&
      id == other.id &&
      _category == other._category &&
      _visibility == other._visibility &&
      _type == other._type &&
      _title == other._title &&
      _about == other._about &&
      _state == other._state &&
      _status == other._status &&
      _begin == other._begin &&
      _end == other._end &&
      _reason == other._reason &&
      _duration == other._duration &&
      _openToJoin == other._openToJoin &&
      _isOfferTrip == other._isOfferTrip &&
      DeepCollectionEquality().equals(_steps, other._steps) &&
      _owner == other._owner &&
      DeepCollectionEquality().equals(_participants, other._participants) &&
      _createdAt == other._createdAt &&
      _tripCategoryId == other._tripCategoryId &&
      _tripCategoryTripsId == other._tripCategoryTripsId;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("Trip {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("visibility=" + (_visibility != null ? _visibility!.toString() : "null") + ", ");
    buffer.write("type=" + "$_type" + ", ");
    buffer.write("title=" + "$_title" + ", ");
    buffer.write("about=" + "$_about" + ", ");
    buffer.write("state=" + (_state != null ? enumToString(_state)! : "null") + ", ");
    buffer.write("status=" + (_status != null ? enumToString(_status)! : "null") + ", ");
    buffer.write("begin=" + (_begin != null ? _begin!.format() : "null") + ", ");
    buffer.write("end=" + (_end != null ? _end!.format() : "null") + ", ");
    buffer.write("reason=" + "$_reason" + ", ");
    buffer.write("duration=" + (_duration != null ? _duration!.toString() : "null") + ", ");
    buffer.write("openToJoin=" + (_openToJoin != null ? _openToJoin!.toString() : "null") + ", ");
    buffer.write("isOfferTrip=" + (_isOfferTrip != null ? _isOfferTrip!.toString() : "null") + ", ");
    buffer.write("owner=" + (_owner != null ? _owner!.toString() : "null") + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null") + ", ");
    buffer.write("tripCategoryId=" + "$_tripCategoryId" + ", ");
    buffer.write("tripCategoryTripsId=" + "$_tripCategoryTripsId");
    buffer.write("}");
    
    return buffer.toString();
  }
  
  Trip copyWith({TripCategory? category, bool? visibility, String? type, String? title, String? about, TripState? state, Status? status, TemporalDate? begin, TemporalDate? end, String? reason, int? duration, bool? openToJoin, bool? isOfferTrip, List<Step>? steps, User? owner, List<TripParticipant>? participants, TemporalDateTime? createdAt, String? tripCategoryId, String? tripCategoryTripsId}) {
    return Trip._internal(
      id: id,
      category: category ?? this.category,
      visibility: visibility ?? this.visibility,
      type: type ?? this.type,
      title: title ?? this.title,
      about: about ?? this.about,
      state: state ?? this.state,
      status: status ?? this.status,
      begin: begin ?? this.begin,
      end: end ?? this.end,
      reason: reason ?? this.reason,
      duration: duration ?? this.duration,
      openToJoin: openToJoin ?? this.openToJoin,
      isOfferTrip: isOfferTrip ?? this.isOfferTrip,
      steps: steps ?? this.steps,
      owner: owner ?? this.owner,
      participants: participants ?? this.participants,
      createdAt: createdAt ?? this.createdAt,
      tripCategoryId: tripCategoryId ?? this.tripCategoryId,
      tripCategoryTripsId: tripCategoryTripsId ?? this.tripCategoryTripsId);
  }
  
  Trip.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _category = json['category']?['serializedData'] != null
        ? TripCategory.fromJson(new Map<String, dynamic>.from(json['category']['serializedData']))
        : null,
      _visibility = json['visibility'],
      _type = json['type'],
      _title = json['title'],
      _about = json['about'],
      _state = enumFromString<TripState>(json['state'], TripState.values),
      _status = enumFromString<Status>(json['status'], Status.values),
      _begin = json['begin'] != null ? TemporalDate.fromString(json['begin']) : null,
      _end = json['end'] != null ? TemporalDate.fromString(json['end']) : null,
      _reason = json['reason'],
      _duration = (json['duration'] as num?)?.toInt(),
      _openToJoin = json['openToJoin'],
      _isOfferTrip = json['isOfferTrip'],
      _steps = json['steps'] is List
        ? (json['steps'] as List)
          .where((e) => e?['serializedData'] != null)
          .map((e) => Step.fromJson(new Map<String, dynamic>.from(e['serializedData'])))
          .toList()
        : null,
      _owner = json['owner']?['serializedData'] != null
        ? User.fromJson(new Map<String, dynamic>.from(json['owner']['serializedData']))
        : null,
      _participants = json['participants'] is List
        ? (json['participants'] as List)
          .where((e) => e?['serializedData'] != null)
          .map((e) => TripParticipant.fromJson(new Map<String, dynamic>.from(e['serializedData'])))
          .toList()
        : null,
      _createdAt = json['createdAt'] != null ? TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? TemporalDateTime.fromString(json['updatedAt']) : null,
      _tripCategoryId = json['tripCategoryId'],
      _tripCategoryTripsId = json['tripCategoryTripsId'];
  
  Map<String, dynamic> toJson() => {
    'id': id, 'category': _category?.toJson(), 'visibility': _visibility, 'type': _type, 'title': _title, 'about': _about, 'state': enumToString(_state), 'status': enumToString(_status), 'begin': _begin?.format(), 'end': _end?.format(), 'reason': _reason, 'duration': _duration, 'openToJoin': _openToJoin, 'isOfferTrip': _isOfferTrip, 'steps': _steps?.map((Step? e) => e?.toJson()).toList(), 'owner': _owner?.toJson(), 'participants': _participants?.map((TripParticipant? e) => e?.toJson()).toList(), 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format(), 'tripCategoryId': _tripCategoryId, 'tripCategoryTripsId': _tripCategoryTripsId
  };
  
  Map<String, Object?> toMap() => {
    'id': id, 'category': _category, 'visibility': _visibility, 'type': _type, 'title': _title, 'about': _about, 'state': _state, 'status': _status, 'begin': _begin, 'end': _end, 'reason': _reason, 'duration': _duration, 'openToJoin': _openToJoin, 'isOfferTrip': _isOfferTrip, 'steps': _steps, 'owner': _owner, 'participants': _participants, 'createdAt': _createdAt, 'updatedAt': _updatedAt, 'tripCategoryId': _tripCategoryId, 'tripCategoryTripsId': _tripCategoryTripsId
  };

  static final QueryModelIdentifier<TripModelIdentifier> MODEL_IDENTIFIER = QueryModelIdentifier<TripModelIdentifier>();
  static final QueryField ID = QueryField(fieldName: "id");
  static final QueryField CATEGORY = QueryField(
    fieldName: "category",
    fieldType: ModelFieldType(ModelFieldTypeEnum.model, ofModelName: 'TripCategory'));
  static final QueryField VISIBILITY = QueryField(fieldName: "visibility");
  static final QueryField TYPE = QueryField(fieldName: "type");
  static final QueryField TITLE = QueryField(fieldName: "title");
  static final QueryField ABOUT = QueryField(fieldName: "about");
  static final QueryField STATE = QueryField(fieldName: "state");
  static final QueryField STATUS = QueryField(fieldName: "status");
  static final QueryField BEGIN = QueryField(fieldName: "begin");
  static final QueryField END = QueryField(fieldName: "end");
  static final QueryField REASON = QueryField(fieldName: "reason");
  static final QueryField DURATION = QueryField(fieldName: "duration");
  static final QueryField OPENTOJOIN = QueryField(fieldName: "openToJoin");
  static final QueryField ISOFFERTRIP = QueryField(fieldName: "isOfferTrip");
  static final QueryField STEPS = QueryField(
    fieldName: "steps",
    fieldType: ModelFieldType(ModelFieldTypeEnum.model, ofModelName: 'Step'));
  static final QueryField OWNER = QueryField(
    fieldName: "owner",
    fieldType: ModelFieldType(ModelFieldTypeEnum.model, ofModelName: 'User'));
  static final QueryField PARTICIPANTS = QueryField(
    fieldName: "participants",
    fieldType: ModelFieldType(ModelFieldTypeEnum.model, ofModelName: 'TripParticipant'));
  static final QueryField CREATEDAT = QueryField(fieldName: "createdAt");
  static final QueryField TRIPCATEGORYID = QueryField(fieldName: "tripCategoryId");
  static final QueryField TRIPCATEGORYTRIPSID = QueryField(fieldName: "tripCategoryTripsId");
  static var schema = Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "Trip";
    modelSchemaDefinition.pluralName = "Trips";
    
    modelSchemaDefinition.addField(ModelFieldDefinition.id());
    
    modelSchemaDefinition.addField(ModelFieldDefinition.hasOne(
      key: Trip.CATEGORY,
      isRequired: false,
      ofModelName: 'TripCategory',
      associatedKey: TripCategory.ID
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Trip.VISIBILITY,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.bool)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Trip.TYPE,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Trip.TITLE,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Trip.ABOUT,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Trip.STATE,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.enumeration)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Trip.STATUS,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.enumeration)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Trip.BEGIN,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.date)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Trip.END,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.date)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Trip.REASON,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Trip.DURATION,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Trip.OPENTOJOIN,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.bool)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Trip.ISOFFERTRIP,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.bool)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.hasMany(
      key: Trip.STEPS,
      isRequired: false,
      ofModelName: 'Step',
      associatedKey: Step.TRIP
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.belongsTo(
      key: Trip.OWNER,
      isRequired: true,
      targetNames: ['ownerId'],
      ofModelName: 'User'
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.hasMany(
      key: Trip.PARTICIPANTS,
      isRequired: false,
      ofModelName: 'TripParticipant',
      associatedKey: TripParticipant.TRIP
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Trip.CREATEDAT,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.dateTime)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.nonQueryField(
      fieldName: 'updatedAt',
      isRequired: false,
      isReadOnly: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.dateTime)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Trip.TRIPCATEGORYID,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Trip.TRIPCATEGORYTRIPSID,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
  });
}

class _TripModelType extends ModelType<Trip> {
  const _TripModelType();
  
  @override
  Trip fromJson(Map<String, dynamic> jsonData) {
    return Trip.fromJson(jsonData);
  }
  
  @override
  String modelName() {
    return 'Trip';
  }
}

/**
 * This is an auto generated class representing the model identifier
 * of [Trip] in your schema.
 */
@immutable
class TripModelIdentifier implements ModelIdentifier<Trip> {
  final String id;

  /** Create an instance of TripModelIdentifier using [id] the primary key. */
  const TripModelIdentifier({
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
  String toString() => 'TripModelIdentifier(id: $id)';
  
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    
    return other is TripModelIdentifier &&
      id == other.id;
  }
  
  @override
  int get hashCode =>
    id.hashCode;
}