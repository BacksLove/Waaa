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


/** This is an auto generated class representing the Conversation type in your schema. */
class Conversation extends amplify_core.Model {
  static const classType = const _ConversationModelType();
  final String id;
  final String? _createdAt;
  final List<Message>? _messages;
  final String? _name;
  final List<UserConversations>? _user;
  final amplify_core.TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;
  
  @Deprecated('[getId] is being deprecated in favor of custom primary key feature. Use getter [modelIdentifier] to get model identifier.')
  @override
  String getId() => id;
  
  ConversationModelIdentifier get modelIdentifier {
      return ConversationModelIdentifier(
        id: id
      );
  }
  
  String? get createdAt {
    return _createdAt;
  }
  
  List<Message>? get messages {
    return _messages;
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
  
  List<UserConversations>? get user {
    return _user;
  }
  
  amplify_core.TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  const Conversation._internal({required this.id, createdAt, messages, required name, user, updatedAt}): _createdAt = createdAt, _messages = messages, _name = name, _user = user, _updatedAt = updatedAt;
  
  factory Conversation({String? id, String? createdAt, List<Message>? messages, required String name, List<UserConversations>? user}) {
    return Conversation._internal(
      id: id == null ? amplify_core.UUID.getUUID() : id,
      createdAt: createdAt,
      messages: messages != null ? List<Message>.unmodifiable(messages) : messages,
      name: name,
      user: user != null ? List<UserConversations>.unmodifiable(user) : user);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Conversation &&
      id == other.id &&
      _createdAt == other._createdAt &&
      DeepCollectionEquality().equals(_messages, other._messages) &&
      _name == other._name &&
      DeepCollectionEquality().equals(_user, other._user);
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("Conversation {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("createdAt=" + "$_createdAt" + ", ");
    buffer.write("name=" + "$_name" + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  Conversation copyWith({String? createdAt, List<Message>? messages, String? name, List<UserConversations>? user}) {
    return Conversation._internal(
      id: id,
      createdAt: createdAt ?? this.createdAt,
      messages: messages ?? this.messages,
      name: name ?? this.name,
      user: user ?? this.user);
  }
  
  Conversation copyWithModelFieldValues({
    ModelFieldValue<String?>? createdAt,
    ModelFieldValue<List<Message>?>? messages,
    ModelFieldValue<String>? name,
    ModelFieldValue<List<UserConversations>?>? user
  }) {
    return Conversation._internal(
      id: id,
      createdAt: createdAt == null ? this.createdAt : createdAt.value,
      messages: messages == null ? this.messages : messages.value,
      name: name == null ? this.name : name.value,
      user: user == null ? this.user : user.value
    );
  }
  
  Conversation.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _createdAt = json['createdAt'],
      _messages = json['messages'] is List
        ? (json['messages'] as List)
          .where((e) => e?['serializedData'] != null)
          .map((e) => Message.fromJson(new Map<String, dynamic>.from(e['serializedData'])))
          .toList()
        : null,
      _name = json['name'],
      _user = json['user'] is List
        ? (json['user'] as List)
          .where((e) => e?['serializedData'] != null)
          .map((e) => UserConversations.fromJson(new Map<String, dynamic>.from(e['serializedData'])))
          .toList()
        : null,
      _updatedAt = json['updatedAt'] != null ? amplify_core.TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'createdAt': _createdAt, 'messages': _messages?.map((Message? e) => e?.toJson()).toList(), 'name': _name, 'user': _user?.map((UserConversations? e) => e?.toJson()).toList(), 'updatedAt': _updatedAt?.format()
  };
  
  Map<String, Object?> toMap() => {
    'id': id,
    'createdAt': _createdAt,
    'messages': _messages,
    'name': _name,
    'user': _user,
    'updatedAt': _updatedAt
  };

  static final amplify_core.QueryModelIdentifier<ConversationModelIdentifier> MODEL_IDENTIFIER = amplify_core.QueryModelIdentifier<ConversationModelIdentifier>();
  static final ID = amplify_core.QueryField(fieldName: "id");
  static final CREATEDAT = amplify_core.QueryField(fieldName: "createdAt");
  static final MESSAGES = amplify_core.QueryField(
    fieldName: "messages",
    fieldType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.model, ofModelName: 'Message'));
  static final NAME = amplify_core.QueryField(fieldName: "name");
  static final USER = amplify_core.QueryField(
    fieldName: "user",
    fieldType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.model, ofModelName: 'UserConversations'));
  static var schema = amplify_core.Model.defineSchema(define: (amplify_core.ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "Conversation";
    modelSchemaDefinition.pluralName = "Conversations";
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.id());
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Conversation.CREATEDAT,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.hasMany(
      key: Conversation.MESSAGES,
      isRequired: false,
      ofModelName: 'Message',
      associatedKey: Message.CONVERSATION
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Conversation.NAME,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.hasMany(
      key: Conversation.USER,
      isRequired: false,
      ofModelName: 'UserConversations',
      associatedKey: UserConversations.CONVERSATION
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.nonQueryField(
      fieldName: 'updatedAt',
      isRequired: false,
      isReadOnly: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.dateTime)
    ));
  });
}

class _ConversationModelType extends amplify_core.ModelType<Conversation> {
  const _ConversationModelType();
  
  @override
  Conversation fromJson(Map<String, dynamic> jsonData) {
    return Conversation.fromJson(jsonData);
  }
  
  @override
  String modelName() {
    return 'Conversation';
  }
}

/**
 * This is an auto generated class representing the model identifier
 * of [Conversation] in your schema.
 */
class ConversationModelIdentifier implements amplify_core.ModelIdentifier<Conversation> {
  final String id;

  /** Create an instance of ConversationModelIdentifier using [id] the primary key. */
  const ConversationModelIdentifier({
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
  String toString() => 'ConversationModelIdentifier(id: $id)';
  
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    
    return other is ConversationModelIdentifier &&
      id == other.id;
  }
  
  @override
  int get hashCode =>
    id.hashCode;
}