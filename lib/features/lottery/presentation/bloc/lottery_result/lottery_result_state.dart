part of 'lottery_result_bloc.dart';

class LotteryResultState extends Equatable {
  final OffersResultEnum status;
  final Offer currentOffer;
  final List<Offer> offersList;
  final int carouselSelectedIndex;
  final List<User> winnerList;
  final List<User> waitingList;
  final bool toogleWinner;

  const LotteryResultState({
    required this.status,
    required this.currentOffer,
    required this.offersList,
    required this.carouselSelectedIndex,
    required this.winnerList,
    required this.waitingList,
    required this.toogleWinner,
  });

  factory LotteryResultState.initial() => LotteryResultState(
        status: OffersResultEnum.undraw,
        currentOffer: Offer(
            title: "",
            price: 10,
            publicationDate: TemporalDateTime(DateTime.now()),
            country: "",
            city: "",
            nbWinners: 10),
        offersList: const [],
        carouselSelectedIndex: 0,
        winnerList: const [],
        waitingList: const [],
        toogleWinner: true,
      );

  @override
  List<Object> get props => [
        status,
        currentOffer,
        offersList,
        carouselSelectedIndex,
        winnerList,
        waitingList,
        toogleWinner
      ];

  LotteryResultState copyWith({
    OffersResultEnum? status,
    Offer? currentOffer,
    List<Offer>? offersList,
    int? carouselSelectedIndex,
    List<User>? winnerList,
    List<User>? waitingList,
    bool? toogleWinner,
  }) {
    return LotteryResultState(
      status: status ?? this.status,
      currentOffer: currentOffer ?? this.currentOffer,
      offersList: offersList ?? this.offersList,
      carouselSelectedIndex:
          carouselSelectedIndex ?? this.carouselSelectedIndex,
      winnerList: winnerList ?? this.winnerList,
      waitingList: waitingList ?? this.waitingList,
      toogleWinner: toogleWinner ?? this.toogleWinner,
    );
  }
}
