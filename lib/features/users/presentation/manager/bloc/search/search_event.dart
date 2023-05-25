// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'search_bloc.dart';

abstract class SearchEvent extends Equatable {
  const SearchEvent();

  @override
  List<Object> get props => [];
}

class SearchAddCountry extends SearchEvent {
  final String country;

  const SearchAddCountry({required this.country});
}

class SearchRemoveCountry extends SearchEvent {
  final String country;

  const SearchRemoveCountry({required this.country});
}

class SearchChangeRange extends SearchEvent {
  final RangeValues range;

  const SearchChangeRange({required this.range});
}

class SearchButtonPressed extends SearchEvent {
  final String? username;
  final String? localisation;
  final List<int>? selectedTypesOfTravel;
  final int? selectedGender;

  const SearchButtonPressed({
    this.username,
    this.localisation,
    this.selectedTypesOfTravel,
    this.selectedGender,
  });
}
