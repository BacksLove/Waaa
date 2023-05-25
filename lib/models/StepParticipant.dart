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
import 'package:flutter/foundation.dart';


/** This is an auto generated class representing the StepParticipant type in your schema. */
@immutable
class StepParticipant extends Model {
  static const classType = const _StepParticipantModelType();
  final String id;
  final Step? _step;
  final User? _user;
  final DemandStatus? _status;
  final TemporalDateTime? _createdAt;
  final TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;
  
  @Deprecated('[getId] is being deprecated in favor of custom primary key feature. Use getter [modelIdentifier] to get model identifier.')
  @override
  String getId() => id;
  
  StepParticipantModelIdentifier get modelIdentifier {
      return StepParticipantModelIdentifier(
        id: id
      );
  }
  
  Step get step {
    try {
      return _step!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  User get user {
    try {
      return _user!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  DemandStatus get status {
    try {
      return _status!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  const StepParticipant._internal({required this.id, required step, required user, required status, createdAt, updatedAt}): _step = step, _user = user, _status = status, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory StepParticipant({String? id, required Step step, required User user, required DemandStatus status}) {
    return StepParticipant._internal(
      id: id == null ? UUID.getUUID() : id,
      step: step,
      user: user,
      status: status);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is StepParticipant &&
      id == other.id &&
      _step == other._step &&
      _user == other._user &&
      _status == other._status;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("StepParticipant {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("step=" + (_step != null ? _step!.toString() : "null") + ", ");
    buffer.write("user=" + (_user != null ? _user!.toString() : "null") + ", ");
    buffer.write("status=" + (_status != null ? enumToString(_status)! : "null") + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  StepParticipant copyWith({Step? step, User? user, DemandStatus? status}) {
    return StepParticipant._internal(
      id: id,
      step: step ?? this.step,
      user: user ?? this.user,
      status: status ?? this.status);
  }
  
  StepParticipant.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _step = json['step']?['serializedData'] != null
        ? Step.fromJson(new Map<String, dynamic>.from(json['step']['serializedData']))
        : null,
      _user = json['user']?['serializedData'] != null
        ? User.fromJson(new Map<String, dynamic>.from(json['user']['serializedData']))
        : null,
      _status = enumFromString<DemandStatus>(json['status'], DemandStatus.values),
      _createdAt = json['createdAt'] != null ? TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'step': _step?.toJson(), 'user': _user?.toJson(), 'status': enumToString(_status), 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };
  
  Map<String, Object?> toMap() => {
    'id': id, 'step': _step, 'user': _user, 'status': _status, 'createdAt': _createdAt, 'updatedAt': _updatedAt
  };

  static final QueryModelIdentifier<StepParticipantModelIdentifier> MODEL_IDENTIFIER = QueryModelIdentifier<StepParticipantModelIdentifier>();
  static final QueryField ID = QueryField(fieldName: "id");
  static final QueryField STEP = QueryField(
    fieldName: "step",
    fieldType: ModelFieldType(ModelFieldTypeEnum.model, ofModelName: 'Step'));
  static final QueryField USER = QueryField(
    fieldName: "user",
    fieldType: ModelFieldType(ModelFieldTypeEnum.model, ofModelName: 'User'));
  static final QueryField STATUS = QueryField(fieldName: "status");
  static var schema = Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "StepParticipant";
    modelSchemaDefinition.pluralName = "StepParticipants";
    
    modelSchemaDefinition.addField(ModelFieldDefinition.id());
    
    modelSchemaDefinition.addField(ModelFieldDefinition.belongsTo(
      key: StepParticipant.STEP,
      isRequired: true,
      targetNames: ['stepParticipantsId'],
      ofModelName: 'Step'
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.belongsTo(
      key: StepParticipant.USER,
      isRequired: true,
      targetNames: ['userStepParticipationId'],
      ofModelName: 'User'
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: StepParticipant.STATUS,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.enumeration)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.nonQueryField(
      fieldName: 'createdAt',
      isRequired: false,
      isReadOnly: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.dateTime)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.nonQueryField(
      fieldName: 'updatedAt',
      isRequired: false,
      isReadOnly: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.dateTime)
    ));
  });
}

class _StepParticipantModelType extends ModelType<StepParticipant> {
  const _StepParticipantModelType();
  
  @override
  StepParticipant fromJson(Map<String, dynamic> jsonData) {
    return StepParticipant.fromJson(jsonData);
  }
  
  @override
  String modelName() {
    return 'StepParticipant';
  }
}

/**
 * This is an auto generated class representing the model identifier
 * of [StepParticipant] in your schema.
 */
@immutable
class StepParticipantModelIdentifier implements ModelIdentifier<StepParticipant> {
  final String id;

  /** Create an instance of StepParticipantModelIdentifier using [id] the primary key. */
  const StepParticipantModelIdentifier({
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
  String toString() => 'StepParticipantModelIdentifier(id: $id)';
  
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    
    return other is StepParticipantModelIdentifier &&
      id == other.id;
  }
  
  @override
  int get hashCode =>
    id.hashCode;
}