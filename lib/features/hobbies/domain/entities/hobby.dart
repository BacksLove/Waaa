import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'hobby.g.dart';

@JsonSerializable(explicitToJson: true)
class Hobby extends Equatable {
  final String id;
  final String name;

  const Hobby({required this.id, required this.name});

  @override
  List<Object?> get props => [id, name];

  factory Hobby.fromJson(Map<String, dynamic> json) => _$HobbyFromJson(json);

  Map<String, dynamic> toJson() => _$HobbyToJson(this);
}
