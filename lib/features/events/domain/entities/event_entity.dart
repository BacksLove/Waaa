// // ignore_for_file: public_member_api_docs, sort_constructors_first
// import 'package:equatable/equatable.dart';
// import 'package:intl/intl.dart';
// import 'package:json_annotation/json_annotation.dart';

// import 'package:waaa/features/users/domain/entities/user_entity.dart';

// part 'event_entity.g.dart';

// @JsonSerializable(explicitToJson: true)
// class Event extends Equatable {
//   final String? id;
//   final String name;
//   final String? description;
//   final List<User>? participants;
//   final String address;
//   final String country;
//   final String city;
//   final DateTime begin;
//   final DateTime end;
//   final DateTime createdAt;
//   final DateTime? updatedAt;
//   final int hourBegin;
//   final int? hourEnd;
//   final int maxParticipants;
//   final int minParticipants;
//   final bool isPublic;
//   final String mainPhoto;
//   final int? minAgeRestriction;
//   final String? language;
//   final List<String>? photos;

//   const Event({
//     this.id,
//     required this.name,
//     this.description,
//     this.participants,
//     required this.address,
//     required this.country,
//     required this.city,
//     required this.begin,
//     required this.end,
//     required this.createdAt,
//     this.updatedAt,
//     required this.hourBegin,
//     this.hourEnd,
//     required this.maxParticipants,
//     required this.minParticipants,
//     required this.isPublic,
//     required this.mainPhoto,
//     this.minAgeRestriction,
//     this.language,
//     this.photos,
//   });

//   factory Event.empty() => Event(
//         name: "",
//         address: "",
//         country: "",
//         city: "",
//         begin: DateTime.now(),
//         end: DateTime.now(),
//         createdAt: DateTime.now(),
//         hourBegin: 0,
//         maxParticipants: 0,
//         minParticipants: 0,
//         isPublic: true,
//         mainPhoto: "",
//       );

//   @override
//   List<Object> get props {
//     return [
//       name,
//       address,
//       country,
//       city,
//       begin,
//       end,
//       createdAt,
//       hourBegin,
//       maxParticipants,
//       minParticipants,
//       isPublic,
//       mainPhoto,
//     ];
//   }

//   factory Event.fromJson(Map<String, dynamic> json) => _$EventFromJson(json);

//   Map<String, dynamic> toJson() => _$EventToJson(this);

//   String getStartDate() {
//     return DateFormat("dd/MM/yyyy").format(begin);
//   }

//   String getStartHour() {
//     if (hourBegin < 10) {
//       return "0$hourBegin";
//     }
//     return hourBegin.toString();
//   }

//   String getEndDate() {
//     return DateFormat("dd/MM/yyyy").format(end);
//   }

//   String getEndHour() {
//     if (hourEnd == null) return "";

//     if (hourEnd! < 10) {
//       return "0$hourEnd";
//     }
//     return hourBegin.toString();
//   }
// }
