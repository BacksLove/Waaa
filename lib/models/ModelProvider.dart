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

import 'package:amplify_core/amplify_core.dart' as amplify_core;
import 'Accommodation.dart';
import 'Activity.dart';
import 'Conversation.dart';
import 'Event.dart';
import 'EventCoowner.dart';
import 'EventParticipant.dart';
import 'EventTopic.dart';
import 'Friendship.dart';
import 'Hobby.dart';
import 'HobbyOfUser.dart';
import 'Message.dart';
import 'Offer.dart';
import 'OfferParticipants.dart';
import 'Step.dart';
import 'StepActivities.dart';
import 'StepTransport.dart';
import 'Transport.dart';
import 'Trip.dart';
import 'TripCategory.dart';
import 'TripParticipant.dart';
import 'User.dart';
import 'UserConversations.dart';

export 'Accommodation.dart';
export 'Activity.dart';
export 'Audience.dart';
export 'AudienceTrip.dart';
export 'Conversation.dart';
export 'DemandStatus.dart';
export 'Event.dart';
export 'EventCoowner.dart';
export 'EventParticipant.dart';
export 'EventTopic.dart';
export 'Friendship.dart';
export 'Gender.dart';
export 'Hobby.dart';
export 'HobbyOfUser.dart';
export 'Message.dart';
export 'Offer.dart';
export 'OfferParticipants.dart';
export 'Status.dart';
export 'Step.dart';
export 'StepActivities.dart';
export 'StepTransport.dart';
export 'Transport.dart';
export 'Trip.dart';
export 'TripCategory.dart';
export 'TripParticipant.dart';
export 'TripState.dart';
export 'User.dart';
export 'UserConversations.dart';

class ModelProvider implements amplify_core.ModelProviderInterface {
  @override
  String version = "2e25fc30fbc3b84c2caac1c13de6936f";
  @override
  List<amplify_core.ModelSchema> modelSchemas = [Accommodation.schema, Activity.schema, Conversation.schema, Event.schema, EventCoowner.schema, EventParticipant.schema, EventTopic.schema, Friendship.schema, Hobby.schema, HobbyOfUser.schema, Message.schema, Offer.schema, OfferParticipants.schema, Step.schema, StepActivities.schema, StepTransport.schema, Transport.schema, Trip.schema, TripCategory.schema, TripParticipant.schema, User.schema, UserConversations.schema];
  @override
  List<amplify_core.ModelSchema> customTypeSchemas = [];
  static final ModelProvider _instance = ModelProvider();

  static ModelProvider get instance => _instance;
  
  amplify_core.ModelType getModelTypeByModelName(String modelName) {
    switch(modelName) {
      case "Accommodation":
        return Accommodation.classType;
      case "Activity":
        return Activity.classType;
      case "Conversation":
        return Conversation.classType;
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
      case "Message":
        return Message.classType;
      case "Offer":
        return Offer.classType;
      case "OfferParticipants":
        return OfferParticipants.classType;
      case "Step":
        return Step.classType;
      case "StepActivities":
        return StepActivities.classType;
      case "StepTransport":
        return StepTransport.classType;
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
      case "UserConversations":
        return UserConversations.classType;
      default:
        throw Exception("Failed to find model in model provider for model name: " + modelName);
    }
  }
}


class ModelFieldValue<T> {
  const ModelFieldValue.value(this.value);

  final T value;
}
