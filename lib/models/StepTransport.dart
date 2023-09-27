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


/** This is an auto generated class representing the StepTransport type in your schema. */
class StepTransport extends amplify_core.Model {
  static const classType = const _StepTransportModelType();
  final String id;
  final Step? _step;
  final Transport? _transport;
  final amplify_core.TemporalDateTime? _createdAt;
  final amplify_core.TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;
  
  @Deprecated('[getId] is being deprecated in favor of custom primary key feature. Use getter [modelIdentifier] to get model identifier.')
  @override
  String getId() => id;
  
  StepTransportModelIdentifier get modelIdentifier {
      return StepTransportModelIdentifier(
        id: id
      );
  }
  
  Step get step {
    try {
      return _step!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  Transport get transport {
    try {
      return _transport!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  amplify_core.TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  amplify_core.TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  const StepTransport._internal({required this.id, required step, required transport, createdAt, updatedAt}): _step = step, _transport = transport, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory StepTransport({String? id, required Step step, required Transport transport}) {
    return StepTransport._internal(
      id: id == null ? amplify_core.UUID.getUUID() : id,
      step: step,
      transport: transport);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is StepTransport &&
      id == other.id &&
      _step == other._step &&
      _transport == other._transport;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("StepTransport {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("step=" + (_step != null ? _step!.toString() : "null") + ", ");
    buffer.write("transport=" + (_transport != null ? _transport!.toString() : "null") + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  StepTransport copyWith({Step? step, Transport? transport}) {
    return StepTransport._internal(
      id: id,
      step: step ?? this.step,
      transport: transport ?? this.transport);
  }
  
  StepTransport copyWithModelFieldValues({
    ModelFieldValue<Step>? step,
    ModelFieldValue<Transport>? transport
  }) {
    return StepTransport._internal(
      id: id,
      step: step == null ? this.step : step.value,
      transport: transport == null ? this.transport : transport.value
    );
  }
  
  StepTransport.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _step = json['step']?['serializedData'] != null
        ? Step.fromJson(new Map<String, dynamic>.from(json['step']['serializedData']))
        : null,
      _transport = json['transport']?['serializedData'] != null
        ? Transport.fromJson(new Map<String, dynamic>.from(json['transport']['serializedData']))
        : null,
      _createdAt = json['createdAt'] != null ? amplify_core.TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? amplify_core.TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'step': _step?.toJson(), 'transport': _transport?.toJson(), 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };
  
  Map<String, Object?> toMap() => {
    'id': id,
    'step': _step,
    'transport': _transport,
    'createdAt': _createdAt,
    'updatedAt': _updatedAt
  };

  static final amplify_core.QueryModelIdentifier<StepTransportModelIdentifier> MODEL_IDENTIFIER = amplify_core.QueryModelIdentifier<StepTransportModelIdentifier>();
  static final ID = amplify_core.QueryField(fieldName: "id");
  static final STEP = amplify_core.QueryField(
    fieldName: "step",
    fieldType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.model, ofModelName: 'Step'));
  static final TRANSPORT = amplify_core.QueryField(
    fieldName: "transport",
    fieldType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.model, ofModelName: 'Transport'));
  static var schema = amplify_core.Model.defineSchema(define: (amplify_core.ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "StepTransport";
    modelSchemaDefinition.pluralName = "StepTransports";
    
    modelSchemaDefinition.indexes = [
      amplify_core.ModelIndex(fields: const ["stepId"], name: "byStep"),
      amplify_core.ModelIndex(fields: const ["transportId"], name: "byTransport")
    ];
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.id());
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.belongsTo(
      key: StepTransport.STEP,
      isRequired: true,
      targetNames: ['stepId'],
      ofModelName: 'Step'
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.belongsTo(
      key: StepTransport.TRANSPORT,
      isRequired: true,
      targetNames: ['transportId'],
      ofModelName: 'Transport'
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

class _StepTransportModelType extends amplify_core.ModelType<StepTransport> {
  const _StepTransportModelType();
  
  @override
  StepTransport fromJson(Map<String, dynamic> jsonData) {
    return StepTransport.fromJson(jsonData);
  }
  
  @override
  String modelName() {
    return 'StepTransport';
  }
}

/**
 * This is an auto generated class representing the model identifier
 * of [StepTransport] in your schema.
 */
class StepTransportModelIdentifier implements amplify_core.ModelIdentifier<StepTransport> {
  final String id;

  /** Create an instance of StepTransportModelIdentifier using [id] the primary key. */
  const StepTransportModelIdentifier({
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
  String toString() => 'StepTransportModelIdentifier(id: $id)';
  
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    
    return other is StepTransportModelIdentifier &&
      id == other.id;
  }
  
  @override
  int get hashCode =>
    id.hashCode;
}