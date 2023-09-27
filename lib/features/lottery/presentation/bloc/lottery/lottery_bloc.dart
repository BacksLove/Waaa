import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:waaa/core/util/mocks/offers.dart';
import 'package:waaa/models/Offer.dart';

part 'lottery_event.dart';
part 'lottery_state.dart';

class LotteryBloc extends Bloc<LotteryEvent, LotteryState> {
  LotteryBloc() : super(LotteryState.initial()) {
    on<LotteryLoadData>(_onLoadData);
    on<LotteryUpdateCarrouselIndex>(_onUpdateCarrouselIndex);
  }

  FutureOr<void> _onLoadData(
      LotteryLoadData event, Emitter<LotteryState> emit) {
    emit(state.copyWith(offersList: mockOffers, carrouselSelectedIndex: 0));
  }

  FutureOr<void> _onUpdateCarrouselIndex(
      LotteryUpdateCarrouselIndex event, Emitter<LotteryState> emit) {
    emit(state.copyWith(carrouselSelectedIndex: event.id));
  }
}
