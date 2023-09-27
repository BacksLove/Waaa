import 'dart:async';

import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:waaa/core/enums/offers_enum.dart';
import 'package:waaa/core/util/mocks/offers.dart';
import 'package:waaa/models/ModelProvider.dart';

part 'lottery_result_event.dart';
part 'lottery_result_state.dart';

class LotteryResultBloc extends Bloc<LotteryResultEvent, LotteryResultState> {
  LotteryResultBloc() : super(LotteryResultState.initial()) {
    on<LotteryResultLoadData>(_onLoadData);
    on<LotteryResultToggle>(_onToggleChanged);
    on<LotteryResultIndexChanged>(_onIndexChanged);
  }

  FutureOr<void> _onLoadData(
      LotteryResultLoadData event, Emitter<LotteryResultState> emit) async {
    final Offer offer = mockOffers.first;
    final List<Offer> offers = List.from(mockOffers);
    offers.remove(offer);

    emit(state.copyWith(offersList: offers, currentOffer: offer));
  }

  FutureOr<void> _onToggleChanged(
      LotteryResultToggle event, Emitter<LotteryResultState> emit) {
    emit(state.copyWith(toogleWinner: !state.toogleWinner));
  }

  FutureOr<void> _onIndexChanged(
      LotteryResultIndexChanged event, Emitter<LotteryResultState> emit) {
    emit(state.copyWith(carouselSelectedIndex: event.index));
  }
}
