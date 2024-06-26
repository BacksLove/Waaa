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


/** This is an auto generated class representing the User type in your schema. */
class User extends amplify_core.Model {
  static const classType = const _UserModelType();
  final String id;
  final String? _cognitoUserPoolId;
  final String? _username;
  final String? _role;
  final Gender? _gender;
  final Gender? _lookingFor;
  final amplify_core.TemporalDate? _birthday;
  final String? _country;
  final String? _city;
  final String? _bio;
  final String? _nativeLanguage;
  final List<String>? _languagesSpeak;
  final List<HobbyOfUser>? _hobbies;
  final bool? _suspended;
  final amplify_core.TemporalTimestamp? _suspendedUntil;
  final int? _reporting;
  final bool? _openDiscussion;
  final bool? _privacy;
  final String? _photo;
  final bool? _isConnected;
  final bool? _isAdminWaaa;
  final amplify_core.TemporalDateTime? _createdAt;
  final List<Friendship>? _friendsSender;
  final List<Friendship>? _friendsReceiver;
  final List<Trip>? _trips;
  final List<Event>? _events;
  final List<EventCoowner>? _eventCoowner;
  final List<TripParticipant>? _tripParticipation;
  final List<EventParticipant>? _eventParticipation;
  final List<OfferParticipants>? _offerParticipation;
  final List<Message>? _messages;
  final List<UserConversations>? _conversations;
  final amplify_core.TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;
  
  @Deprecated('[getId] is being deprecated in favor of custom primary key feature. Use getter [modelIdentifier] to get model identifier.')
  @override
  String getId() => id;
  
  UserModelIdentifier get modelIdentifier {
      return UserModelIdentifier(
        id: id
      );
  }
  
  String? get cognitoUserPoolId {
    return _cognitoUserPoolId;
  }
  
  String get username {
    try {
      return _username!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String? get role {
    return _role;
  }
  
  Gender? get gender {
    return _gender;
  }
  
  Gender? get lookingFor {
    return _lookingFor;
  }
  
  amplify_core.TemporalDate? get birthday {
    return _birthday;
  }
  
  String? get country {
    return _country;
  }
  
  String? get city {
    return _city;
  }
  
  String? get bio {
    return _bio;
  }
  
  String? get nativeLanguage {
    return _nativeLanguage;
  }
  
  List<String>? get languagesSpeak {
    return _languagesSpeak;
  }
  
  List<HobbyOfUser>? get hobbies {
    return _hobbies;
  }
  
  bool? get suspended {
    return _suspended;
  }
  
  amplify_core.TemporalTimestamp? get suspendedUntil {
    return _suspendedUntil;
  }
  
  int? get reporting {
    return _reporting;
  }
  
  bool? get openDiscussion {
    return _openDiscussion;
  }
  
  bool? get privacy {
    return _privacy;
  }
  
  String? get photo {
    return _photo;
  }
  
  bool? get isConnected {
    return _isConnected;
  }
  
  bool? get isAdminWaaa {
    return _isAdminWaaa;
  }
  
  amplify_core.TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  List<Friendship>? get friendsSender {
    return _friendsSender;
  }
  
  List<Friendship>? get friendsReceiver {
    return _friendsReceiver;
  }
  
  List<Trip>? get trips {
    return _trips;
  }
  
  List<Event>? get events {
    return _events;
  }
  
  List<EventCoowner>? get eventCoowner {
    return _eventCoowner;
  }
  
  List<TripParticipant>? get tripParticipation {
    return _tripParticipation;
  }
  
  List<EventParticipant>? get eventParticipation {
    return _eventParticipation;
  }
  
  List<OfferParticipants>? get offerParticipation {
    return _offerParticipation;
  }
  
  List<Message>? get messages {
    return _messages;
  }
  
  List<UserConversations>? get conversations {
    return _conversations;
  }
  
  amplify_core.TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  const User._internal({required this.id, cognitoUserPoolId, required username, role, gender, lookingFor, birthday, country, city, bio, nativeLanguage, languagesSpeak, hobbies, suspended, suspendedUntil, reporting, openDiscussion, privacy, photo, isConnected, isAdminWaaa, createdAt, friendsSender, friendsReceiver, trips, events, eventCoowner, tripParticipation, eventParticipation, offerParticipation, messages, conversations, updatedAt}): _cognitoUserPoolId = cognitoUserPoolId, _username = username, _role = role, _gender = gender, _lookingFor = lookingFor, _birthday = birthday, _country = country, _city = city, _bio = bio, _nativeLanguage = nativeLanguage, _languagesSpeak = languagesSpeak, _hobbies = hobbies, _suspended = suspended, _suspendedUntil = suspendedUntil, _reporting = reporting, _openDiscussion = openDiscussion, _privacy = privacy, _photo = photo, _isConnected = isConnected, _isAdminWaaa = isAdminWaaa, _createdAt = createdAt, _friendsSender = friendsSender, _friendsReceiver = friendsReceiver, _trips = trips, _events = events, _eventCoowner = eventCoowner, _tripParticipation = tripParticipation, _eventParticipation = eventParticipation, _offerParticipation = offerParticipation, _messages = messages, _conversations = conversations, _updatedAt = updatedAt;
  
  factory User({String? id, String? cognitoUserPoolId, required String username, String? role, Gender? gender, Gender? lookingFor, amplify_core.TemporalDate? birthday, String? country, String? city, String? bio, String? nativeLanguage, List<String>? languagesSpeak, List<HobbyOfUser>? hobbies, bool? suspended, amplify_core.TemporalTimestamp? suspendedUntil, int? reporting, bool? openDiscussion, bool? privacy, String? photo, bool? isConnected, bool? isAdminWaaa, amplify_core.TemporalDateTime? createdAt, List<Friendship>? friendsSender, List<Friendship>? friendsReceiver, List<Trip>? trips, List<Event>? events, List<EventCoowner>? eventCoowner, List<TripParticipant>? tripParticipation, List<EventParticipant>? eventParticipation, List<OfferParticipants>? offerParticipation, List<Message>? messages, List<UserConversations>? conversations}) {
    return User._internal(
      id: id == null ? amplify_core.UUID.getUUID() : id,
      cognitoUserPoolId: cognitoUserPoolId,
      username: username,
      role: role,
      gender: gender,
      lookingFor: lookingFor,
      birthday: birthday,
      country: country,
      city: city,
      bio: bio,
      nativeLanguage: nativeLanguage,
      languagesSpeak: languagesSpeak != null ? List<String>.unmodifiable(languagesSpeak) : languagesSpeak,
      hobbies: hobbies != null ? List<HobbyOfUser>.unmodifiable(hobbies) : hobbies,
      suspended: suspended,
      suspendedUntil: suspendedUntil,
      reporting: reporting,
      openDiscussion: openDiscussion,
      privacy: privacy,
      photo: photo,
      isConnected: isConnected,
      isAdminWaaa: isAdminWaaa,
      createdAt: createdAt,
      friendsSender: friendsSender != null ? List<Friendship>.unmodifiable(friendsSender) : friendsSender,
      friendsReceiver: friendsReceiver != null ? List<Friendship>.unmodifiable(friendsReceiver) : friendsReceiver,
      trips: trips != null ? List<Trip>.unmodifiable(trips) : trips,
      events: events != null ? List<Event>.unmodifiable(events) : events,
      eventCoowner: eventCoowner != null ? List<EventCoowner>.unmodifiable(eventCoowner) : eventCoowner,
      tripParticipation: tripParticipation != null ? List<TripParticipant>.unmodifiable(tripParticipation) : tripParticipation,
      eventParticipation: eventParticipation != null ? List<EventParticipant>.unmodifiable(eventParticipation) : eventParticipation,
      offerParticipation: offerParticipation != null ? List<OfferParticipants>.unmodifiable(offerParticipation) : offerParticipation,
      messages: messages != null ? List<Message>.unmodifiable(messages) : messages,
      conversations: conversations != null ? List<UserConversations>.unmodifiable(conversations) : conversations);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is User &&
      id == other.id &&
      _cognitoUserPoolId == other._cognitoUserPoolId &&
      _username == other._username &&
      _role == other._role &&
      _gender == other._gender &&
      _lookingFor == other._lookingFor &&
      _birthday == other._birthday &&
      _country == other._country &&
      _city == other._city &&
      _bio == other._bio &&
      _nativeLanguage == other._nativeLanguage &&
      DeepCollectionEquality().equals(_languagesSpeak, other._languagesSpeak) &&
      DeepCollectionEquality().equals(_hobbies, other._hobbies) &&
      _suspended == other._suspended &&
      _suspendedUntil == other._suspendedUntil &&
      _reporting == other._reporting &&
      _openDiscussion == other._openDiscussion &&
      _privacy == other._privacy &&
      _photo == other._photo &&
      _isConnected == other._isConnected &&
      _isAdminWaaa == other._isAdminWaaa &&
      _createdAt == other._createdAt &&
      DeepCollectionEquality().equals(_friendsSender, other._friendsSender) &&
      DeepCollectionEquality().equals(_friendsReceiver, other._friendsReceiver) &&
      DeepCollectionEquality().equals(_trips, other._trips) &&
      DeepCollectionEquality().equals(_events, other._events) &&
      DeepCollectionEquality().equals(_eventCoowner, other._eventCoowner) &&
      DeepCollectionEquality().equals(_tripParticipation, other._tripParticipation) &&
      DeepCollectionEquality().equals(_eventParticipation, other._eventParticipation) &&
      DeepCollectionEquality().equals(_offerParticipation, other._offerParticipation) &&
      DeepCollectionEquality().equals(_messages, other._messages) &&
      DeepCollectionEquality().equals(_conversations, other._conversations);
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("User {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("cognitoUserPoolId=" + "$_cognitoUserPoolId" + ", ");
    buffer.write("username=" + "$_username" + ", ");
    buffer.write("role=" + "$_role" + ", ");
    buffer.write("gender=" + (_gender != null ? amplify_core.enumToString(_gender)! : "null") + ", ");
    buffer.write("lookingFor=" + (_lookingFor != null ? amplify_core.enumToString(_lookingFor)! : "null") + ", ");
    buffer.write("birthday=" + (_birthday != null ? _birthday!.format() : "null") + ", ");
    buffer.write("country=" + "$_country" + ", ");
    buffer.write("city=" + "$_city" + ", ");
    buffer.write("bio=" + "$_bio" + ", ");
    buffer.write("nativeLanguage=" + "$_nativeLanguage" + ", ");
    buffer.write("languagesSpeak=" + (_languagesSpeak != null ? _languagesSpeak!.toString() : "null") + ", ");
    buffer.write("suspended=" + (_suspended != null ? _suspended!.toString() : "null") + ", ");
    buffer.write("suspendedUntil=" + (_suspendedUntil != null ? _suspendedUntil!.toString() : "null") + ", ");
    buffer.write("reporting=" + (_reporting != null ? _reporting!.toString() : "null") + ", ");
    buffer.write("openDiscussion=" + (_openDiscussion != null ? _openDiscussion!.toString() : "null") + ", ");
    buffer.write("privacy=" + (_privacy != null ? _privacy!.toString() : "null") + ", ");
    buffer.write("photo=" + "$_photo" + ", ");
    buffer.write("isConnected=" + (_isConnected != null ? _isConnected!.toString() : "null") + ", ");
    buffer.write("isAdminWaaa=" + (_isAdminWaaa != null ? _isAdminWaaa!.toString() : "null") + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  User copyWith({String? cognitoUserPoolId, String? username, String? role, Gender? gender, Gender? lookingFor, amplify_core.TemporalDate? birthday, String? country, String? city, String? bio, String? nativeLanguage, List<String>? languagesSpeak, List<HobbyOfUser>? hobbies, bool? suspended, amplify_core.TemporalTimestamp? suspendedUntil, int? reporting, bool? openDiscussion, bool? privacy, String? photo, bool? isConnected, bool? isAdminWaaa, amplify_core.TemporalDateTime? createdAt, List<Friendship>? friendsSender, List<Friendship>? friendsReceiver, List<Trip>? trips, List<Event>? events, List<EventCoowner>? eventCoowner, List<TripParticipant>? tripParticipation, List<EventParticipant>? eventParticipation, List<OfferParticipants>? offerParticipation, List<Message>? messages, List<UserConversations>? conversations}) {
    return User._internal(
      id: id,
      cognitoUserPoolId: cognitoUserPoolId ?? this.cognitoUserPoolId,
      username: username ?? this.username,
      role: role ?? this.role,
      gender: gender ?? this.gender,
      lookingFor: lookingFor ?? this.lookingFor,
      birthday: birthday ?? this.birthday,
      country: country ?? this.country,
      city: city ?? this.city,
      bio: bio ?? this.bio,
      nativeLanguage: nativeLanguage ?? this.nativeLanguage,
      languagesSpeak: languagesSpeak ?? this.languagesSpeak,
      hobbies: hobbies ?? this.hobbies,
      suspended: suspended ?? this.suspended,
      suspendedUntil: suspendedUntil ?? this.suspendedUntil,
      reporting: reporting ?? this.reporting,
      openDiscussion: openDiscussion ?? this.openDiscussion,
      privacy: privacy ?? this.privacy,
      photo: photo ?? this.photo,
      isConnected: isConnected ?? this.isConnected,
      isAdminWaaa: isAdminWaaa ?? this.isAdminWaaa,
      createdAt: createdAt ?? this.createdAt,
      friendsSender: friendsSender ?? this.friendsSender,
      friendsReceiver: friendsReceiver ?? this.friendsReceiver,
      trips: trips ?? this.trips,
      events: events ?? this.events,
      eventCoowner: eventCoowner ?? this.eventCoowner,
      tripParticipation: tripParticipation ?? this.tripParticipation,
      eventParticipation: eventParticipation ?? this.eventParticipation,
      offerParticipation: offerParticipation ?? this.offerParticipation,
      messages: messages ?? this.messages,
      conversations: conversations ?? this.conversations);
  }
  
  User copyWithModelFieldValues({
    ModelFieldValue<String?>? cognitoUserPoolId,
    ModelFieldValue<String>? username,
    ModelFieldValue<String?>? role,
    ModelFieldValue<Gender?>? gender,
    ModelFieldValue<Gender?>? lookingFor,
    ModelFieldValue<amplify_core.TemporalDate?>? birthday,
    ModelFieldValue<String?>? country,
    ModelFieldValue<String?>? city,
    ModelFieldValue<String?>? bio,
    ModelFieldValue<String?>? nativeLanguage,
    ModelFieldValue<List<String>?>? languagesSpeak,
    ModelFieldValue<List<HobbyOfUser>?>? hobbies,
    ModelFieldValue<bool?>? suspended,
    ModelFieldValue<amplify_core.TemporalTimestamp?>? suspendedUntil,
    ModelFieldValue<int?>? reporting,
    ModelFieldValue<bool?>? openDiscussion,
    ModelFieldValue<bool?>? privacy,
    ModelFieldValue<String?>? photo,
    ModelFieldValue<bool?>? isConnected,
    ModelFieldValue<bool?>? isAdminWaaa,
    ModelFieldValue<amplify_core.TemporalDateTime?>? createdAt,
    ModelFieldValue<List<Friendship>?>? friendsSender,
    ModelFieldValue<List<Friendship>?>? friendsReceiver,
    ModelFieldValue<List<Trip>?>? trips,
    ModelFieldValue<List<Event>?>? events,
    ModelFieldValue<List<EventCoowner>?>? eventCoowner,
    ModelFieldValue<List<TripParticipant>?>? tripParticipation,
    ModelFieldValue<List<EventParticipant>?>? eventParticipation,
    ModelFieldValue<List<OfferParticipants>?>? offerParticipation,
    ModelFieldValue<List<Message>?>? messages,
    ModelFieldValue<List<UserConversations>?>? conversations
  }) {
    return User._internal(
      id: id,
      cognitoUserPoolId: cognitoUserPoolId == null ? this.cognitoUserPoolId : cognitoUserPoolId.value,
      username: username == null ? this.username : username.value,
      role: role == null ? this.role : role.value,
      gender: gender == null ? this.gender : gender.value,
      lookingFor: lookingFor == null ? this.lookingFor : lookingFor.value,
      birthday: birthday == null ? this.birthday : birthday.value,
      country: country == null ? this.country : country.value,
      city: city == null ? this.city : city.value,
      bio: bio == null ? this.bio : bio.value,
      nativeLanguage: nativeLanguage == null ? this.nativeLanguage : nativeLanguage.value,
      languagesSpeak: languagesSpeak == null ? this.languagesSpeak : languagesSpeak.value,
      hobbies: hobbies == null ? this.hobbies : hobbies.value,
      suspended: suspended == null ? this.suspended : suspended.value,
      suspendedUntil: suspendedUntil == null ? this.suspendedUntil : suspendedUntil.value,
      reporting: reporting == null ? this.reporting : reporting.value,
      openDiscussion: openDiscussion == null ? this.openDiscussion : openDiscussion.value,
      privacy: privacy == null ? this.privacy : privacy.value,
      photo: photo == null ? this.photo : photo.value,
      isConnected: isConnected == null ? this.isConnected : isConnected.value,
      isAdminWaaa: isAdminWaaa == null ? this.isAdminWaaa : isAdminWaaa.value,
      createdAt: createdAt == null ? this.createdAt : createdAt.value,
      friendsSender: friendsSender == null ? this.friendsSender : friendsSender.value,
      friendsReceiver: friendsReceiver == null ? this.friendsReceiver : friendsReceiver.value,
      trips: trips == null ? this.trips : trips.value,
      events: events == null ? this.events : events.value,
      eventCoowner: eventCoowner == null ? this.eventCoowner : eventCoowner.value,
      tripParticipation: tripParticipation == null ? this.tripParticipation : tripParticipation.value,
      eventParticipation: eventParticipation == null ? this.eventParticipation : eventParticipation.value,
      offerParticipation: offerParticipation == null ? this.offerParticipation : offerParticipation.value,
      messages: messages == null ? this.messages : messages.value,
      conversations: conversations == null ? this.conversations : conversations.value
    );
  }
  
  User.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _cognitoUserPoolId = json['cognitoUserPoolId'],
      _username = json['username'],
      _role = json['role'],
      _gender = amplify_core.enumFromString<Gender>(json['gender'], Gender.values),
      _lookingFor = amplify_core.enumFromString<Gender>(json['lookingFor'], Gender.values),
      _birthday = json['birthday'] != null ? amplify_core.TemporalDate.fromString(json['birthday']) : null,
      _country = json['country'],
      _city = json['city'],
      _bio = json['bio'],
      _nativeLanguage = json['nativeLanguage'],
      _languagesSpeak = json['languagesSpeak']?.cast<String>(),
      _hobbies = json['hobbies'] is List
        ? (json['hobbies'] as List)
          .where((e) => e?['serializedData'] != null)
          .map((e) => HobbyOfUser.fromJson(new Map<String, dynamic>.from(e['serializedData'])))
          .toList()
        : null,
      _suspended = json['suspended'],
      _suspendedUntil = json['suspendedUntil'] != null ? amplify_core.TemporalTimestamp.fromSeconds(json['suspendedUntil']) : null,
      _reporting = (json['reporting'] as num?)?.toInt(),
      _openDiscussion = json['openDiscussion'],
      _privacy = json['privacy'],
      _photo = json['photo'],
      _isConnected = json['isConnected'],
      _isAdminWaaa = json['isAdminWaaa'],
      _createdAt = json['createdAt'] != null ? amplify_core.TemporalDateTime.fromString(json['createdAt']) : null,
      _friendsSender = json['friendsSender'] is List
        ? (json['friendsSender'] as List)
          .where((e) => e?['serializedData'] != null)
          .map((e) => Friendship.fromJson(new Map<String, dynamic>.from(e['serializedData'])))
          .toList()
        : null,
      _friendsReceiver = json['friendsReceiver'] is List
        ? (json['friendsReceiver'] as List)
          .where((e) => e?['serializedData'] != null)
          .map((e) => Friendship.fromJson(new Map<String, dynamic>.from(e['serializedData'])))
          .toList()
        : null,
      _trips = json['trips'] is List
        ? (json['trips'] as List)
          .where((e) => e?['serializedData'] != null)
          .map((e) => Trip.fromJson(new Map<String, dynamic>.from(e['serializedData'])))
          .toList()
        : null,
      _events = json['events'] is List
        ? (json['events'] as List)
          .where((e) => e?['serializedData'] != null)
          .map((e) => Event.fromJson(new Map<String, dynamic>.from(e['serializedData'])))
          .toList()
        : null,
      _eventCoowner = json['eventCoowner'] is List
        ? (json['eventCoowner'] as List)
          .where((e) => e?['serializedData'] != null)
          .map((e) => EventCoowner.fromJson(new Map<String, dynamic>.from(e['serializedData'])))
          .toList()
        : null,
      _tripParticipation = json['tripParticipation'] is List
        ? (json['tripParticipation'] as List)
          .where((e) => e?['serializedData'] != null)
          .map((e) => TripParticipant.fromJson(new Map<String, dynamic>.from(e['serializedData'])))
          .toList()
        : null,
      _eventParticipation = json['eventParticipation'] is List
        ? (json['eventParticipation'] as List)
          .where((e) => e?['serializedData'] != null)
          .map((e) => EventParticipant.fromJson(new Map<String, dynamic>.from(e['serializedData'])))
          .toList()
        : null,
      _offerParticipation = json['offerParticipation'] is List
        ? (json['offerParticipation'] as List)
          .where((e) => e?['serializedData'] != null)
          .map((e) => OfferParticipants.fromJson(new Map<String, dynamic>.from(e['serializedData'])))
          .toList()
        : null,
      _messages = json['messages'] is List
        ? (json['messages'] as List)
          .where((e) => e?['serializedData'] != null)
          .map((e) => Message.fromJson(new Map<String, dynamic>.from(e['serializedData'])))
          .toList()
        : null,
      _conversations = json['conversations'] is List
        ? (json['conversations'] as List)
          .where((e) => e?['serializedData'] != null)
          .map((e) => UserConversations.fromJson(new Map<String, dynamic>.from(e['serializedData'])))
          .toList()
        : null,
      _updatedAt = json['updatedAt'] != null ? amplify_core.TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'cognitoUserPoolId': _cognitoUserPoolId, 'username': _username, 'role': _role, 'gender': amplify_core.enumToString(_gender), 'lookingFor': amplify_core.enumToString(_lookingFor), 'birthday': _birthday?.format(), 'country': _country, 'city': _city, 'bio': _bio, 'nativeLanguage': _nativeLanguage, 'languagesSpeak': _languagesSpeak, 'hobbies': _hobbies?.map((HobbyOfUser? e) => e?.toJson()).toList(), 'suspended': _suspended, 'suspendedUntil': _suspendedUntil?.toSeconds(), 'reporting': _reporting, 'openDiscussion': _openDiscussion, 'privacy': _privacy, 'photo': _photo, 'isConnected': _isConnected, 'isAdminWaaa': _isAdminWaaa, 'createdAt': _createdAt?.format(), 'friendsSender': _friendsSender?.map((Friendship? e) => e?.toJson()).toList(), 'friendsReceiver': _friendsReceiver?.map((Friendship? e) => e?.toJson()).toList(), 'trips': _trips?.map((Trip? e) => e?.toJson()).toList(), 'events': _events?.map((Event? e) => e?.toJson()).toList(), 'eventCoowner': _eventCoowner?.map((EventCoowner? e) => e?.toJson()).toList(), 'tripParticipation': _tripParticipation?.map((TripParticipant? e) => e?.toJson()).toList(), 'eventParticipation': _eventParticipation?.map((EventParticipant? e) => e?.toJson()).toList(), 'offerParticipation': _offerParticipation?.map((OfferParticipants? e) => e?.toJson()).toList(), 'messages': _messages?.map((Message? e) => e?.toJson()).toList(), 'conversations': _conversations?.map((UserConversations? e) => e?.toJson()).toList(), 'updatedAt': _updatedAt?.format()
  };
  
  Map<String, Object?> toMap() => {
    'id': id,
    'cognitoUserPoolId': _cognitoUserPoolId,
    'username': _username,
    'role': _role,
    'gender': _gender,
    'lookingFor': _lookingFor,
    'birthday': _birthday,
    'country': _country,
    'city': _city,
    'bio': _bio,
    'nativeLanguage': _nativeLanguage,
    'languagesSpeak': _languagesSpeak,
    'hobbies': _hobbies,
    'suspended': _suspended,
    'suspendedUntil': _suspendedUntil,
    'reporting': _reporting,
    'openDiscussion': _openDiscussion,
    'privacy': _privacy,
    'photo': _photo,
    'isConnected': _isConnected,
    'isAdminWaaa': _isAdminWaaa,
    'createdAt': _createdAt,
    'friendsSender': _friendsSender,
    'friendsReceiver': _friendsReceiver,
    'trips': _trips,
    'events': _events,
    'eventCoowner': _eventCoowner,
    'tripParticipation': _tripParticipation,
    'eventParticipation': _eventParticipation,
    'offerParticipation': _offerParticipation,
    'messages': _messages,
    'conversations': _conversations,
    'updatedAt': _updatedAt
  };

  static final amplify_core.QueryModelIdentifier<UserModelIdentifier> MODEL_IDENTIFIER = amplify_core.QueryModelIdentifier<UserModelIdentifier>();
  static final ID = amplify_core.QueryField(fieldName: "id");
  static final COGNITOUSERPOOLID = amplify_core.QueryField(fieldName: "cognitoUserPoolId");
  static final USERNAME = amplify_core.QueryField(fieldName: "username");
  static final ROLE = amplify_core.QueryField(fieldName: "role");
  static final GENDER = amplify_core.QueryField(fieldName: "gender");
  static final LOOKINGFOR = amplify_core.QueryField(fieldName: "lookingFor");
  static final BIRTHDAY = amplify_core.QueryField(fieldName: "birthday");
  static final COUNTRY = amplify_core.QueryField(fieldName: "country");
  static final CITY = amplify_core.QueryField(fieldName: "city");
  static final BIO = amplify_core.QueryField(fieldName: "bio");
  static final NATIVELANGUAGE = amplify_core.QueryField(fieldName: "nativeLanguage");
  static final LANGUAGESSPEAK = amplify_core.QueryField(fieldName: "languagesSpeak");
  static final HOBBIES = amplify_core.QueryField(
    fieldName: "hobbies",
    fieldType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.model, ofModelName: 'HobbyOfUser'));
  static final SUSPENDED = amplify_core.QueryField(fieldName: "suspended");
  static final SUSPENDEDUNTIL = amplify_core.QueryField(fieldName: "suspendedUntil");
  static final REPORTING = amplify_core.QueryField(fieldName: "reporting");
  static final OPENDISCUSSION = amplify_core.QueryField(fieldName: "openDiscussion");
  static final PRIVACY = amplify_core.QueryField(fieldName: "privacy");
  static final PHOTO = amplify_core.QueryField(fieldName: "photo");
  static final ISCONNECTED = amplify_core.QueryField(fieldName: "isConnected");
  static final ISADMINWAAA = amplify_core.QueryField(fieldName: "isAdminWaaa");
  static final CREATEDAT = amplify_core.QueryField(fieldName: "createdAt");
  static final FRIENDSSENDER = amplify_core.QueryField(
    fieldName: "friendsSender",
    fieldType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.model, ofModelName: 'Friendship'));
  static final FRIENDSRECEIVER = amplify_core.QueryField(
    fieldName: "friendsReceiver",
    fieldType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.model, ofModelName: 'Friendship'));
  static final TRIPS = amplify_core.QueryField(
    fieldName: "trips",
    fieldType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.model, ofModelName: 'Trip'));
  static final EVENTS = amplify_core.QueryField(
    fieldName: "events",
    fieldType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.model, ofModelName: 'Event'));
  static final EVENTCOOWNER = amplify_core.QueryField(
    fieldName: "eventCoowner",
    fieldType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.model, ofModelName: 'EventCoowner'));
  static final TRIPPARTICIPATION = amplify_core.QueryField(
    fieldName: "tripParticipation",
    fieldType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.model, ofModelName: 'TripParticipant'));
  static final EVENTPARTICIPATION = amplify_core.QueryField(
    fieldName: "eventParticipation",
    fieldType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.model, ofModelName: 'EventParticipant'));
  static final OFFERPARTICIPATION = amplify_core.QueryField(
    fieldName: "offerParticipation",
    fieldType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.model, ofModelName: 'OfferParticipants'));
  static final MESSAGES = amplify_core.QueryField(
    fieldName: "messages",
    fieldType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.model, ofModelName: 'Message'));
  static final CONVERSATIONS = amplify_core.QueryField(
    fieldName: "conversations",
    fieldType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.model, ofModelName: 'UserConversations'));
  static var schema = amplify_core.Model.defineSchema(define: (amplify_core.ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "User";
    modelSchemaDefinition.pluralName = "Users";
    
    modelSchemaDefinition.indexes = [
      amplify_core.ModelIndex(fields: const ["cognitoUserPoolId"], name: "UsersByCognitoID"),
      amplify_core.ModelIndex(fields: const ["username"], name: "UsersByUsername")
    ];
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.id());
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: User.COGNITOUSERPOOLID,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: User.USERNAME,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: User.ROLE,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: User.GENDER,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.enumeration)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: User.LOOKINGFOR,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.enumeration)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: User.BIRTHDAY,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.date)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: User.COUNTRY,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: User.CITY,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: User.BIO,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: User.NATIVELANGUAGE,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: User.LANGUAGESSPEAK,
      isRequired: false,
      isArray: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.collection, ofModelName: amplify_core.ModelFieldTypeEnum.string.name)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.hasMany(
      key: User.HOBBIES,
      isRequired: false,
      ofModelName: 'HobbyOfUser',
      associatedKey: HobbyOfUser.USER
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: User.SUSPENDED,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.bool)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: User.SUSPENDEDUNTIL,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.timestamp)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: User.REPORTING,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: User.OPENDISCUSSION,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.bool)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: User.PRIVACY,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.bool)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: User.PHOTO,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: User.ISCONNECTED,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.bool)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: User.ISADMINWAAA,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.bool)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: User.CREATEDAT,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.dateTime)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.hasMany(
      key: User.FRIENDSSENDER,
      isRequired: false,
      ofModelName: 'Friendship',
      associatedKey: Friendship.SENDER
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.hasMany(
      key: User.FRIENDSRECEIVER,
      isRequired: false,
      ofModelName: 'Friendship',
      associatedKey: Friendship.RECEIVER
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.hasMany(
      key: User.TRIPS,
      isRequired: false,
      ofModelName: 'Trip',
      associatedKey: Trip.OWNER
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.hasMany(
      key: User.EVENTS,
      isRequired: false,
      ofModelName: 'Event',
      associatedKey: Event.OWNER
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.hasMany(
      key: User.EVENTCOOWNER,
      isRequired: false,
      ofModelName: 'EventCoowner',
      associatedKey: EventCoowner.USER
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.hasMany(
      key: User.TRIPPARTICIPATION,
      isRequired: false,
      ofModelName: 'TripParticipant',
      associatedKey: TripParticipant.USER
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.hasMany(
      key: User.EVENTPARTICIPATION,
      isRequired: false,
      ofModelName: 'EventParticipant',
      associatedKey: EventParticipant.USER
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.hasMany(
      key: User.OFFERPARTICIPATION,
      isRequired: false,
      ofModelName: 'OfferParticipants',
      associatedKey: OfferParticipants.USER
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.hasMany(
      key: User.MESSAGES,
      isRequired: false,
      ofModelName: 'Message',
      associatedKey: Message.AUTHOR
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.hasMany(
      key: User.CONVERSATIONS,
      isRequired: false,
      ofModelName: 'UserConversations',
      associatedKey: UserConversations.USER
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.nonQueryField(
      fieldName: 'updatedAt',
      isRequired: false,
      isReadOnly: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.dateTime)
    ));
  });
}

class _UserModelType extends amplify_core.ModelType<User> {
  const _UserModelType();
  
  @override
  User fromJson(Map<String, dynamic> jsonData) {
    return User.fromJson(jsonData);
  }
  
  @override
  String modelName() {
    return 'User';
  }
}

/**
 * This is an auto generated class representing the model identifier
 * of [User] in your schema.
 */
class UserModelIdentifier implements amplify_core.ModelIdentifier<User> {
  final String id;

  /** Create an instance of UserModelIdentifier using [id] the primary key. */
  const UserModelIdentifier({
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
  String toString() => 'UserModelIdentifier(id: $id)';
  
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    
    return other is UserModelIdentifier &&
      id == other.id;
  }
  
  @override
  int get hashCode =>
    id.hashCode;
}