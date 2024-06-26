// // ignore_for_file: public_member_api_docs, sort_constructors_first
// import 'package:equatable/equatable.dart';
// import 'package:json_annotation/json_annotation.dart';

// import '../../../../core/enums/gender_enum.dart';
// import '../../../events/domain/entities/event_entity.dart';
// import '../../../hobbies/domain/entities/hobby.dart';

// part 'user_entity.g.dart';

// @JsonSerializable(explicitToJson: true, includeIfNull: false)
// class User extends Equatable {
//   final String? id;
//   final String? cognitoUserPoolId;
//   final String? role;
//   final Gender? gender;
//   final Gender? lookingFor;
//   final DateTime? birthday;
//   final String username;
//   final String? bio;
//   final String? nativeLanguage;
//   final List<String>? languagesSpeak;
//   final List<Hobby>? hobbies;
//   final List<Event>? events;
//   final bool suspended = false;
//   final DateTime? suspendedUntil;
//   final int? reporting;
//   final bool? openDiscussion;
//   final bool? privacy;
//   final String? photo;
//   final DateTime? createdAt;

//   const User(
//       {this.id,
//       this.cognitoUserPoolId,
//       this.role,
//       this.gender,
//       this.lookingFor,
//       this.birthday,
//       required this.username,
//       this.bio,
//       this.nativeLanguage,
//       this.languagesSpeak,
//       this.hobbies,
//       this.events,
//       this.suspendedUntil,
//       this.reporting,
//       this.openDiscussion,
//       this.privacy,
//       this.photo,
//       this.createdAt})
//       : super();

//   factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

//   Map<String, dynamic> toJson() => _$UserToJson(this);

//   @override
//   List<Object> get props {
//     return [
//       username,
//     ];
//   }

//   @override
//   bool get stringify => true;

//   String get age {
//     DateTime today = DateTime.now();
//     int age = 0;
//     if (birthday != null) {
//       int currentMonth = today.month;
//       int currentDay = today.day;
//       int birthMonth = birthday!.month;
//       int birthDay = birthday!.day;
//       age = today.year - birthday!.year;
//       if (currentMonth > birthMonth) {
//         age++;
//       } else if (currentMonth == birthMonth) {
//         if (currentDay < birthDay) {
//           age--;
//         }
//       }
//     }
//     return age.toString();
//   }
// }
