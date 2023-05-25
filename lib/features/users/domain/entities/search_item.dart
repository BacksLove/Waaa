// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:waaa/models/Gender.dart';

class SearchItem {
  final String? username;
  final String? localisation;
  final List<String>? typeOfTravel;
  final List<String>? nationalities;
  final int? minAge;
  final int? maxAge;
  final Gender? gender;

  SearchItem({
    this.username,
    this.localisation,
    this.typeOfTravel,
    this.nationalities,
    this.minAge,
    this.maxAge,
    this.gender,
  });

  SearchItem copyWith({
    String? username,
    String? localisation,
    List<String>? typeOfTravel,
    List<String>? nationalities,
    int? minAge,
    int? maxAge,
    Gender? gender,
  }) {
    return SearchItem(
      username: username ?? this.username,
      localisation: localisation ?? this.localisation,
      typeOfTravel: typeOfTravel ?? this.typeOfTravel,
      nationalities: nationalities ?? this.nationalities,
      minAge: minAge ?? this.minAge,
      maxAge: maxAge ?? this.maxAge,
      gender: gender ?? this.gender,
    );
  }
}
