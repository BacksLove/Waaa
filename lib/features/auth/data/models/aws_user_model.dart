import '../../../../core/enums/gender.dart';
import '../../../hobbies/domain/entities/hobby.dart';
import '../../domain/entities/aws_user_entity.dart';

class AwsUserModel extends AwsUser {

  final String? id;

  const AwsUserModel({this.id, required super.email});

}



