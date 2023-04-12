import 'package:json_annotation/json_annotation.dart';

import '../enums/gender_enum.dart';

@JsonSerializable()
class GenderConverter implements JsonConverter<Gender, String> {
  const GenderConverter();

  @override
  Gender fromJson(String json) {
    switch (json) {
      case 'male':
        return Gender.male;
      case 'female':
        return Gender.female;
      case 'other':
        return Gender.other;
      default:
        throw ArgumentError('Invalid value $json for Gender enum.');
    }
  }

  @override
  String toJson(Gender object) {
    switch (object) {
      case Gender.male:
        return 'male';
      case Gender.female:
        return 'female';
      case Gender.other:
        return 'other';
      default:
        throw ArgumentError('Invalid value $object for Gender enum.');
    }
  }
}
