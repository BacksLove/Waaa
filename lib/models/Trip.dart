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


/** This is an auto generated class representing the Trip type in your schema. */
class Trip extends amplify_core.Model {
  static const classType = const _TripModelType();
  final String id;
  final bool? _visibility;
  final AudienceTrip? _audience;
  final String? _title;
  final String? _about;
  final String? _photo;
  final TripState? _state;
  final Status? _status;
  final amplify_core.TemporalDate? _begin;
  final amplify_core.TemporalDate? _end;
  final String? _reason;
  final int? _duration;
  final bool? _openToJoin;
  final bool? _isOfferTrip;
  final List<Step>? _steps;
  final User? _owner;
  final List<TripParticipant>? _participants;
  final amplify_core.TemporalDateTime? _createdAt;
  final amplify_core.TemporalDateTime? _updatedAt;

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
  
  bool? get visibility {
    return _visibility;
  }
  
  AudienceTrip? get audience {
    return _audience;
  }
  
  String get title {
    try {
      return _title!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String? get about {
    return _about;
  }
  
  String? get photo {
    return _photo;
  }
  
  TripState? get state {
    return _state;
  }
  
  Status? get status {
    return _status;
  }
  
  amplify_core.TemporalDate? get begin {
    return _begin;
  }
  
  amplify_core.TemporalDate? get end {
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
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  List<TripParticipant>? get participants {
    return _participants;
  }
  
  amplify_core.TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  amplify_core.TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  const Trip._internal({required this.id, visibility, audience, required title, about, photo, state, status, begin, end, reason, duration, openToJoin, isOfferTrip, steps, required owner, participants, createdAt, updatedAt}): _visibility = visibility, _audience = audience, _title = title, _about = about, _photo = photo, _state = state, _status = status, _begin = begin, _end = end, _reason = reason, _duration = duration, _openToJoin = openToJoin, _isOfferTrip = isOfferTrip, _steps = steps, _owner = owner, _participants = participants, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory Trip({String? id, bool? visibility, AudienceTrip? audience, required String title, String? about, String? photo, TripState? state, Status? status, amplify_core.TemporalDate? begin, amplify_core.TemporalDate? end, String? reason, int? duration, bool? openToJoin, bool? isOfferTrip, List<Step>? steps, required User owner, List<TripParticipant>? participants, amplify_core.TemporalDateTime? createdAt}) {
    return Trip._internal(
      id: id == null ? amplify_core.UUID.getUUID() : id,
      visibility: visibility,
      audience: audience,
      title: title,
      about: about,
      photo: photo,
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
      createdAt: createdAt);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Trip &&
      id == other.id &&
      _visibility == other._visibility &&
      _audience == other._audience &&
      _title == other._title &&
      _about == other._about &&
      _photo == other._photo &&
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
      _createdAt == other._createdAt;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("Trip {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("visibility=" + (_visibility != null ? _visibility!.toString() : "null") + ", ");
    buffer.write("audience=" + (_audience != null ? amplify_core.enumToString(_audience)! : "null") + ", ");
    buffer.write("title=" + "$_title" + ", ");
    buffer.write("about=" + "$_about" + ", ");
    buffer.write("photo=" + "$_photo" + ", ");
    buffer.write("state=" + (_state != null ? amplify_core.enumToString(_state)! : "null") + ", ");
    buffer.write("status=" + (_status != null ? amplify_core.enumToString(_status)! : "null") + ", ");
    buffer.write("begin=" + (_begin != null ? _begin!.format() : "null") + ", ");
    buffer.write("end=" + (_end != null ? _end!.format() : "null") + ", ");
    buffer.write("reason=" + "$_reason" + ", ");
    buffer.write("duration=" + (_duration != null ? _duration!.toString() : "null") + ", ");
    buffer.write("openToJoin=" + (_openToJoin != null ? _openToJoin!.toString() : "null") + ", ");
    buffer.write("isOfferTrip=" + (_isOfferTrip != null ? _isOfferTrip!.toString() : "null") + ", ");
    buffer.write("owner=" + (_owner != null ? _owner!.toString() : "null") + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  Trip copyWith({bool? visibility, AudienceTrip? audience, String? title, String? about, String? photo, TripState? state, Status? status, amplify_core.TemporalDate? begin, amplify_core.TemporalDate? end, String? reason, int? duration, bool? openToJoin, bool? isOfferTrip, List<Step>? steps, User? owner, List<TripParticipant>? participants, amplify_core.TemporalDateTime? createdAt}) {
    return Trip._internal(
      id: id,
      visibility: visibility ?? this.visibility,
      audience: audience ?? this.audience,
      title: title ?? this.title,
      about: about ?? this.about,
      photo: photo ?? this.photo,
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
      createdAt: createdAt ?? this.createdAt);
  }
  
  Trip copyWithModelFieldValues({
    ModelFieldValue<bool?>? visibility,
    ModelFieldValue<AudienceTrip?>? audience,
    ModelFieldValue<String>? title,
    ModelFieldValue<String?>? about,
    ModelFieldValue<String?>? photo,
    ModelFieldValue<TripState?>? state,
    ModelFieldValue<Status?>? status,
    ModelFieldValue<amplify_core.TemporalDate?>? begin,
    ModelFieldValue<amplify_core.TemporalDate?>? end,
    ModelFieldValue<String?>? reason,
    ModelFieldValue<int?>? duration,
    ModelFieldValue<bool?>? openToJoin,
    ModelFieldValue<bool?>? isOfferTrip,
    ModelFieldValue<List<Step>?>? steps,
    ModelFieldValue<User>? owner,
    ModelFieldValue<List<TripParticipant>?>? participants,
    ModelFieldValue<amplify_core.TemporalDateTime?>? createdAt
  }) {
    return Trip._internal(
      id: id,
      visibility: visibility == null ? this.visibility : visibility.value,
      audience: audience == null ? this.audience : audience.value,
      title: title == null ? this.title : title.value,
      about: about == null ? this.about : about.value,
      photo: photo == null ? this.photo : photo.value,
      state: state == null ? this.state : state.value,
      status: status == null ? this.status : status.value,
      begin: begin == null ? this.begin : begin.value,
      end: end == null ? this.end : end.value,
      reason: reason == null ? this.reason : reason.value,
      duration: duration == null ? this.duration : duration.value,
      openToJoin: openToJoin == null ? this.openToJoin : openToJoin.value,
      isOfferTrip: isOfferTrip == null ? this.isOfferTrip : isOfferTrip.value,
      steps: steps == null ? this.steps : steps.value,
      owner: owner == null ? this.owner : owner.value,
      participants: participants == null ? this.participants : participants.value,
      createdAt: createdAt == null ? this.createdAt : createdAt.value
    );
  }
  
  Trip.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _visibility = json['visibility'],
      _audience = amplify_core.enumFromString<AudienceTrip>(json['audience'], AudienceTrip.values),
      _title = json['title'],
      _about = json['about'],
      _photo = json['photo'],
      _state = amplify_core.enumFromString<TripState>(json['state'], TripState.values),
      _status = amplify_core.enumFromString<Status>(json['status'], Status.values),
      _begin = json['begin'] != null ? amplify_core.TemporalDate.fromString(json['begin']) : null,
      _end = json['end'] != null ? amplify_core.TemporalDate.fromString(json['end']) : null,
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
      _createdAt = json['createdAt'] != null ? amplify_core.TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? amplify_core.TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'visibility': _visibility, 'audience': amplify_core.enumToString(_audience), 'title': _title, 'about': _about, 'photo': _photo, 'state': amplify_core.enumToString(_state), 'status': amplify_core.enumToString(_status), 'begin': _begin?.format(), 'end': _end?.format(), 'reason': _reason, 'duration': _duration, 'openToJoin': _openToJoin, 'isOfferTrip': _isOfferTrip, 'steps': _steps?.map((Step? e) => e?.toJson()).toList(), 'owner': _owner?.toJson(), 'participants': _participants?.map((TripParticipant? e) => e?.toJson()).toList(), 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };
  
  Map<String, Object?> toMap() => {
    'id': id,
    'visibility': _visibility,
    'audience': _audience,
    'title': _title,
    'about': _about,
    'photo': _photo,
    'state': _state,
    'status': _status,
    'begin': _begin,
    'end': _end,
    'reason': _reason,
    'duration': _duration,
    'openToJoin': _openToJoin,
    'isOfferTrip': _isOfferTrip,
    'steps': _steps,
    'owner': _owner,
    'participants': _participants,
    'createdAt': _createdAt,
    'updatedAt': _updatedAt
  };

  static final amplify_core.QueryModelIdentifier<TripModelIdentifier> MODEL_IDENTIFIER = amplify_core.QueryModelIdentifier<TripModelIdentifier>();
  static final ID = amplify_core.QueryField(fieldName: "id");
  static final VISIBILITY = amplify_core.QueryField(fieldName: "visibility");
  static final AUDIENCE = amplify_core.QueryField(fieldName: "audience");
  static final TITLE = amplify_core.QueryField(fieldName: "title");
  static final ABOUT = amplify_core.QueryField(fieldName: "about");
  static final PHOTO = amplify_core.QueryField(fieldName: "photo");
  static final STATE = amplify_core.QueryField(fieldName: "state");
  static final STATUS = amplify_core.QueryField(fieldName: "status");
  static final BEGIN = amplify_core.QueryField(fieldName: "begin");
  static final END = amplify_core.QueryField(fieldName: "end");
  static final REASON = amplify_core.QueryField(fieldName: "reason");
  static final DURATION = amplify_core.QueryField(fieldName: "duration");
  static final OPENTOJOIN = amplify_core.QueryField(fieldName: "openToJoin");
  static final ISOFFERTRIP = amplify_core.QueryField(fieldName: "isOfferTrip");
  static final STEPS = amplify_core.QueryField(
    fieldName: "steps",
    fieldType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.model, ofModelName: 'Step'));
  static final OWNER = amplify_core.QueryField(
    fieldName: "owner",
    fieldType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.model, ofModelName: 'User'));
  static final PARTICIPANTS = amplify_core.QueryField(
    fieldName: "participants",
    fieldType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.model, ofModelName: 'TripParticipant'));
  static final CREATEDAT = amplify_core.QueryField(fieldName: "createdAt");
  static var schema = amplify_core.Model.defineSchema(define: (amplify_core.ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "Trip";
    modelSchemaDefinition.pluralName = "Trips";
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.id());
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Trip.VISIBILITY,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.bool)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Trip.AUDIENCE,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.enumeration)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Trip.TITLE,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Trip.ABOUT,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Trip.PHOTO,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Trip.STATE,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.enumeration)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Trip.STATUS,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.enumeration)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Trip.BEGIN,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.date)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Trip.END,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.date)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Trip.REASON,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Trip.DURATION,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Trip.OPENTOJOIN,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.bool)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Trip.ISOFFERTRIP,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.bool)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.hasMany(
      key: Trip.STEPS,
      isRequired: false,
      ofModelName: 'Step',
      associatedKey: Step.TRIP
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.belongsTo(
      key: Trip.OWNER,
      isRequired: true,
      targetNames: ['ownerId'],
      ofModelName: 'User'
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.hasMany(
      key: Trip.PARTICIPANTS,
      isRequired: false,
      ofModelName: 'TripParticipant',
      associatedKey: TripParticipant.TRIP
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Trip.CREATEDAT,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.dateTime)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.nonQueryField(
      fieldName: 'updatedAt',
      isRequired: false,
      isReadOnly: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.dateTime)
    ));
  });
}

class _TripModelType extends amplify_core.ModelType<Trip> {
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
class TripModelIdentifier implements amplify_core.ModelIdentifier<Trip> {
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