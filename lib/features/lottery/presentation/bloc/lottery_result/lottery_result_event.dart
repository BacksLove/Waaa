part of 'lottery_result_bloc.dart';

abstract class LotteryResultEvent extends Equatable {
  const LotteryResultEvent();

  @override
  List<Object> get props => [];
}

class LotteryResultToggle extends LotteryResultEvent {
  final bool toggle;

  const LotteryResultToggle({required this.toggle});
}

class LotteryResultLoadData extends LotteryResultEvent {
  final String offerId;

  const LotteryResultLoadData({required this.offerId});
}

class LotteryResultIndexChanged extends LotteryResultEvent {
  final int index;

  const LotteryResultIndexChanged({required this.index});
}
