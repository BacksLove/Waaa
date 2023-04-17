// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'package:waaa/features/users/domain/entities/user_entity.dart';

part 'friends_entity.g.dart';

@JsonSerializable(explicitToJson: true)
class Friends extends Equatable {
  final String id;
  final String status;
  final User friend;

  const Friends({required this.id, required this.status, required this.friend});

  @override
  List<Object> get props => [id, status, friend];

  factory Friends.fromJson(Map<String, dynamic> json) =>
      _$FriendsFromJson(json);

  Map<String, dynamic> toJson() => _$FriendsToJson(this);

  @override
  bool get stringify => true;
}
