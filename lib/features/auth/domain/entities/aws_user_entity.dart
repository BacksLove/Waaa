import 'package:equatable/equatable.dart';

import '../../../../core/enums/gender.dart';
import '../../../hobbies/domain/entities/hobby.dart';

class AwsUser extends Equatable {

  final String email;
  final String? password;

  const AwsUser({required this.email, this.password});

  @override
  List<Object?> get props => [email, password];

}
