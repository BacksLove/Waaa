import 'package:json_annotation/json_annotation.dart';

import '../enums/gender_enum.dart';

@JsonSerializable()
class GenderConverter implements JsonConverter<Gender, String> {
  const GenderConverter();

  @override
  Gender fromJson(String json) {
    switch (json) {
      case 'male':
        return Gender.MALE;
      case 'female':
        return Gender.FEMALE;
      case 'other':
        return Gender.OTHER;
      default:
        throw ArgumentError('Invalid value $json for Gender enum.');
    }
  }

  @override
  String toJson(Gender object) {
    switch (object) {
      case Gender.MALE:
        return 'male';
      case Gender.FEMALE:
        return 'female';
      case Gender.OTHER:
        return 'other';
      default:
        throw ArgumentError('Invalid value $object for Gender enum.');
    }
  }
}
