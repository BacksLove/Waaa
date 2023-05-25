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
import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';


/** This is an auto generated class representing the Step type in your schema. */
@immutable
class Step extends Model {
  static const classType = const _StepModelType();
  final String id;
  final Transport? _transport;
  final TemporalDate? _begin;
  final TemporalDate? _end;
  final int? _nbDays;
  final Accommodation? _accommodation;
  final String? _description;
  final String? _country;
  final String? _city;
  final String? _address;
  final List<String>? _photos;
  final List<StepActivities>? _activities;
  final int? _stepPosition;
  final Trip? _trip;
  final TemporalDateTime? _createdAt;
  final Status? _status;
  final TemporalDateTime? _updatedAt;
  final String? _stepTransportId;
  final String? _stepAccommodationId;
  final String? _accommodationStepsId;

  @override
  getInstanceType() => classType;
  
  @Deprecated('[getId] is being deprecated in favor of custom primary key feature. Use getter [modelIdentifier] to get model identifier.')
  @override
  String getId() => id;
  
  StepModelIdentifier get modelIdentifier {
      return StepModelIdentifier(
        id: id
      );
  }
  
  Transport? get transport {
    return _transport;
  }
  
  TemporalDate? get begin {
    return _begin;
  }
  
  TemporalDate? get end {
    return _end;
  }
  
  int? get nbDays {
    return _nbDays;
  }
  
  Accommodation? get accommodation {
    return _accommodation;
  }
  
  String? get description {
    return _description;
  }
  
  String get country {
    try {
      return _country!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String get city {
    try {
      return _city!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String? get address {
    return _address;
  }
  
  List<String>? get photos {
    return _photos;
  }
  
  List<StepActivities>? get activities {
    return _activities;
  }
  
  int? get stepPosition {
    return _stepPosition;
  }
  
  Trip? get trip {
    return _trip;
  }
  
  TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  Status get status {
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
  
  TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  String? get stepTransportId {
    return _stepTransportId;
  }
  
  String? get stepAccommodationId {
    return _stepAccommodationId;
  }
  
  String? get accommodationStepsId {
    return _accommodationStepsId;
  }
  
  const Step._internal({required this.id, transport, begin, end, nbDays, accommodation, description, required country, required city, address, photos, activities, stepPosition, trip, createdAt, required status, updatedAt, stepTransportId, stepAccommodationId, accommodationStepsId}): _transport = transport, _begin = begin, _end = end, _nbDays = nbDays, _accommodation = accommodation, _description = description, _country = country, _city = city, _address = address, _photos = photos, _activities = activities, _stepPosition = stepPosition, _trip = trip, _createdAt = createdAt, _status = status, _updatedAt = updatedAt, _stepTransportId = stepTransportId, _stepAccommodationId = stepAccommodationId, _accommodationStepsId = accommodationStepsId;
  
  factory Step({String? id, Transport? transport, TemporalDate? begin, TemporalDate? end, int? nbDays, Accommodation? accommodation, String? description, required String country, required String city, String? address, List<String>? photos, List<StepActivities>? activities, int? stepPosition, Trip? trip, TemporalDateTime? createdAt, required Status status, String? stepTransportId, String? stepAccommodationId, String? accommodationStepsId}) {
    return Step._internal(
      id: id == null ? UUID.getUUID() : id,
      transport: transport,
      begin: begin,
      end: end,
      nbDays: nbDays,
      accommodation: accommodation,
      description: description,
      country: country,
      city: city,
      address: address,
      photos: photos != null ? List<String>.unmodifiable(photos) : photos,
      activities: activities != null ? List<StepActivities>.unmodifiable(activities) : activities,
      stepPosition: stepPosition,
      trip: trip,
      createdAt: createdAt,
      status: status,
      stepTransportId: stepTransportId,
      stepAccommodationId: stepAccommodationId,
      accommodationStepsId: accommodationStepsId);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Step &&
      id == other.id &&
      _transport == other._transport &&
      _begin == other._begin &&
      _end == other._end &&
      _nbDays == other._nbDays &&
      _accommodation == other._accommodation &&
      _description == other._description &&
      _country == other._country &&
      _city == other._city &&
      _address == other._address &&
      DeepCollectionEquality().equals(_photos, other._photos) &&
      DeepCollectionEquality().equals(_activities, other._activities) &&
      _stepPosition == other._stepPosition &&
      _trip == other._trip &&
      _createdAt == other._createdAt &&
      _status == other._status &&
      _stepTransportId == other._stepTransportId &&
      _stepAccommodationId == other._stepAccommodationId &&
      _accommodationStepsId == other._accommodationStepsId;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("Step {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("begin=" + (_begin != null ? _begin!.format() : "null") + ", ");
    buffer.write("end=" + (_end != null ? _end!.format() : "null") + ", ");
    buffer.write("nbDays=" + (_nbDays != null ? _nbDays!.toString() : "null") + ", ");
    buffer.write("description=" + "$_description" + ", ");
    buffer.write("country=" + "$_country" + ", ");
    buffer.write("city=" + "$_city" + ", ");
    buffer.write("address=" + "$_address" + ", ");
    buffer.write("photos=" + (_photos != null ? _photos!.toString() : "null") + ", ");
    buffer.write("stepPosition=" + (_stepPosition != null ? _stepPosition!.toString() : "null") + ", ");
    buffer.write("trip=" + (_trip != null ? _trip!.toString() : "null") + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("status=" + (_status != null ? enumToString(_status)! : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null") + ", ");
    buffer.write("stepTransportId=" + "$_stepTransportId" + ", ");
    buffer.write("stepAccommodationId=" + "$_stepAccommodationId" + ", ");
    buffer.write("accommodationStepsId=" + "$_accommodationStepsId");
    buffer.write("}");
    
    return buffer.toString();
  }
  
  Step copyWith({Transport? transport, TemporalDate? begin, TemporalDate? end, int? nbDays, Accommodation? accommodation, String? description, String? country, String? city, String? address, List<String>? photos, List<StepActivities>? activities, int? stepPosition, Trip? trip, TemporalDateTime? createdAt, Status? status, String? stepTransportId, String? stepAccommodationId, String? accommodationStepsId}) {
    return Step._internal(
      id: id,
      transport: transport ?? this.transport,
      begin: begin ?? this.begin,
      end: end ?? this.end,
      nbDays: nbDays ?? this.nbDays,
      accommodation: accommodation ?? this.accommodation,
      description: description ?? this.description,
      country: country ?? this.country,
      city: city ?? this.city,
      address: address ?? this.address,
      photos: photos ?? this.photos,
      activities: activities ?? this.activities,
      stepPosition: stepPosition ?? this.stepPosition,
      trip: trip ?? this.trip,
      createdAt: createdAt ?? this.createdAt,
      status: status ?? this.status,
      stepTransportId: stepTransportId ?? this.stepTransportId,
      stepAccommodationId: stepAccommodationId ?? this.stepAccommodationId,
      accommodationStepsId: accommodationStepsId ?? this.accommodationStepsId);
  }
  
  Step.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _transport = json['transport']?['serializedData'] != null
        ? Transport.fromJson(new Map<String, dynamic>.from(json['transport']['serializedData']))
        : null,
      _begin = json['begin'] != null ? TemporalDate.fromString(json['begin']) : null,
      _end = json['end'] != null ? TemporalDate.fromString(json['end']) : null,
      _nbDays = (json['nbDays'] as num?)?.toInt(),
      _accommodation = json['accommodation']?['serializedData'] != null
        ? Accommodation.fromJson(new Map<String, dynamic>.from(json['accommodation']['serializedData']))
        : null,
      _description = json['description'],
      _country = json['country'],
      _city = json['city'],
      _address = json['address'],
      _photos = json['photos']?.cast<String>(),
      _activities = json['activities'] is List
        ? (json['activities'] as List)
          .where((e) => e?['serializedData'] != null)
          .map((e) => StepActivities.fromJson(new Map<String, dynamic>.from(e['serializedData'])))
          .toList()
        : null,
      _stepPosition = (json['stepPosition'] as num?)?.toInt(),
      _trip = json['trip']?['serializedData'] != null
        ? Trip.fromJson(new Map<String, dynamic>.from(json['trip']['serializedData']))
        : null,
      _createdAt = json['createdAt'] != null ? TemporalDateTime.fromString(json['createdAt']) : null,
      _status = enumFromString<Status>(json['status'], Status.values),
      _updatedAt = json['updatedAt'] != null ? TemporalDateTime.fromString(json['updatedAt']) : null,
      _stepTransportId = json['stepTransportId'],
      _stepAccommodationId = json['stepAccommodationId'],
      _accommodationStepsId = json['accommodationStepsId'];
  
  Map<String, dynamic> toJson() => {
    'id': id, 'transport': _transport?.toJson(), 'begin': _begin?.format(), 'end': _end?.format(), 'nbDays': _nbDays, 'accommodation': _accommodation?.toJson(), 'description': _description, 'country': _country, 'city': _city, 'address': _address, 'photos': _photos, 'activities': _activities?.map((StepActivities? e) => e?.toJson()).toList(), 'stepPosition': _stepPosition, 'trip': _trip?.toJson(), 'createdAt': _createdAt?.format(), 'status': enumToString(_status), 'updatedAt': _updatedAt?.format(), 'stepTransportId': _stepTransportId, 'stepAccommodationId': _stepAccommodationId, 'accommodationStepsId': _accommodationStepsId
  };
  
  Map<String, Object?> toMap() => {
    'id': id, 'transport': _transport, 'begin': _begin, 'end': _end, 'nbDays': _nbDays, 'accommodation': _accommodation, 'description': _description, 'country': _country, 'city': _city, 'address': _address, 'photos': _photos, 'activities': _activities, 'stepPosition': _stepPosition, 'trip': _trip, 'createdAt': _createdAt, 'status': _status, 'updatedAt': _updatedAt, 'stepTransportId': _stepTransportId, 'stepAccommodationId': _stepAccommodationId, 'accommodationStepsId': _accommodationStepsId
  };

  static final QueryModelIdentifier<StepModelIdentifier> MODEL_IDENTIFIER = QueryModelIdentifier<StepModelIdentifier>();
  static final QueryField ID = QueryField(fieldName: "id");
  static final QueryField TRANSPORT = QueryField(
    fieldName: "transport",
    fieldType: ModelFieldType(ModelFieldTypeEnum.model, ofModelName: 'Transport'));
  static final QueryField BEGIN = QueryField(fieldName: "begin");
  static final QueryField END = QueryField(fieldName: "end");
  static final QueryField NBDAYS = QueryField(fieldName: "nbDays");
  static final QueryField ACCOMMODATION = QueryField(
    fieldName: "accommodation",
    fieldType: ModelFieldType(ModelFieldTypeEnum.model, ofModelName: 'Accommodation'));
  static final QueryField DESCRIPTION = QueryField(fieldName: "description");
  static final QueryField COUNTRY = QueryField(fieldName: "country");
  static final QueryField CITY = QueryField(fieldName: "city");
  static final QueryField ADDRESS = QueryField(fieldName: "address");
  static final QueryField PHOTOS = QueryField(fieldName: "photos");
  static final QueryField ACTIVITIES = QueryField(
    fieldName: "activities",
    fieldType: ModelFieldType(ModelFieldTypeEnum.model, ofModelName: 'StepActivities'));
  static final QueryField STEPPOSITION = QueryField(fieldName: "stepPosition");
  static final QueryField TRIP = QueryField(
    fieldName: "trip",
    fieldType: ModelFieldType(ModelFieldTypeEnum.model, ofModelName: 'Trip'));
  static final QueryField CREATEDAT = QueryField(fieldName: "createdAt");
  static final QueryField STATUS = QueryField(fieldName: "status");
  static final QueryField STEPTRANSPORTID = QueryField(fieldName: "stepTransportId");
  static final QueryField STEPACCOMMODATIONID = QueryField(fieldName: "stepAccommodationId");
  static final QueryField ACCOMMODATIONSTEPSID = QueryField(fieldName: "accommodationStepsId");
  static var schema = Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "Step";
    modelSchemaDefinition.pluralName = "Steps";
    
    modelSchemaDefinition.addField(ModelFieldDefinition.id());
    
    modelSchemaDefinition.addField(ModelFieldDefinition.hasOne(
      key: Step.TRANSPORT,
      isRequired: false,
      ofModelName: 'Transport',
      associatedKey: Transport.ID
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Step.BEGIN,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.date)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Step.END,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.date)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Step.NBDAYS,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.hasOne(
      key: Step.ACCOMMODATION,
      isRequired: false,
      ofModelName: 'Accommodation',
      associatedKey: Accommodation.ID
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Step.DESCRIPTION,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Step.COUNTRY,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Step.CITY,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Step.ADDRESS,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Step.PHOTOS,
      isRequired: false,
      isArray: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.collection, ofModelName: describeEnum(ModelFieldTypeEnum.string))
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.hasMany(
      key: Step.ACTIVITIES,
      isRequired: false,
      ofModelName: 'StepActivities',
      associatedKey: StepActivities.STEP
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Step.STEPPOSITION,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.belongsTo(
      key: Step.TRIP,
      isRequired: false,
      targetNames: ['tripStepsId'],
      ofModelName: 'Trip'
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Step.CREATEDAT,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.dateTime)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Step.STATUS,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.enumeration)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.nonQueryField(
      fieldName: 'updatedAt',
      isRequired: false,
      isReadOnly: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.dateTime)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Step.STEPTRANSPORTID,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Step.STEPACCOMMODATIONID,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Step.ACCOMMODATIONSTEPSID,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
  });
}

class _StepModelType extends ModelType<Step> {
  const _StepModelType();
  
  @override
  Step fromJson(Map<String, dynamic> jsonData) {
    return Step.fromJson(jsonData);
  }
  
  @override
  String modelName() {
    return 'Step';
  }
}

/**
 * This is an auto generated class representing the model identifier
 * of [Step] in your schema.
 */
@immutable
class StepModelIdentifier implements ModelIdentifier<Step> {
  final String id;

  /** Create an instance of StepModelIdentifier using [id] the primary key. */
  const StepModelIdentifier({
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
  String toString() => 'StepModelIdentifier(id: $id)';
  
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    
    return other is StepModelIdentifier &&
      id == other.id;
  }
  
  @override
  int get hashCode =>
    id.hashCode;
}