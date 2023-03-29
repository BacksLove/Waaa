import 'package:equatable/equatable.dart';
import 'package:waaa/features/users/domain/entities/user_entity.dart';

class Event extends Equatable {

  final String name;
  final List<User> participants;
  final String address;
  final String country;
  final String city;
  final String photoUrl;

  const Event({required this.name, required this.participants, required this.address, required this.country, required this.city, required this.photoUrl});

  @override
  List<Object?> get props => [name, [participants], address, country, city];

}