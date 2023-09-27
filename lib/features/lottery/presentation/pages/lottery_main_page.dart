import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionicons/ionicons.dart';
import 'package:waaa/core/constants/spacer.dart';
import 'package:waaa/core/theme/colors.dart';
import 'package:waaa/core/theme/common_widget/button.dart';
import 'package:waaa/core/theme/text_styles.dart';
import 'package:waaa/core/util/localized.dart';
import 'package:waaa/features/lottery/presentation/bloc/lottery/lottery_bloc.dart';
import 'package:waaa/features/lottery/presentation/widgets/offer_bottom_sheet_widget.dart';
import 'package:waaa/features/lottery/presentation/widgets/offer_caroussel_item_widget.dart';

import 'package:waaa/injection_container.dart' as di;
import 'package:waaa/core/route/routes.dart' as route;

class LotteryMainPage extends StatefulWidget {
  const LotteryMainPage({super.key});

  @override
  State<LotteryMainPage> createState() => _LotteryMainPageState();
}

class _LotteryMainPageState extends State<LotteryMainPage> {
  late LotteryBloc lotteryBloc;

  @override
  void initState() {
    lotteryBloc = di.sl<LotteryBloc>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => lotteryBloc..add(LotteryLoadData()),
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
        body: BlocBuilder<LotteryBloc, LotteryState>(
          builder: (context, state) {
            return SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    localized(context).win_a_trip_for_2_euros_for_6_months,
                    textAlign: TextAlign.center,
                    style: boldTextStyle18,
                  ),
                  vSpace60,
                  CarouselSlider(
                    options: CarouselOptions(
                      height: 400,
                      enlargeCenterPage: true,
                      enlargeFactor: 0.2,
                      aspectRatio: 1 / 4,
                      enableInfiniteScroll: true,
                      autoPlay: false,
                      onPageChanged: (index, reason) {
                        lotteryBloc.add(LotteryUpdateCarrouselIndex(id: index));
                      },
                    ),
                    items: state.offersList.map(
                      (item) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, route.offerResultPage,
                                arguments: item.id);
                          },
                          child: OfferCarouselItem(currentOffer: item),
                        );
                      },
                    ).toList(),
                  ),
                  vSpace35,
                  ElevatedButton(
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
                          currentOffer:
                              state.offersList[state.carrouselSelectedIndex],
                        ),
                      );
                    },
                    child: Text(localized(context).see_details),
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

class OfferBottomsheetTile extends StatelessWidget {
  const OfferBottomsheetTile(
      {super.key, required this.icon, required this.title});

  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          size: 20,
        ),
        hSpace10,
        Text(
          title,
          style: semiBoldTextStyle16,
        )
      ],
    );
  }
}
