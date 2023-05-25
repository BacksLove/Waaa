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


/** This is an auto generated class representing the Friendship type in your schema. */
@immutable
class Friendship extends Model {
  static const classType = const _FriendshipModelType();
  final String id;
  final DemandStatus? _status;
  final User? _sender;
  final User? _receiver;
  final TemporalDateTime? _createdAt;
  final TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;
  
  @Deprecated('[getId] is being deprecated in favor of custom primary key feature. Use getter [modelIdentifier] to get model identifier.')
  @override
  String getId() => id;
  
  FriendshipModelIdentifier get modelIdentifier {
      return FriendshipModelIdentifier(
        id: id
      );
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
  
  User get sender {
    try {
      return _sender!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  User get receiver {
    try {
      return _receiver!;
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
  
  const Friendship._internal({required this.id, required status, required sender, required receiver, createdAt, updatedAt}): _status = status, _sender = sender, _receiver = receiver, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory Friendship({String? id, required DemandStatus status, required User sender, required User receiver}) {
    return Friendship._internal(
      id: id == null ? UUID.getUUID() : id,
      status: status,
      sender: sender,
      receiver: receiver);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Friendship &&
      id == other.id &&
      _status == other._status &&
      _sender == other._sender &&
      _receiver == other._receiver;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("Friendship {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("status=" + (_status != null ? enumToString(_status)! : "null") + ", ");
    buffer.write("sender=" + (_sender != null ? _sender!.toString() : "null") + ", ");
    buffer.write("receiver=" + (_receiver != null ? _receiver!.toString() : "null") + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  Friendship copyWith({DemandStatus? status, User? sender, User? receiver}) {
    return Friendship._internal(
      id: id,
      status: status ?? this.status,
      sender: sender ?? this.sender,
      receiver: receiver ?? this.receiver);
  }
  
  Friendship.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _status = enumFromString<DemandStatus>(json['status'], DemandStatus.values),
      _sender = json['sender']?['serializedData'] != null
        ? User.fromJson(new Map<String, dynamic>.from(json['sender']['serializedData']))
        : null,
      _receiver = json['receiver']?['serializedData'] != null
        ? User.fromJson(new Map<String, dynamic>.from(json['receiver']['serializedData']))
        : null,
      _createdAt = json['createdAt'] != null ? TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'status': enumToString(_status), 'sender': _sender?.toJson(), 'receiver': _receiver?.toJson(), 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };
  
  Map<String, Object?> toMap() => {
    'id': id, 'status': _status, 'sender': _sender, 'receiver': _receiver, 'createdAt': _createdAt, 'updatedAt': _updatedAt
  };

  static final QueryModelIdentifier<FriendshipModelIdentifier> MODEL_IDENTIFIER = QueryModelIdentifier<FriendshipModelIdentifier>();
  static final QueryField ID = QueryField(fieldName: "id");
  static final QueryField STATUS = QueryField(fieldName: "status");
  static final QueryField SENDER = QueryField(
    fieldName: "sender",
    fieldType: ModelFieldType(ModelFieldTypeEnum.model, ofModelName: 'User'));
  static final QueryField RECEIVER = QueryField(
    fieldName: "receiver",
    fieldType: ModelFieldType(ModelFieldTypeEnum.model, ofModelName: 'User'));
  static var schema = Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "Friendship";
    modelSchemaDefinition.pluralName = "Friendships";
    
    modelSchemaDefinition.indexes = [
      ModelIndex(fields: const ["senderID"], name: "byFriendSender"),
      ModelIndex(fields: const ["receiverID"], name: "byFriendReceiver")
    ];
    
    modelSchemaDefinition.addField(ModelFieldDefinition.id());
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Friendship.STATUS,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.enumeration)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.belongsTo(
      key: Friendship.SENDER,
      isRequired: true,
      targetNames: ['senderID'],
      ofModelName: 'User'
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.belongsTo(
      key: Friendship.RECEIVER,
      isRequired: true,
      targetNames: ['receiverID'],
      ofModelName: 'User'
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

class _FriendshipModelType extends ModelType<Friendship> {
  const _FriendshipModelType();
  
  @override
  Friendship fromJson(Map<String, dynamic> jsonData) {
    return Friendship.fromJson(jsonData);
  }
  
  @override
  String modelName() {
    return 'Friendship';
  }
}

/**
 * This is an auto generated class representing the model identifier
 * of [Friendship] in your schema.
 */
@immutable
class FriendshipModelIdentifier implements ModelIdentifier<Friendship> {
  final String id;

  /** Create an instance of FriendshipModelIdentifier using [id] the primary key. */
  const FriendshipModelIdentifier({
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
  String toString() => 'FriendshipModelIdentifier(id: $id)';
  
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    
    return other is FriendshipModelIdentifier &&
      id == other.id;
  }
  
  @override
  int get hashCode =>
    id.hashCode;
}