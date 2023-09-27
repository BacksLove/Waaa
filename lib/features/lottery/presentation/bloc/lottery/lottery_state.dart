part of 'lottery_bloc.dart';

class LotteryState extends Equatable {
  final List<Offer> offersList;
  final int carrouselSelectedIndex;

  const LotteryState(
      {required this.offersList, required this.carrouselSelectedIndex});

  factory LotteryState.initial() =>
      const LotteryState(offersList: [], carrouselSelectedIndex: 0);

  @override
  List<Object> get props => [offersList, carrouselSelectedIndex];

  LotteryState copyWith({
    List<Offer>? offersList,
    int? carrouselSelectedIndex,
  }) {
    return LotteryState(
      offersList: offersList ?? this.offersList,
      carrouselSelectedIndex:
          carrouselSelectedIndex ?? this.carrouselSelectedIndex,
    );
  }
}
