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


/** This is an auto generated class representing the Step type in your schema. */
class Step extends amplify_core.Model {
  static const classType = const _StepModelType();
  final String id;
  final List<StepTransport>? _transport;
  final amplify_core.TemporalDate? _begin;
  final amplify_core.TemporalDate? _end;
  final int? _nbDays;
  final Accommodation? _accommodation;
  final String? _description;
  final String? _country;
  final String? _city;
  final String? _address;
  final List<String>? _photos;
  final TripCategory? _category;
  final List<StepActivities>? _activities;
  final int? _stepPosition;
  final Trip? _trip;
  final amplify_core.TemporalDateTime? _createdAt;
  final Status? _status;
  final amplify_core.TemporalDateTime? _updatedAt;
  final String? _stepAccommodationId;
  final String? _stepCategoryId;
  final String? _tripCategoryStepsId;
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
  
  List<StepTransport>? get transport {
    return _transport;
  }
  
  amplify_core.TemporalDate? get begin {
    return _begin;
  }
  
  amplify_core.TemporalDate? get end {
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
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String get city {
    try {
      return _city!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
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
  
  TripCategory? get category {
    return _category;
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
  
  amplify_core.TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  Status get status {
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
  
  amplify_core.TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  String? get stepAccommodationId {
    return _stepAccommodationId;
  }
  
  String? get stepCategoryId {
    return _stepCategoryId;
  }
  
  String? get tripCategoryStepsId {
    return _tripCategoryStepsId;
  }
  
  String? get accommodationStepsId {
    return _accommodationStepsId;
  }
  
  const Step._internal({required this.id, transport, begin, end, nbDays, accommodation, description, required country, required city, address, photos, category, activities, stepPosition, trip, createdAt, required status, updatedAt, stepAccommodationId, stepCategoryId, tripCategoryStepsId, accommodationStepsId}): _transport = transport, _begin = begin, _end = end, _nbDays = nbDays, _accommodation = accommodation, _description = description, _country = country, _city = city, _address = address, _photos = photos, _category = category, _activities = activities, _stepPosition = stepPosition, _trip = trip, _createdAt = createdAt, _status = status, _updatedAt = updatedAt, _stepAccommodationId = stepAccommodationId, _stepCategoryId = stepCategoryId, _tripCategoryStepsId = tripCategoryStepsId, _accommodationStepsId = accommodationStepsId;
  
  factory Step({String? id, List<StepTransport>? transport, amplify_core.TemporalDate? begin, amplify_core.TemporalDate? end, int? nbDays, Accommodation? accommodation, String? description, required String country, required String city, String? address, List<String>? photos, TripCategory? category, List<StepActivities>? activities, int? stepPosition, Trip? trip, amplify_core.TemporalDateTime? createdAt, required Status status, String? stepAccommodationId, String? stepCategoryId, String? tripCategoryStepsId, String? accommodationStepsId}) {
    return Step._internal(
      id: id == null ? amplify_core.UUID.getUUID() : id,
      transport: transport != null ? List<StepTransport>.unmodifiable(transport) : transport,
      begin: begin,
      end: end,
      nbDays: nbDays,
      accommodation: accommodation,
      description: description,
      country: country,
      city: city,
      address: address,
      photos: photos != null ? List<String>.unmodifiable(photos) : photos,
      category: category,
      activities: activities != null ? List<StepActivities>.unmodifiable(activities) : activities,
      stepPosition: stepPosition,
      trip: trip,
      createdAt: createdAt,
      status: status,
      stepAccommodationId: stepAccommodationId,
      stepCategoryId: stepCategoryId,
      tripCategoryStepsId: tripCategoryStepsId,
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
      DeepCollectionEquality().equals(_transport, other._transport) &&
      _begin == other._begin &&
      _end == other._end &&
      _nbDays == other._nbDays &&
      _accommodation == other._accommodation &&
      _description == other._description &&
      _country == other._country &&
      _city == other._city &&
      _address == other._address &&
      DeepCollectionEquality().equals(_photos, other._photos) &&
      _category == other._category &&
      DeepCollectionEquality().equals(_activities, other._activities) &&
      _stepPosition == other._stepPosition &&
      _trip == other._trip &&
      _createdAt == other._createdAt &&
      _status == other._status &&
      _stepAccommodationId == other._stepAccommodationId &&
      _stepCategoryId == other._stepCategoryId &&
      _tripCategoryStepsId == other._tripCategoryStepsId &&
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
    buffer.write("status=" + (_status != null ? amplify_core.enumToString(_status)! : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null") + ", ");
    buffer.write("stepAccommodationId=" + "$_stepAccommodationId" + ", ");
    buffer.write("stepCategoryId=" + "$_stepCategoryId" + ", ");
    buffer.write("tripCategoryStepsId=" + "$_tripCategoryStepsId" + ", ");
    buffer.write("accommodationStepsId=" + "$_accommodationStepsId");
    buffer.write("}");
    
    return buffer.toString();
  }
  
  Step copyWith({List<StepTransport>? transport, amplify_core.TemporalDate? begin, amplify_core.TemporalDate? end, int? nbDays, Accommodation? accommodation, String? description, String? country, String? city, String? address, List<String>? photos, TripCategory? category, List<StepActivities>? activities, int? stepPosition, Trip? trip, amplify_core.TemporalDateTime? createdAt, Status? status, String? stepAccommodationId, String? stepCategoryId, String? tripCategoryStepsId, String? accommodationStepsId}) {
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
      category: category ?? this.category,
      activities: activities ?? this.activities,
      stepPosition: stepPosition ?? this.stepPosition,
      trip: trip ?? this.trip,
      createdAt: createdAt ?? this.createdAt,
      status: status ?? this.status,
      stepAccommodationId: stepAccommodationId ?? this.stepAccommodationId,
      stepCategoryId: stepCategoryId ?? this.stepCategoryId,
      tripCategoryStepsId: tripCategoryStepsId ?? this.tripCategoryStepsId,
      accommodationStepsId: accommodationStepsId ?? this.accommodationStepsId);
  }
  
  Step copyWithModelFieldValues({
    ModelFieldValue<List<StepTransport>?>? transport,
    ModelFieldValue<amplify_core.TemporalDate?>? begin,
    ModelFieldValue<amplify_core.TemporalDate?>? end,
    ModelFieldValue<int?>? nbDays,
    ModelFieldValue<Accommodation?>? accommodation,
    ModelFieldValue<String?>? description,
    ModelFieldValue<String>? country,
    ModelFieldValue<String>? city,
    ModelFieldValue<String?>? address,
    ModelFieldValue<List<String>?>? photos,
    ModelFieldValue<TripCategory?>? category,
    ModelFieldValue<List<StepActivities>?>? activities,
    ModelFieldValue<int?>? stepPosition,
    ModelFieldValue<Trip?>? trip,
    ModelFieldValue<amplify_core.TemporalDateTime?>? createdAt,
    ModelFieldValue<Status>? status,
    ModelFieldValue<String?>? stepAccommodationId,
    ModelFieldValue<String?>? stepCategoryId,
    ModelFieldValue<String?>? tripCategoryStepsId,
    ModelFieldValue<String?>? accommodationStepsId
  }) {
    return Step._internal(
      id: id,
      transport: transport == null ? this.transport : transport.value,
      begin: begin == null ? this.begin : begin.value,
      end: end == null ? this.end : end.value,
      nbDays: nbDays == null ? this.nbDays : nbDays.value,
      accommodation: accommodation == null ? this.accommodation : accommodation.value,
      description: description == null ? this.description : description.value,
      country: country == null ? this.country : country.value,
      city: city == null ? this.city : city.value,
      address: address == null ? this.address : address.value,
      photos: photos == null ? this.photos : photos.value,
      category: category == null ? this.category : category.value,
      activities: activities == null ? this.activities : activities.value,
      stepPosition: stepPosition == null ? this.stepPosition : stepPosition.value,
      trip: trip == null ? this.trip : trip.value,
      createdAt: createdAt == null ? this.createdAt : createdAt.value,
      status: status == null ? this.status : status.value,
      stepAccommodationId: stepAccommodationId == null ? this.stepAccommodationId : stepAccommodationId.value,
      stepCategoryId: stepCategoryId == null ? this.stepCategoryId : stepCategoryId.value,
      tripCategoryStepsId: tripCategoryStepsId == null ? this.tripCategoryStepsId : tripCategoryStepsId.value,
      accommodationStepsId: accommodationStepsId == null ? this.accommodationStepsId : accommodationStepsId.value
    );
  }
  
  Step.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _transport = json['transport'] is List
        ? (json['transport'] as List)
          .where((e) => e?['serializedData'] != null)
          .map((e) => StepTransport.fromJson(new Map<String, dynamic>.from(e['serializedData'])))
          .toList()
        : null,
      _begin = json['begin'] != null ? amplify_core.TemporalDate.fromString(json['begin']) : null,
      _end = json['end'] != null ? amplify_core.TemporalDate.fromString(json['end']) : null,
      _nbDays = (json['nbDays'] as num?)?.toInt(),
      _accommodation = json['accommodation']?['serializedData'] != null
        ? Accommodation.fromJson(new Map<String, dynamic>.from(json['accommodation']['serializedData']))
        : null,
      _description = json['description'],
      _country = json['country'],
      _city = json['city'],
      _address = json['address'],
      _photos = json['photos']?.cast<String>(),
      _category = json['category']?['serializedData'] != null
        ? TripCategory.fromJson(new Map<String, dynamic>.from(json['category']['serializedData']))
        : null,
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
      _createdAt = json['createdAt'] != null ? amplify_core.TemporalDateTime.fromString(json['createdAt']) : null,
      _status = amplify_core.enumFromString<Status>(json['status'], Status.values),
      _updatedAt = json['updatedAt'] != null ? amplify_core.TemporalDateTime.fromString(json['updatedAt']) : null,
      _stepAccommodationId = json['stepAccommodationId'],
      _stepCategoryId = json['stepCategoryId'],
      _tripCategoryStepsId = json['tripCategoryStepsId'],
      _accommodationStepsId = json['accommodationStepsId'];
  
  Map<String, dynamic> toJson() => {
    'id': id, 'transport': _transport?.map((StepTransport? e) => e?.toJson()).toList(), 'begin': _begin?.format(), 'end': _end?.format(), 'nbDays': _nbDays, 'accommodation': _accommodation?.toJson(), 'description': _description, 'country': _country, 'city': _city, 'address': _address, 'photos': _photos, 'category': _category?.toJson(), 'activities': _activities?.map((StepActivities? e) => e?.toJson()).toList(), 'stepPosition': _stepPosition, 'trip': _trip?.toJson(), 'createdAt': _createdAt?.format(), 'status': amplify_core.enumToString(_status), 'updatedAt': _updatedAt?.format(), 'stepAccommodationId': _stepAccommodationId, 'stepCategoryId': _stepCategoryId, 'tripCategoryStepsId': _tripCategoryStepsId, 'accommodationStepsId': _accommodationStepsId
  };
  
  Map<String, Object?> toMap() => {
    'id': id,
    'transport': _transport,
    'begin': _begin,
    'end': _end,
    'nbDays': _nbDays,
    'accommodation': _accommodation,
    'description': _description,
    'country': _country,
    'city': _city,
    'address': _address,
    'photos': _photos,
    'category': _category,
    'activities': _activities,
    'stepPosition': _stepPosition,
    'trip': _trip,
    'createdAt': _createdAt,
    'status': _status,
    'updatedAt': _updatedAt,
    'stepAccommodationId': _stepAccommodationId,
    'stepCategoryId': _stepCategoryId,
    'tripCategoryStepsId': _tripCategoryStepsId,
    'accommodationStepsId': _accommodationStepsId
  };

  static final amplify_core.QueryModelIdentifier<StepModelIdentifier> MODEL_IDENTIFIER = amplify_core.QueryModelIdentifier<StepModelIdentifier>();
  static final ID = amplify_core.QueryField(fieldName: "id");
  static final TRANSPORT = amplify_core.QueryField(
    fieldName: "transport",
    fieldType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.model, ofModelName: 'StepTransport'));
  static final BEGIN = amplify_core.QueryField(fieldName: "begin");
  static final END = amplify_core.QueryField(fieldName: "end");
  static final NBDAYS = amplify_core.QueryField(fieldName: "nbDays");
  static final ACCOMMODATION = amplify_core.QueryField(
    fieldName: "accommodation",
    fieldType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.model, ofModelName: 'Accommodation'));
  static final DESCRIPTION = amplify_core.QueryField(fieldName: "description");
  static final COUNTRY = amplify_core.QueryField(fieldName: "country");
  static final CITY = amplify_core.QueryField(fieldName: "city");
  static final ADDRESS = amplify_core.QueryField(fieldName: "address");
  static final PHOTOS = amplify_core.QueryField(fieldName: "photos");
  static final CATEGORY = amplify_core.QueryField(
    fieldName: "category",
    fieldType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.model, ofModelName: 'TripCategory'));
  static final ACTIVITIES = amplify_core.QueryField(
    fieldName: "activities",
    fieldType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.model, ofModelName: 'StepActivities'));
  static final STEPPOSITION = amplify_core.QueryField(fieldName: "stepPosition");
  static final TRIP = amplify_core.QueryField(
    fieldName: "trip",
    fieldType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.model, ofModelName: 'Trip'));
  static final CREATEDAT = amplify_core.QueryField(fieldName: "createdAt");
  static final STATUS = amplify_core.QueryField(fieldName: "status");
  static final STEPACCOMMODATIONID = amplify_core.QueryField(fieldName: "stepAccommodationId");
  static final STEPCATEGORYID = amplify_core.QueryField(fieldName: "stepCategoryId");
  static final TRIPCATEGORYSTEPSID = amplify_core.QueryField(fieldName: "tripCategoryStepsId");
  static final ACCOMMODATIONSTEPSID = amplify_core.QueryField(fieldName: "accommodationStepsId");
  static var schema = amplify_core.Model.defineSchema(define: (amplify_core.ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "Step";
    modelSchemaDefinition.pluralName = "Steps";
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.id());
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.hasMany(
      key: Step.TRANSPORT,
      isRequired: false,
      ofModelName: 'StepTransport',
      associatedKey: StepTransport.STEP
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Step.BEGIN,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.date)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Step.END,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.date)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Step.NBDAYS,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.hasOne(
      key: Step.ACCOMMODATION,
      isRequired: false,
      ofModelName: 'Accommodation',
      associatedKey: Accommodation.ID
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Step.DESCRIPTION,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Step.COUNTRY,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Step.CITY,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Step.ADDRESS,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Step.PHOTOS,
      isRequired: false,
      isArray: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.collection, ofModelName: amplify_core.ModelFieldTypeEnum.string.name)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.hasOne(
      key: Step.CATEGORY,
      isRequired: false,
      ofModelName: 'TripCategory',
      associatedKey: TripCategory.ID
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.hasMany(
      key: Step.ACTIVITIES,
      isRequired: false,
      ofModelName: 'StepActivities',
      associatedKey: StepActivities.STEP
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Step.STEPPOSITION,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.belongsTo(
      key: Step.TRIP,
      isRequired: false,
      targetNames: ['tripStepsId'],
      ofModelName: 'Trip'
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Step.CREATEDAT,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.dateTime)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Step.STATUS,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.enumeration)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.nonQueryField(
      fieldName: 'updatedAt',
      isRequired: false,
      isReadOnly: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.dateTime)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Step.STEPACCOMMODATIONID,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Step.STEPCATEGORYID,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Step.TRIPCATEGORYSTEPSID,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Step.ACCOMMODATIONSTEPSID,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
  });
}

class _StepModelType extends amplify_core.ModelType<Step> {
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
class StepModelIdentifier implements amplify_core.ModelIdentifier<Step> {
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