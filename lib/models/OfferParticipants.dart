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


/** This is an auto generated class representing the OfferParticipants type in your schema. */
class OfferParticipants extends amplify_core.Model {
  static const classType = const _OfferParticipantsModelType();
  final String id;
  final Offer? _offer;
  final User? _user;
  final bool? _isWinner;
  final bool? _havePaid;
  final amplify_core.TemporalDateTime? _createdAt;
  final amplify_core.TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;
  
  @Deprecated('[getId] is being deprecated in favor of custom primary key feature. Use getter [modelIdentifier] to get model identifier.')
  @override
  String getId() => id;
  
  OfferParticipantsModelIdentifier get modelIdentifier {
      return OfferParticipantsModelIdentifier(
        id: id
      );
  }
  
  Offer get offer {
    try {
      return _offer!;
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
  
  bool? get isWinner {
    return _isWinner;
  }
  
  bool? get havePaid {
    return _havePaid;
  }
  
  amplify_core.TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  amplify_core.TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  const OfferParticipants._internal({required this.id, required offer, required user, isWinner, havePaid, createdAt, updatedAt}): _offer = offer, _user = user, _isWinner = isWinner, _havePaid = havePaid, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory OfferParticipants({String? id, required Offer offer, required User user, bool? isWinner, bool? havePaid}) {
    return OfferParticipants._internal(
      id: id == null ? amplify_core.UUID.getUUID() : id,
      offer: offer,
      user: user,
      isWinner: isWinner,
      havePaid: havePaid);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is OfferParticipants &&
      id == other.id &&
      _offer == other._offer &&
      _user == other._user &&
      _isWinner == other._isWinner &&
      _havePaid == other._havePaid;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("OfferParticipants {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("offer=" + (_offer != null ? _offer!.toString() : "null") + ", ");
    buffer.write("user=" + (_user != null ? _user!.toString() : "null") + ", ");
    buffer.write("isWinner=" + (_isWinner != null ? _isWinner!.toString() : "null") + ", ");
    buffer.write("havePaid=" + (_havePaid != null ? _havePaid!.toString() : "null") + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  OfferParticipants copyWith({Offer? offer, User? user, bool? isWinner, bool? havePaid}) {
    return OfferParticipants._internal(
      id: id,
      offer: offer ?? this.offer,
      user: user ?? this.user,
      isWinner: isWinner ?? this.isWinner,
      havePaid: havePaid ?? this.havePaid);
  }
  
  OfferParticipants copyWithModelFieldValues({
    ModelFieldValue<Offer>? offer,
    ModelFieldValue<User>? user,
    ModelFieldValue<bool?>? isWinner,
    ModelFieldValue<bool?>? havePaid
  }) {
    return OfferParticipants._internal(
      id: id,
      offer: offer == null ? this.offer : offer.value,
      user: user == null ? this.user : user.value,
      isWinner: isWinner == null ? this.isWinner : isWinner.value,
      havePaid: havePaid == null ? this.havePaid : havePaid.value
    );
  }
  
  OfferParticipants.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _offer = json['offer']?['serializedData'] != null
        ? Offer.fromJson(new Map<String, dynamic>.from(json['offer']['serializedData']))
        : null,
      _user = json['user']?['serializedData'] != null
        ? User.fromJson(new Map<String, dynamic>.from(json['user']['serializedData']))
        : null,
      _isWinner = json['isWinner'],
      _havePaid = json['havePaid'],
      _createdAt = json['createdAt'] != null ? amplify_core.TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? amplify_core.TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'offer': _offer?.toJson(), 'user': _user?.toJson(), 'isWinner': _isWinner, 'havePaid': _havePaid, 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };
  
  Map<String, Object?> toMap() => {
    'id': id,
    'offer': _offer,
    'user': _user,
    'isWinner': _isWinner,
    'havePaid': _havePaid,
    'createdAt': _createdAt,
    'updatedAt': _updatedAt
  };

  static final amplify_core.QueryModelIdentifier<OfferParticipantsModelIdentifier> MODEL_IDENTIFIER = amplify_core.QueryModelIdentifier<OfferParticipantsModelIdentifier>();
  static final ID = amplify_core.QueryField(fieldName: "id");
  static final OFFER = amplify_core.QueryField(
    fieldName: "offer",
    fieldType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.model, ofModelName: 'Offer'));
  static final USER = amplify_core.QueryField(
    fieldName: "user",
    fieldType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.model, ofModelName: 'User'));
  static final ISWINNER = amplify_core.QueryField(fieldName: "isWinner");
  static final HAVEPAID = amplify_core.QueryField(fieldName: "havePaid");
  static var schema = amplify_core.Model.defineSchema(define: (amplify_core.ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "OfferParticipants";
    modelSchemaDefinition.pluralName = "OfferParticipants";
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.id());
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.belongsTo(
      key: OfferParticipants.OFFER,
      isRequired: true,
      targetNames: ['offerParticipantsId'],
      ofModelName: 'Offer'
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.belongsTo(
      key: OfferParticipants.USER,
      isRequired: true,
      targetNames: ['userOfferParticipationId'],
      ofModelName: 'User'
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: OfferParticipants.ISWINNER,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.bool)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: OfferParticipants.HAVEPAID,
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

class _OfferParticipantsModelType extends amplify_core.ModelType<OfferParticipants> {
  const _OfferParticipantsModelType();
  
  @override
  OfferParticipants fromJson(Map<String, dynamic> jsonData) {
    return OfferParticipants.fromJson(jsonData);
  }
  
  @override
  String modelName() {
    return 'OfferParticipants';
  }
}

/**
 * This is an auto generated class representing the model identifier
 * of [OfferParticipants] in your schema.
 */
class OfferParticipantsModelIdentifier implements amplify_core.ModelIdentifier<OfferParticipants> {
  final String id;

  /** Create an instance of OfferParticipantsModelIdentifier using [id] the primary key. */
  const OfferParticipantsModelIdentifier({
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
  String toString() => 'OfferParticipantsModelIdentifier(id: $id)';
  
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    
    return other is OfferParticipantsModelIdentifier &&
      id == other.id;
  }
  
  @override
  int get hashCode =>
    id.hashCode;
}