import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionicons/ionicons.dart';
import 'package:waaa/component/toggle_button.dart';
import 'package:waaa/core/constants/spacer.dart';
import 'package:waaa/core/enums/offers_enum.dart';
import 'package:waaa/core/theme/colors.dart';
import 'package:waaa/core/theme/common_widget/button.dart';
import 'package:waaa/core/theme/text_styles.dart';
import 'package:waaa/core/util/input_converter.dart';
import 'package:waaa/core/util/localized.dart';
import 'package:waaa/features/home/presentation/pages/home_page.dart';
import 'package:waaa/features/lottery/presentation/bloc/lottery_result/lottery_result_bloc.dart';
import 'package:waaa/features/lottery/presentation/widgets/offer_bottom_sheet_widget.dart';
import 'package:waaa/features/lottery/presentation/widgets/offer_caroussel_item_widget.dart';

import 'package:waaa/injection_container.dart' as di;
import 'package:waaa/models/User.dart';

class LotteryResultPage extends StatelessWidget {
  LotteryResultPage({super.key, required this.offerId});

  final String offerId;
  final LotteryResultBloc lotteryResultBloc = di.sl<LotteryResultBloc>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          lotteryResultBloc..add(LotteryResultLoadData(offerId: offerId)),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: transparentColor,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Ionicons.chevron_back),
            color: blackColor,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text(
            localized(context).play_the_lucky_draw,
            style: appBarTextStyle,
          ),
        ),
        body: BlocBuilder<LotteryResultBloc, LotteryResultState>(
          builder: (context, state) {
            return SingleChildScrollView(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  WaaaToggleButton(
                    trueText: localized(context).winners,
                    falseText: localized(context).waiting_list,
                    onChanged: (value) {
                      lotteryResultBloc.add(LotteryResultToggle(toggle: value));
                    },
                  ),
                  vSpace15,
                  if (state.toogleWinner)
                    Container()
                  // WinnerListGridView(
                  //   usersList: mockUsersList.take(8).toList(),
                  // )
                  else
                    Container(),
                  if (state.status == OffersResultEnum.undraw)
                    SizedBox(
                      height: 350,
                      width: MediaQuery.of(context).size.width / 1.5,
                      child: OfferCarouselItem(
                        currentOffer: state.currentOffer,
                        resultMessage: "Bravoo",
                      ),
                    ),
                  vSpace20,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        localized(context).play_the_lucky_draw,
                        style: boldTextStyle18,
                      ),
                      Text(
                        "${localized(context).see_all} (${state.offersList.length})",
                        style: regularTextStyle16,
                      ),
                    ],
                  ),
                  vSpace20,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 2,
                        child: CarouselSlider(
                          options: CarouselOptions(
                            height: 200,
                            enlargeCenterPage: true,
                            enlargeFactor: 0.2,
                            aspectRatio: 1 / 4,
                            enableInfiniteScroll: true,
                            autoPlay: false,
                            onPageChanged: (index, reason) {
                              lotteryResultBloc
                                  .add(LotteryResultIndexChanged(index: index));
                            },
                          ),
                          items: state.offersList.map(
                            (item) {
                              return OfferCarouselMiniItem(currentOffer: item);
                            },
                          ).toList(),
                        ),
                      ),
                      if (state.offersList.isNotEmpty)
                        SizedBox(
                          height: 200,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                "#${state.offersList[state.carouselSelectedIndex].hashtag}",
                                style: boldTextStyle12,
                              ),
                              const Spacer(),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  const Icon(
                                    Ionicons.globe,
                                  ),
                                  hSpace10,
                                  Text(
                                    state
                                        .offersList[state.carouselSelectedIndex]
                                        .country,
                                    style: semiBoldTextStyle12,
                                  ),
                                ],
                              ),
                              vSpace5,
                              Text(
                                DateConverter().dateToDateString(state
                                    .offersList[state.carouselSelectedIndex]
                                    .publicationDate
                                    .getDateTimeInUtc()),
                                style: boldTextStyle12,
                              ),
                              vSpace5,
                              Text(
                                state.offersList[state.carouselSelectedIndex]
                                    .city,
                                style: boldTextStyle18,
                              ),
                              vSpace20,
                              SizedBox(
                                width: MediaQuery.of(context).size.width / 3,
                                child: ElevatedButton(
                                  style: primaryButton,
                                  onPressed: () {
                                    showModalBottomSheet(
                                      context: context,
                                      shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.vertical(
                                          top: Radius.circular(25.0),
                                        ),
                                      ),
                                      builder: (context) => OfferBottomSheet(
                                        currentOffer: state.offersList[
                                            state.carouselSelectedIndex],
                                      ),
                                    );
                                  },
                                  child: Text(localized(context).see_details),
                                ),
                              )
                            ],
                          ),
                        )
                    ],
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class WinnerListGridView extends StatelessWidget {
  const WinnerListGridView({super.key, required this.usersList});

  final List<User> usersList;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
        ),
        itemCount: usersList.length,
        itemBuilder: (BuildContext context, int index) {
          return UserItemList(
              user: usersList[index], isOnline: false, withName: true);
        },
      ),
    );
  }
}
