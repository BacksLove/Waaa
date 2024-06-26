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


/** This is an auto generated class representing the Message type in your schema. */
class Message extends amplify_core.Model {
  static const classType = const _MessageModelType();
  final String id;
  final User? _author;
  final String? _content;
  final Conversation? _conversation;
  final amplify_core.TemporalDateTime? _createdAt;
  final bool? _isSent;
  final User? _recipient;
  final String? _sender;
  final amplify_core.TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;
  
  @Deprecated('[getId] is being deprecated in favor of custom primary key feature. Use getter [modelIdentifier] to get model identifier.')
  @override
  String getId() => id;
  
  MessageModelIdentifier get modelIdentifier {
      return MessageModelIdentifier(
        id: id
      );
  }
  
  User? get author {
    return _author;
  }
  
  String? get content {
    return _content;
  }
  
  Conversation? get conversation {
    return _conversation;
  }
  
  amplify_core.TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  bool? get isSent {
    return _isSent;
  }
  
  User get recipient {
    try {
      return _recipient!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String? get sender {
    return _sender;
  }
  
  amplify_core.TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  const Message._internal({required this.id, author, content, conversation, createdAt, isSent, required recipient, sender, updatedAt}): _author = author, _content = content, _conversation = conversation, _createdAt = createdAt, _isSent = isSent, _recipient = recipient, _sender = sender, _updatedAt = updatedAt;
  
  factory Message({String? id, User? author, String? content, Conversation? conversation, amplify_core.TemporalDateTime? createdAt, bool? isSent, required User recipient, String? sender}) {
    return Message._internal(
      id: id == null ? amplify_core.UUID.getUUID() : id,
      author: author,
      content: content,
      conversation: conversation,
      createdAt: createdAt,
      isSent: isSent,
      recipient: recipient,
      sender: sender);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Message &&
      id == other.id &&
      _author == other._author &&
      _content == other._content &&
      _conversation == other._conversation &&
      _createdAt == other._createdAt &&
      _isSent == other._isSent &&
      _recipient == other._recipient &&
      _sender == other._sender;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("Message {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("author=" + (_author != null ? _author!.toString() : "null") + ", ");
    buffer.write("content=" + "$_content" + ", ");
    buffer.write("conversation=" + (_conversation != null ? _conversation!.toString() : "null") + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("isSent=" + (_isSent != null ? _isSent!.toString() : "null") + ", ");
    buffer.write("recipient=" + (_recipient != null ? _recipient!.toString() : "null") + ", ");
    buffer.write("sender=" + "$_sender" + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  Message copyWith({User? author, String? content, Conversation? conversation, amplify_core.TemporalDateTime? createdAt, bool? isSent, User? recipient, String? sender}) {
    return Message._internal(
      id: id,
      author: author ?? this.author,
      content: content ?? this.content,
      conversation: conversation ?? this.conversation,
      createdAt: createdAt ?? this.createdAt,
      isSent: isSent ?? this.isSent,
      recipient: recipient ?? this.recipient,
      sender: sender ?? this.sender);
  }
  
  Message copyWithModelFieldValues({
    ModelFieldValue<User?>? author,
    ModelFieldValue<String?>? content,
    ModelFieldValue<Conversation?>? conversation,
    ModelFieldValue<amplify_core.TemporalDateTime?>? createdAt,
    ModelFieldValue<bool?>? isSent,
    ModelFieldValue<User>? recipient,
    ModelFieldValue<String?>? sender
  }) {
    return Message._internal(
      id: id,
      author: author == null ? this.author : author.value,
      content: content == null ? this.content : content.value,
      conversation: conversation == null ? this.conversation : conversation.value,
      createdAt: createdAt == null ? this.createdAt : createdAt.value,
      isSent: isSent == null ? this.isSent : isSent.value,
      recipient: recipient == null ? this.recipient : recipient.value,
      sender: sender == null ? this.sender : sender.value
    );
  }
  
  Message.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _author = json['author']?['serializedData'] != null
        ? User.fromJson(new Map<String, dynamic>.from(json['author']['serializedData']))
        : null,
      _content = json['content'],
      _conversation = json['conversation']?['serializedData'] != null
        ? Conversation.fromJson(new Map<String, dynamic>.from(json['conversation']['serializedData']))
        : null,
      _createdAt = json['createdAt'] != null ? amplify_core.TemporalDateTime.fromString(json['createdAt']) : null,
      _isSent = json['isSent'],
      _recipient = json['recipient']?['serializedData'] != null
        ? User.fromJson(new Map<String, dynamic>.from(json['recipient']['serializedData']))
        : null,
      _sender = json['sender'],
      _updatedAt = json['updatedAt'] != null ? amplify_core.TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'author': _author?.toJson(), 'content': _content, 'conversation': _conversation?.toJson(), 'createdAt': _createdAt?.format(), 'isSent': _isSent, 'recipient': _recipient?.toJson(), 'sender': _sender, 'updatedAt': _updatedAt?.format()
  };
  
  Map<String, Object?> toMap() => {
    'id': id,
    'author': _author,
    'content': _content,
    'conversation': _conversation,
    'createdAt': _createdAt,
    'isSent': _isSent,
    'recipient': _recipient,
    'sender': _sender,
    'updatedAt': _updatedAt
  };

  static final amplify_core.QueryModelIdentifier<MessageModelIdentifier> MODEL_IDENTIFIER = amplify_core.QueryModelIdentifier<MessageModelIdentifier>();
  static final ID = amplify_core.QueryField(fieldName: "id");
  static final AUTHOR = amplify_core.QueryField(
    fieldName: "author",
    fieldType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.model, ofModelName: 'User'));
  static final CONTENT = amplify_core.QueryField(fieldName: "content");
  static final CONVERSATION = amplify_core.QueryField(
    fieldName: "conversation",
    fieldType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.model, ofModelName: 'Conversation'));
  static final CREATEDAT = amplify_core.QueryField(fieldName: "createdAt");
  static final ISSENT = amplify_core.QueryField(fieldName: "isSent");
  static final RECIPIENT = amplify_core.QueryField(
    fieldName: "recipient",
    fieldType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.model, ofModelName: 'User'));
  static final SENDER = amplify_core.QueryField(fieldName: "sender");
  static var schema = amplify_core.Model.defineSchema(define: (amplify_core.ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "Message";
    modelSchemaDefinition.pluralName = "Messages";
    
    modelSchemaDefinition.indexes = [
      amplify_core.ModelIndex(fields: const ["authorId"], name: "byMessageSend"),
      amplify_core.ModelIndex(fields: const ["conversationId"], name: "MessagebyConversation"),
      amplify_core.ModelIndex(fields: const ["recipientId"], name: "byMassageReceive")
    ];
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.id());
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.belongsTo(
      key: Message.AUTHOR,
      isRequired: false,
      targetNames: ['authorId'],
      ofModelName: 'User'
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Message.CONTENT,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.belongsTo(
      key: Message.CONVERSATION,
      isRequired: false,
      targetNames: ['conversationId'],
      ofModelName: 'Conversation'
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Message.CREATEDAT,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.dateTime)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Message.ISSENT,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.bool)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.belongsTo(
      key: Message.RECIPIENT,
      isRequired: true,
      targetNames: ['recipientId'],
      ofModelName: 'User'
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Message.SENDER,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.nonQueryField(
      fieldName: 'updatedAt',
      isRequired: false,
      isReadOnly: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.dateTime)
    ));
  });
}

class _MessageModelType extends amplify_core.ModelType<Message> {
  const _MessageModelType();
  
  @override
  Message fromJson(Map<String, dynamic> jsonData) {
    return Message.fromJson(jsonData);
  }
  
  @override
  String modelName() {
    return 'Message';
  }
}

/**
 * This is an auto generated class representing the model identifier
 * of [Message] in your schema.
 */
class MessageModelIdentifier implements amplify_core.ModelIdentifier<Message> {
  final String id;

  /** Create an instance of MessageModelIdentifier using [id] the primary key. */
  const MessageModelIdentifier({
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
  String toString() => 'MessageModelIdentifier(id: $id)';
  
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    
    return other is MessageModelIdentifier &&
      id == other.id;
  }
  
  @override
  int get hashCode =>
    id.hashCode;
}