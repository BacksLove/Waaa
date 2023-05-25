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

import 'package:amplify_core/amplify_core.dart';
import 'Accommodation.dart';
import 'Activity.dart';
import 'Event.dart';
import 'EventCoowner.dart';
import 'EventParticipant.dart';
import 'EventTopic.dart';
import 'Friendship.dart';
import 'Hobby.dart';
import 'HobbyOfUser.dart';
import 'Offer.dart';
import 'OfferParticipants.dart';
import 'Step.dart';
import 'StepActivities.dart';
import 'Transport.dart';
import 'Trip.dart';
import 'TripCategory.dart';
import 'TripParticipant.dart';
import 'User.dart';

export 'Accommodation.dart';
export 'Activity.dart';
export 'Audience.dart';
export 'DemandStatus.dart';
export 'Event.dart';
export 'EventCoowner.dart';
export 'EventParticipant.dart';
export 'EventTopic.dart';
export 'Friendship.dart';
export 'Gender.dart';
export 'Hobby.dart';
export 'HobbyOfUser.dart';
export 'Offer.dart';
export 'OfferParticipants.dart';
export 'Status.dart';
export 'Step.dart';
export 'StepActivities.dart';
export 'Transport.dart';
export 'Trip.dart';
export 'TripCategory.dart';
export 'TripParticipant.dart';
export 'TripState.dart';
export 'User.dart';

class ModelProvider implements ModelProviderInterface {
  @override
  String version = "2d93694ec6362a4817917f819bdd7736";
  @override
  List<ModelSchema> modelSchemas = [Accommodation.schema, Activity.schema, Event.schema, EventCoowner.schema, EventParticipant.schema, EventTopic.schema, Friendship.schema, Hobby.schema, HobbyOfUser.schema, Offer.schema, OfferParticipants.schema, Step.schema, StepActivities.schema, Transport.schema, Trip.schema, TripCategory.schema, TripParticipant.schema, User.schema];
  static final ModelProvider _instance = ModelProvider();
  @override
  List<ModelSchema> customTypeSchemas = [];

  static ModelProvider get instance => _instance;
  
  ModelType getModelTypeByModelName(String modelName) {
    switch(modelName) {
      case "Accommodation":
        return Accommodation.classType;
      case "Activity":
        return Activity.classType;
      case "Event":
        return Event.classType;
      case "EventCoowner":
        return EventCoowner.classType;
      case "EventParticipant":
        return EventParticipant.classType;
      case "EventTopic":
        return EventTopic.classType;
      case "Friendship":
        return Friendship.classType;
      case "Hobby":
        return Hobby.classType;
      case "HobbyOfUser":
        return HobbyOfUser.classType;
      case "Offer":
        return Offer.classType;
      case "OfferParticipants":
        return OfferParticipants.classType;
      case "Step":
        return Step.classType;
      case "StepActivities":
        return StepActivities.classType;
      case "Transport":
        return Transport.classType;
      case "Trip":
        return Trip.classType;
      case "TripCategory":
        return TripCategory.classType;
      case "TripParticipant":
        return TripParticipant.classType;
      case "User":
        return User.classType;
      default:
        throw Exception("Failed to find model in model provider for model name: " + modelName);
    }
  }
}