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


/** This is an auto generated class representing the EventParticipant type in your schema. */
class EventParticipant extends amplify_core.Model {
  static const classType = const _EventParticipantModelType();
  final String id;
  final Event? _event;
  final User? _user;
  final DemandStatus? _status;
  final bool? _notified;
  final amplify_core.TemporalDateTime? _createdAt;
  final amplify_core.TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;
  
  @Deprecated('[getId] is being deprecated in favor of custom primary key feature. Use getter [modelIdentifier] to get model identifier.')
  @override
  String getId() => id;
  
  EventParticipantModelIdentifier get modelIdentifier {
      return EventParticipantModelIdentifier(
        id: id
      );
  }
  
  Event get event {
    try {
      return _event!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  User get user {
    try {
      return _user!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  DemandStatus get status {
    try {
      return _status!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  bool? get notified {
    return _notified;
  }
  
  amplify_core.TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  amplify_core.TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  const EventParticipant._internal({required this.id, required event, required user, required status, notified, createdAt, updatedAt}): _event = event, _user = user, _status = status, _notified = notified, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory EventParticipant({String? id, required Event event, required User user, required DemandStatus status, bool? notified}) {
    return EventParticipant._internal(
      id: id == null ? amplify_core.UUID.getUUID() : id,
      event: event,
      user: user,
      status: status,
      notified: notified);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is EventParticipant &&
      id == other.id &&
      _event == other._event &&
      _user == other._user &&
      _status == other._status &&
      _notified == other._notified;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("EventParticipant {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("event=" + (_event != null ? _event!.toString() : "null") + ", ");
    buffer.write("user=" + (_user != null ? _user!.toString() : "null") + ", ");
    buffer.write("status=" + (_status != null ? amplify_core.enumToString(_status)! : "null") + ", ");
    buffer.write("notified=" + (_notified != null ? _notified!.toString() : "null") + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  EventParticipant copyWith({Event? event, User? user, DemandStatus? status, bool? notified}) {
    return EventParticipant._internal(
      id: id,
      event: event ?? this.event,
      user: user ?? this.user,
      status: status ?? this.status,
      notified: notified ?? this.notified);
  }
  
  EventParticipant copyWithModelFieldValues({
    ModelFieldValue<Event>? event,
    ModelFieldValue<User>? user,
    ModelFieldValue<DemandStatus>? status,
    ModelFieldValue<bool?>? notified
  }) {
    return EventParticipant._internal(
      id: id,
      event: event == null ? this.event : event.value,
      user: user == null ? this.user : user.value,
      status: status == null ? this.status : status.value,
      notified: notified == null ? this.notified : notified.value
    );
  }
  
  EventParticipant.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _event = json['event']?['serializedData'] != null
        ? Event.fromJson(new Map<String, dynamic>.from(json['event']['serializedData']))
        : null,
      _user = json['user']?['serializedData'] != null
        ? User.fromJson(new Map<String, dynamic>.from(json['user']['serializedData']))
        : null,
      _status = amplify_core.enumFromString<DemandStatus>(json['status'], DemandStatus.values),
      _notified = json['notified'],
      _createdAt = json['createdAt'] != null ? amplify_core.TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? amplify_core.TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'event': _event?.toJson(), 'user': _user?.toJson(), 'status': amplify_core.enumToString(_status), 'notified': _notified, 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };
  
  Map<String, Object?> toMap() => {
    'id': id,
    'event': _event,
    'user': _user,
    'status': _status,
    'notified': _notified,
    'createdAt': _createdAt,
    'updatedAt': _updatedAt
  };

  static final amplify_core.QueryModelIdentifier<EventParticipantModelIdentifier> MODEL_IDENTIFIER = amplify_core.QueryModelIdentifier<EventParticipantModelIdentifier>();
  static final ID = amplify_core.QueryField(fieldName: "id");
  static final EVENT = amplify_core.QueryField(
    fieldName: "event",
    fieldType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.model, ofModelName: 'Event'));
  static final USER = amplify_core.QueryField(
    fieldName: "user",
    fieldType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.model, ofModelName: 'User'));
  static final STATUS = amplify_core.QueryField(fieldName: "status");
  static final NOTIFIED = amplify_core.QueryField(fieldName: "notified");
  static var schema = amplify_core.Model.defineSchema(define: (amplify_core.ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "EventParticipant";
    modelSchemaDefinition.pluralName = "EventParticipants";
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.id());
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.belongsTo(
      key: EventParticipant.EVENT,
      isRequired: true,
      targetNames: ['eventParticipantsId'],
      ofModelName: 'Event'
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.belongsTo(
      key: EventParticipant.USER,
      isRequired: true,
      targetNames: ['userEventParticipationId'],
      ofModelName: 'User'
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: EventParticipant.STATUS,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.enumeration)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: EventParticipant.NOTIFIED,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.bool)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.nonQueryField(
      fieldName: 'createdAt',
      isRequired: false,
      isReadOnly: true,
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

class _EventParticipantModelType extends amplify_core.ModelType<EventParticipant> {
  const _EventParticipantModelType();
  
  @override
  EventParticipant fromJson(Map<String, dynamic> jsonData) {
    return EventParticipant.fromJson(jsonData);
  }
  
  @override
  String modelName() {
    return 'EventParticipant';
  }
}

/**
 * This is an auto generated class representing the model identifier
 * of [EventParticipant] in your schema.
 */
class EventParticipantModelIdentifier implements amplify_core.ModelIdentifier<EventParticipant> {
  final String id;

  /** Create an instance of EventParticipantModelIdentifier using [id] the primary key. */
  const EventParticipantModelIdentifier({
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
  String toString() => 'EventParticipantModelIdentifier(id: $id)';
  
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    
    return other is EventParticipantModelIdentifier &&
      id == other.id;
  }
  
  @override
  int get hashCode =>
    id.hashCode;
}