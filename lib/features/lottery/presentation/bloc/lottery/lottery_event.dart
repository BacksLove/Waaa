part of 'lottery_bloc.dart';

abstract class LotteryEvent extends Equatable {
  const LotteryEvent();

  @override
  List<Object> get props => [];
}

class LotteryUpdateCarrouselIndex extends LotteryEvent {
  final int id;

  const LotteryUpdateCarrouselIndex({required this.id});
}

class LotteryLoadData extends LotteryEvent {}
