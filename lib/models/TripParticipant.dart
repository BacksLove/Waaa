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


/** This is an auto generated class representing the TripParticipant type in your schema. */
class TripParticipant extends amplify_core.Model {
  static const classType = const _TripParticipantModelType();
  final String id;
  final Trip? _trip;
  final User? _user;
  final DemandStatus? _status;
  final bool? _isOwner;
  final amplify_core.TemporalDateTime? _createdAt;
  final amplify_core.TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;
  
  @Deprecated('[getId] is being deprecated in favor of custom primary key feature. Use getter [modelIdentifier] to get model identifier.')
  @override
  String getId() => id;
  
  TripParticipantModelIdentifier get modelIdentifier {
      return TripParticipantModelIdentifier(
        id: id
      );
  }
  
  Trip get trip {
    try {
      return _trip!;
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
  
  bool? get isOwner {
    return _isOwner;
  }
  
  amplify_core.TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  amplify_core.TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  const TripParticipant._internal({required this.id, required trip, required user, required status, isOwner, createdAt, updatedAt}): _trip = trip, _user = user, _status = status, _isOwner = isOwner, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory TripParticipant({String? id, required Trip trip, required User user, required DemandStatus status, bool? isOwner}) {
    return TripParticipant._internal(
      id: id == null ? amplify_core.UUID.getUUID() : id,
      trip: trip,
      user: user,
      status: status,
      isOwner: isOwner);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TripParticipant &&
      id == other.id &&
      _trip == other._trip &&
      _user == other._user &&
      _status == other._status &&
      _isOwner == other._isOwner;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("TripParticipant {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("trip=" + (_trip != null ? _trip!.toString() : "null") + ", ");
    buffer.write("user=" + (_user != null ? _user!.toString() : "null") + ", ");
    buffer.write("status=" + (_status != null ? amplify_core.enumToString(_status)! : "null") + ", ");
    buffer.write("isOwner=" + (_isOwner != null ? _isOwner!.toString() : "null") + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  TripParticipant copyWith({Trip? trip, User? user, DemandStatus? status, bool? isOwner}) {
    return TripParticipant._internal(
      id: id,
      trip: trip ?? this.trip,
      user: user ?? this.user,
      status: status ?? this.status,
      isOwner: isOwner ?? this.isOwner);
  }
  
  TripParticipant copyWithModelFieldValues({
    ModelFieldValue<Trip>? trip,
    ModelFieldValue<User>? user,
    ModelFieldValue<DemandStatus>? status,
    ModelFieldValue<bool?>? isOwner
  }) {
    return TripParticipant._internal(
      id: id,
      trip: trip == null ? this.trip : trip.value,
      user: user == null ? this.user : user.value,
      status: status == null ? this.status : status.value,
      isOwner: isOwner == null ? this.isOwner : isOwner.value
    );
  }
  
  TripParticipant.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _trip = json['trip']?['serializedData'] != null
        ? Trip.fromJson(new Map<String, dynamic>.from(json['trip']['serializedData']))
        : null,
      _user = json['user']?['serializedData'] != null
        ? User.fromJson(new Map<String, dynamic>.from(json['user']['serializedData']))
        : null,
      _status = amplify_core.enumFromString<DemandStatus>(json['status'], DemandStatus.values),
      _isOwner = json['isOwner'],
      _createdAt = json['createdAt'] != null ? amplify_core.TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? amplify_core.TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'trip': _trip?.toJson(), 'user': _user?.toJson(), 'status': amplify_core.enumToString(_status), 'isOwner': _isOwner, 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };
  
  Map<String, Object?> toMap() => {
    'id': id,
    'trip': _trip,
    'user': _user,
    'status': _status,
    'isOwner': _isOwner,
    'createdAt': _createdAt,
    'updatedAt': _updatedAt
  };

  static final amplify_core.QueryModelIdentifier<TripParticipantModelIdentifier> MODEL_IDENTIFIER = amplify_core.QueryModelIdentifier<TripParticipantModelIdentifier>();
  static final ID = amplify_core.QueryField(fieldName: "id");
  static final TRIP = amplify_core.QueryField(
    fieldName: "trip",
    fieldType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.model, ofModelName: 'Trip'));
  static final USER = amplify_core.QueryField(
    fieldName: "user",
    fieldType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.model, ofModelName: 'User'));
  static final STATUS = amplify_core.QueryField(fieldName: "status");
  static final ISOWNER = amplify_core.QueryField(fieldName: "isOwner");
  static var schema = amplify_core.Model.defineSchema(define: (amplify_core.ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "TripParticipant";
    modelSchemaDefinition.pluralName = "TripParticipants";
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.id());
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.belongsTo(
      key: TripParticipant.TRIP,
      isRequired: true,
      targetNames: ['tripParticipantsId'],
      ofModelName: 'Trip'
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.belongsTo(
      key: TripParticipant.USER,
      isRequired: true,
      targetNames: ['userTripParticipationId'],
      ofModelName: 'User'
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: TripParticipant.STATUS,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.enumeration)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: TripParticipant.ISOWNER,
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

class _TripParticipantModelType extends amplify_core.ModelType<TripParticipant> {
  const _TripParticipantModelType();
  
  @override
  TripParticipant fromJson(Map<String, dynamic> jsonData) {
    return TripParticipant.fromJson(jsonData);
  }
  
  @override
  String modelName() {
    return 'TripParticipant';
  }
}

/**
 * This is an auto generated class representing the model identifier
 * of [TripParticipant] in your schema.
 */
class TripParticipantModelIdentifier implements amplify_core.ModelIdentifier<TripParticipant> {
  final String id;

  /** Create an instance of TripParticipantModelIdentifier using [id] the primary key. */
  const TripParticipantModelIdentifier({
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
  String toString() => 'TripParticipantModelIdentifier(id: $id)';
  
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    
    return other is TripParticipantModelIdentifier &&
      id == other.id;
  }
  
  @override
  int get hashCode =>
    id.hashCode;
}