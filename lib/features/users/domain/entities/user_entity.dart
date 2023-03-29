import 'package:equatable/equatable.dart';

import '../../../../core/enums/gender.dart';
import '../../../hobbies/domain/entities/hobby.dart';

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
  final String? photoUrl;
  final DateTime? createdAt;

  const User({this.id, this.role, this.gender, this.lookingFor, this.birthday, required this.username, this.bio, this.nativeLanguage, this.languagesSpeak, this.hobbies, this.suspendedUntil, this.reporting, this.openDiscussion, this.privacy, this.photoUrl, this.createdAt}) : super();

  @override
  List<Object?> get props => [];


}