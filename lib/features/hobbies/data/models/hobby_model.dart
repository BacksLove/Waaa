import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/hobby.dart';

part 'hobby_model.g.dart';

@JsonSerializable(explicitToJson: true)
class HobbyModel extends Hobby {
  const HobbyModel({required super.id, required super.name});

  factory HobbyModel.fromJson(Map<String, dynamic> json) => _$HobbyModelFromJson(json);

  Map<String, dynamic> toJson() => _$HobbyModelToJson(this);

}