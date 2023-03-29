import 'package:json_annotation/json_annotation.dart';
import 'package:waaa/features/users/domain/entities/user_entity.dart';

class UserModel extends User {

  final String? cognitoUserPoolId;

  const UserModel({super.id, this.cognitoUserPoolId,super.role, super.gender, super.lookingFor, super.birthday, required super.username, super.bio, super.nativeLanguage, super.languagesSpeak, super.hobbies, super.suspendedUntil, super.reporting, super.openDiscussion, super.privacy, super.photoUrl, super.createdAt});


}
