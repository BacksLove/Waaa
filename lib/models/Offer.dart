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


/** This is an auto generated class representing the Offer type in your schema. */
@immutable
class Offer extends Model {
  static const classType = const _OfferModelType();
  final String id;
  final String? _title;
  final String? _description;
  final double? _price;
  final TemporalDateTime? _resultDate;
  final TemporalDateTime? _publicationDate;
  final String? _image;
  final String? _country;
  final String? _city;
  final String? _hashtag;
  final int? _nbWinners;
  final List<OfferParticipants>? _participants;
  final TemporalDateTime? _createdAt;
  final TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;
  
  @Deprecated('[getId] is being deprecated in favor of custom primary key feature. Use getter [modelIdentifier] to get model identifier.')
  @override
  String getId() => id;
  
  OfferModelIdentifier get modelIdentifier {
      return OfferModelIdentifier(
        id: id
      );
  }
  
  String get title {
    try {
      return _title!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String? get description {
    return _description;
  }
  
  double get price {
    try {
      return _price!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  TemporalDateTime? get resultDate {
    return _resultDate;
  }
  
  TemporalDateTime get publicationDate {
    try {
      return _publicationDate!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String? get image {
    return _image;
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
  
  String? get hashtag {
    return _hashtag;
  }
  
  int get nbWinners {
    try {
      return _nbWinners!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  List<OfferParticipants>? get participants {
    return _participants;
  }
  
  TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  const Offer._internal({required this.id, required title, description, required price, resultDate, required publicationDate, image, required country, required city, hashtag, required nbWinners, participants, createdAt, updatedAt}): _title = title, _description = description, _price = price, _resultDate = resultDate, _publicationDate = publicationDate, _image = image, _country = country, _city = city, _hashtag = hashtag, _nbWinners = nbWinners, _participants = participants, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory Offer({String? id, required String title, String? description, required double price, TemporalDateTime? resultDate, required TemporalDateTime publicationDate, String? image, required String country, required String city, String? hashtag, required int nbWinners, List<OfferParticipants>? participants}) {
    return Offer._internal(
      id: id == null ? UUID.getUUID() : id,
      title: title,
      description: description,
      price: price,
      resultDate: resultDate,
      publicationDate: publicationDate,
      image: image,
      country: country,
      city: city,
      hashtag: hashtag,
      nbWinners: nbWinners,
      participants: participants != null ? List<OfferParticipants>.unmodifiable(participants) : participants);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Offer &&
      id == other.id &&
      _title == other._title &&
      _description == other._description &&
      _price == other._price &&
      _resultDate == other._resultDate &&
      _publicationDate == other._publicationDate &&
      _image == other._image &&
      _country == other._country &&
      _city == other._city &&
      _hashtag == other._hashtag &&
      _nbWinners == other._nbWinners &&
      DeepCollectionEquality().equals(_participants, other._participants);
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("Offer {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("title=" + "$_title" + ", ");
    buffer.write("description=" + "$_description" + ", ");
    buffer.write("price=" + (_price != null ? _price!.toString() : "null") + ", ");
    buffer.write("resultDate=" + (_resultDate != null ? _resultDate!.format() : "null") + ", ");
    buffer.write("publicationDate=" + (_publicationDate != null ? _publicationDate!.format() : "null") + ", ");
    buffer.write("image=" + "$_image" + ", ");
    buffer.write("country=" + "$_country" + ", ");
    buffer.write("city=" + "$_city" + ", ");
    buffer.write("hashtag=" + "$_hashtag" + ", ");
    buffer.write("nbWinners=" + (_nbWinners != null ? _nbWinners!.toString() : "null") + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  Offer copyWith({String? title, String? description, double? price, TemporalDateTime? resultDate, TemporalDateTime? publicationDate, String? image, String? country, String? city, String? hashtag, int? nbWinners, List<OfferParticipants>? participants}) {
    return Offer._internal(
      id: id,
      title: title ?? this.title,
      description: description ?? this.description,
      price: price ?? this.price,
      resultDate: resultDate ?? this.resultDate,
      publicationDate: publicationDate ?? this.publicationDate,
      image: image ?? this.image,
      country: country ?? this.country,
      city: city ?? this.city,
      hashtag: hashtag ?? this.hashtag,
      nbWinners: nbWinners ?? this.nbWinners,
      participants: participants ?? this.participants);
  }
  
  Offer.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _title = json['title'],
      _description = json['description'],
      _price = (json['price'] as num?)?.toDouble(),
      _resultDate = json['resultDate'] != null ? TemporalDateTime.fromString(json['resultDate']) : null,
      _publicationDate = json['publicationDate'] != null ? TemporalDateTime.fromString(json['publicationDate']) : null,
      _image = json['image'],
      _country = json['country'],
      _city = json['city'],
      _hashtag = json['hashtag'],
      _nbWinners = (json['nbWinners'] as num?)?.toInt(),
      _participants = json['participants'] is List
        ? (json['participants'] as List)
          .where((e) => e?['serializedData'] != null)
          .map((e) => OfferParticipants.fromJson(new Map<String, dynamic>.from(e['serializedData'])))
          .toList()
        : null,
      _createdAt = json['createdAt'] != null ? TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'title': _title, 'description': _description, 'price': _price, 'resultDate': _resultDate?.format(), 'publicationDate': _publicationDate?.format(), 'image': _image, 'country': _country, 'city': _city, 'hashtag': _hashtag, 'nbWinners': _nbWinners, 'participants': _participants?.map((OfferParticipants? e) => e?.toJson()).toList(), 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };
  
  Map<String, Object?> toMap() => {
    'id': id, 'title': _title, 'description': _description, 'price': _price, 'resultDate': _resultDate, 'publicationDate': _publicationDate, 'image': _image, 'country': _country, 'city': _city, 'hashtag': _hashtag, 'nbWinners': _nbWinners, 'participants': _participants, 'createdAt': _createdAt, 'updatedAt': _updatedAt
  };

  static final QueryModelIdentifier<OfferModelIdentifier> MODEL_IDENTIFIER = QueryModelIdentifier<OfferModelIdentifier>();
  static final QueryField ID = QueryField(fieldName: "id");
  static final QueryField TITLE = QueryField(fieldName: "title");
  static final QueryField DESCRIPTION = QueryField(fieldName: "description");
  static final QueryField PRICE = QueryField(fieldName: "price");
  static final QueryField RESULTDATE = QueryField(fieldName: "resultDate");
  static final QueryField PUBLICATIONDATE = QueryField(fieldName: "publicationDate");
  static final QueryField IMAGE = QueryField(fieldName: "image");
  static final QueryField COUNTRY = QueryField(fieldName: "country");
  static final QueryField CITY = QueryField(fieldName: "city");
  static final QueryField HASHTAG = QueryField(fieldName: "hashtag");
  static final QueryField NBWINNERS = QueryField(fieldName: "nbWinners");
  static final QueryField PARTICIPANTS = QueryField(
    fieldName: "participants",
    fieldType: ModelFieldType(ModelFieldTypeEnum.model, ofModelName: 'OfferParticipants'));
  static var schema = Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "Offer";
    modelSchemaDefinition.pluralName = "Offers";
    
    modelSchemaDefinition.addField(ModelFieldDefinition.id());
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Offer.TITLE,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Offer.DESCRIPTION,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Offer.PRICE,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.double)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Offer.RESULTDATE,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.dateTime)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Offer.PUBLICATIONDATE,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.dateTime)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Offer.IMAGE,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Offer.COUNTRY,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Offer.CITY,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Offer.HASHTAG,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Offer.NBWINNERS,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.hasMany(
      key: Offer.PARTICIPANTS,
      isRequired: false,
      ofModelName: 'OfferParticipants',
      associatedKey: OfferParticipants.OFFER
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

class _OfferModelType extends ModelType<Offer> {
  const _OfferModelType();
  
  @override
  Offer fromJson(Map<String, dynamic> jsonData) {
    return Offer.fromJson(jsonData);
  }
  
  @override
  String modelName() {
    return 'Offer';
  }
}

/**
 * This is an auto generated class representing the model identifier
 * of [Offer] in your schema.
 */
@immutable
class OfferModelIdentifier implements ModelIdentifier<Offer> {
  final String id;

  /** Create an instance of OfferModelIdentifier using [id] the primary key. */
  const OfferModelIdentifier({
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
  String toString() => 'OfferModelIdentifier(id: $id)';
  
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    
    return other is OfferModelIdentifier &&
      id == other.id;
  }
  
  @override
  int get hashCode =>
    id.hashCode;
}