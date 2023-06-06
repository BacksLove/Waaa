import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:waaa/core/enums/search_enum.dart';
import 'package:waaa/core/util/functions.dart';
import 'package:waaa/core/util/mocks/travels.dart';
import 'package:waaa/features/users/domain/entities/search_item.dart';
import 'package:waaa/features/users/domain/use_cases/search_user.dart';
import 'package:waaa/models/User.dart';

import 'package:waaa/injection_container.dart' as di;

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc() : super(SearchState.initial()) {
    on<SearchEvent>((event, emit) {});
    on<SearchAddCountry>(_onAddCountry);
    on<SearchRemoveCountry>(_onRemoveCountry);
    on<SearchChangeRange>(_onSearchChangeRange);
    on<SearchButtonPressed>(_onSearchButtonPressed);
  }

  void _onAddCountry(SearchAddCountry event, Emitter<SearchState> emit) {
    List<String> countries = List.from(state.nationalities);
    if (event.country.isNotEmpty && !countries.contains(event.country)) {
      countries.add(event.country);
      emit(state.copyWith(nationalities: countries));
    }
  }

  void _onRemoveCountry(SearchRemoveCountry event, Emitter<SearchState> emit) {
    List<String> countries = List.from(state.nationalities);
    if (event.country.isNotEmpty) {
      countries.remove(event.country);
      emit(state.copyWith(nationalities: countries));
    }
  }

  void _onSearchChangeRange(
      SearchChangeRange event, Emitter<SearchState> emit) {
    emit(
      state.copyWith(
        minAge: event.range.start.toInt(),
        maxAge: event.range.end.toInt(),
      ),
    );
    safePrint(
        "minAge = ${event.range.start.toInt()}, maxAge = ${event.range.end.toInt()}");
  }

  void _onSearchButtonPressed(
      SearchButtonPressed event, Emitter<SearchState> emit) async {
    final List<String> typeOfTravel =
        getListFromIndices(event.selectedTypesOfTravel!, mockTravelType);

    final SearchItem searchItem = SearchItem(
      username: event.username,
      localisation: event.localisation,
      typeOfTravel: typeOfTravel,
      nationalities: state.nationalities,
      minAge: state.minAge,
      maxAge: state.maxAge,
    );

    final result = await di
        .sl<SearchUser>()
        .call(SearchUserParams(searchItem: searchItem));

    emit(state.copyWith(status: SearchStatus.succeed, users: result));
  }
}
