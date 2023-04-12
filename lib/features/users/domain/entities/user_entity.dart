import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../../core/enums/gender_enum.dart';
import '../../../hobbies/domain/entities/hobby.dart';

part 'user_entity.g.dart';

@JsonSerializable(explicitToJson: true)
class User extends Equatable {
  final String? id;
  final String? role;
  final Gender? gender;
  final Gender? lookingFor;
  final DateTime? birthday;
  final String username;
  final String? bio;
  final String? nativeLanguage;
  final List<String>? languagesSpeak;
  final List<Hobby>? hobbies;
  final bool suspended = false;
  final DateTime? suspendedUntil;
  final int? reporting;
  final bool? openDiscussion;
  final bool? privacy;
  final String? photo;
  final DateTime? createdAt;

  const User(
      {this.id,
      this.role,
      this.gender,
      this.lookingFor,
      this.birthday,
      required this.username,
      this.bio,
      this.nativeLanguage,
      this.languagesSpeak,
      this.hobbies,
      this.suspendedUntil,
      this.reporting,
      this.openDiscussion,
      this.privacy,
      this.photo,
      this.createdAt})
      : super();

  @override
  List<Object?> get props => [];

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
