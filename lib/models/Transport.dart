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


/** This is an auto generated class representing the Transport type in your schema. */
class Transport extends amplify_core.Model {
  static const classType = const _TransportModelType();
  final String id;
  final String? _label;
  final List<StepTransport>? _steps;
  final amplify_core.TemporalDateTime? _createdAt;
  final amplify_core.TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;
  
  @Deprecated('[getId] is being deprecated in favor of custom primary key feature. Use getter [modelIdentifier] to get model identifier.')
  @override
  String getId() => id;
  
  TransportModelIdentifier get modelIdentifier {
      return TransportModelIdentifier(
        id: id
      );
  }
  
  String get label {
    try {
      return _label!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  List<StepTransport>? get steps {
    return _steps;
  }
  
  amplify_core.TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  amplify_core.TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  const Transport._internal({required this.id, required label, steps, createdAt, updatedAt}): _label = label, _steps = steps, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory Transport({String? id, required String label, List<StepTransport>? steps}) {
    return Transport._internal(
      id: id == null ? amplify_core.UUID.getUUID() : id,
      label: label,
      steps: steps != null ? List<StepTransport>.unmodifiable(steps) : steps);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Transport &&
      id == other.id &&
      _label == other._label &&
      DeepCollectionEquality().equals(_steps, other._steps);
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("Transport {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("label=" + "$_label" + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  Transport copyWith({String? label, List<StepTransport>? steps}) {
    return Transport._internal(
      id: id,
      label: label ?? this.label,
      steps: steps ?? this.steps);
  }
  
  Transport copyWithModelFieldValues({
    ModelFieldValue<String>? label,
    ModelFieldValue<List<StepTransport>?>? steps
  }) {
    return Transport._internal(
      id: id,
      label: label == null ? this.label : label.value,
      steps: steps == null ? this.steps : steps.value
    );
  }
  
  Transport.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _label = json['label'],
      _steps = json['steps'] is List
        ? (json['steps'] as List)
          .where((e) => e?['serializedData'] != null)
          .map((e) => StepTransport.fromJson(new Map<String, dynamic>.from(e['serializedData'])))
          .toList()
        : null,
      _createdAt = json['createdAt'] != null ? amplify_core.TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? amplify_core.TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'label': _label, 'steps': _steps?.map((StepTransport? e) => e?.toJson()).toList(), 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };
  
  Map<String, Object?> toMap() => {
    'id': id,
    'label': _label,
    'steps': _steps,
    'createdAt': _createdAt,
    'updatedAt': _updatedAt
  };

  static final amplify_core.QueryModelIdentifier<TransportModelIdentifier> MODEL_IDENTIFIER = amplify_core.QueryModelIdentifier<TransportModelIdentifier>();
  static final ID = amplify_core.QueryField(fieldName: "id");
  static final LABEL = amplify_core.QueryField(fieldName: "label");
  static final STEPS = amplify_core.QueryField(
    fieldName: "steps",
    fieldType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.model, ofModelName: 'StepTransport'));
  static var schema = amplify_core.Model.defineSchema(define: (amplify_core.ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "Transport";
    modelSchemaDefinition.pluralName = "Transports";
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.id());
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Transport.LABEL,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.hasMany(
      key: Transport.STEPS,
      isRequired: false,
      ofModelName: 'StepTransport',
      associatedKey: StepTransport.TRANSPORT
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

class _TransportModelType extends amplify_core.ModelType<Transport> {
  const _TransportModelType();
  
  @override
  Transport fromJson(Map<String, dynamic> jsonData) {
    return Transport.fromJson(jsonData);
  }
  
  @override
  String modelName() {
    return 'Transport';
  }
}

/**
 * This is an auto generated class representing the model identifier
 * of [Transport] in your schema.
 */
class TransportModelIdentifier implements amplify_core.ModelIdentifier<Transport> {
  final String id;

  /** Create an instance of TransportModelIdentifier using [id] the primary key. */
  const TransportModelIdentifier({
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
  String toString() => 'TransportModelIdentifier(id: $id)';
  
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    
    return other is TransportModelIdentifier &&
      id == other.id;
  }
  
  @override
  int get hashCode =>
    id.hashCode;
}