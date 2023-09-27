import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:ionicons/ionicons.dart';
import 'package:waaa/core/constants/image_constants.dart';
import 'package:waaa/core/constants/spacer.dart';
import 'package:waaa/core/enums/trips_enum.dart';
import 'package:waaa/core/theme/colors.dart';
import 'package:waaa/core/theme/common_widget/button.dart';
import 'package:waaa/core/theme/text_styles.dart';
import 'package:waaa/core/util/localized.dart';
import 'package:waaa/core/util/maps.dart';
import 'package:waaa/core/util/mocks/trips.dart';
import 'package:waaa/features/trips/presentation/bloc/trips_bloc.dart';
import 'package:waaa/features/trips/presentation/widgets/photo_grid_widget.dart';

import 'package:waaa/injection_container.dart' as di;
import 'package:waaa/models/ModelProvider.dart' as mp;

class TripDetailPage extends StatelessWidget {
  const TripDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => di.sl<TripsBloc>()
        ..add(const LoadTripDetailEvent(
            id: "c26af7b0-c413-436f-811c-75b2392cd452")),
      child: Scaffold(
        body: BlocConsumer<TripsBloc, TripsState>(
          listener: (context, state) {},
          builder: (context, state) {
            if (state.status == TripDetailStatus.loaded) {
              return CustomScrollView(
                slivers: [
                  TripAppBar(
                    currentTrip: state.currentTrip!,
                  ),
                  ShowTripDetails(currentTrip: state.currentTrip!),
                ],
              );
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }
}

class TripAppBar extends StatelessWidget {
  const TripAppBar({
    super.key,
    required this.currentTrip,
  });

  final mp.Trip currentTrip;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      expandedHeight: 250,
      backgroundColor: Colors.white,
      elevation: 0,
      flexibleSpace: FlexibleSpaceBar(
        collapseMode: CollapseMode.pin,
        background: Stack(
          fit: StackFit.expand,
          children: [
            Image.network(
              currentTrip.photo ?? noPhotoImage,
              fit: BoxFit.cover,
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 20,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [Colors.white, Colors.white60],
                  ),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25.0),
                    topRight: Radius.circular(25.0),
                  ),
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
      ),
      leading: Padding(
        padding: const EdgeInsets.all(8.0),
        child: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            Ionicons.arrow_back,
            color: secondaryColor,
            size: 30,
          ),
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: IconButton(
            onPressed: () {},
            icon: Icon(
              Ionicons.add_circle,
              color: secondaryColor,
            ),
          ),
        ),
      ],
    );
  }
}

class ShowTripDetails extends StatelessWidget {
  const ShowTripDetails({
    super.key,
    required this.currentTrip,
  });

  final mp.Trip currentTrip;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TripsBloc, TripsState>(
      builder: (context, state) {
        return SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          sliver: SliverList(
            delegate: SliverChildListDelegate(
              [
                //! Rang du titre
                vSpace15,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      currentTrip.title,
                      style: boldTextStyle24,
                    ),
                    hSpace10,
                    PopupMenuButton<TripMenuItem>(
                      onSelected: (value) {
                        if (value == TripMenuItem.modify) {}
                        if (value == TripMenuItem.delete) {}
                        if (value == TripMenuItem.publish) {}
                      },
                      icon: Icon(
                        FeatherIcons.moreVertical,
                        color: blackColor,
                      ),
                      itemBuilder: (context) => [
                        PopupMenuItem(
                          value: TripMenuItem.modify,
                          child: Text(localized(context).modify),
                        ),
                        PopupMenuItem(
                          value: TripMenuItem.delete,
                          child: Text(localized(context).delete),
                        ),
                        PopupMenuItem(
                          value: TripMenuItem.publish,
                          child: Text(localized(context).publish),
                        ),
                      ],
                    ),
                  ],
                ),
                //! Rang de la localisation
                vSpace10,
                Row(
                  children: [
                    Icon(
                      Ionicons.location,
                      color: primaryColor,
                    ),
                    hSpace5,
                    Text(
                      "Thailand, Italy...",
                      style: regularTextStyle14,
                    ),
                    const Spacer(),
                    SizedBox(
                      width: 100,
                      child: ElevatedButton(
                        style: yellowButton,
                        onPressed: () {},
                        child: Text(
                          currentTrip.state.toString(),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    )
                  ],
                ),
                //! Currency & People
                vSpace15,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          Text(
                            "\$",
                            style: boldTextStyle20,
                          ),
                          Text(
                            localized(context).currency,
                            style: regularTextStyle14,
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Text(
                            "11K",
                            style: boldTextStyle20,
                          ),
                          Text(
                            localized(context).been_here,
                            style: regularTextStyle14,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                vSpace15,
                //! Tabs
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        TextButton(
                          onPressed: () {
                            context.read<TripsBloc>().add(const SwitchTabsEvent(
                                tabShowed: TripTabShowed.trip));
                          },
                          child: Text(
                            localized(context).trips,
                            style: boldTextStyle16,
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50.0),
                            color: state.tabShowed == TripTabShowed.trip
                                ? primaryColor
                                : lightGrayColor,
                          ),
                          height:
                              state.tabShowed == TripTabShowed.trip ? 2.0 : 1.0,
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        TextButton(
                          onPressed: () {
                            context.read<TripsBloc>().add(const SwitchTabsEvent(
                                tabShowed: TripTabShowed.photo));
                          },
                          child: Text(
                            localized(context).photo,
                            style: boldTextStyle16,
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50.0),
                            color: state.tabShowed == TripTabShowed.photo
                                ? primaryColor
                                : lightGrayColor,
                          ),
                          height: state.tabShowed == TripTabShowed.photo
                              ? 2.0
                              : 1.0,
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        TextButton(
                          onPressed: () {
                            context.read<TripsBloc>().add(const SwitchTabsEvent(
                                tabShowed: TripTabShowed.partner));
                          },
                          child: Text(
                            localized(context).partner,
                            style: boldTextStyle16,
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50.0),
                            color: state.tabShowed == TripTabShowed.partner
                                ? primaryColor
                                : lightGrayColor,
                          ),
                          height: state.tabShowed == TripTabShowed.partner
                              ? 2.0
                              : 1.0,
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        TextButton(
                          onPressed: () {
                            context.read<TripsBloc>().add(const SwitchTabsEvent(
                                tabShowed: TripTabShowed.event));
                          },
                          child: Text(
                            localized(context).events,
                            style: boldTextStyle16,
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50.0),
                            color: state.tabShowed == TripTabShowed.event
                                ? primaryColor
                                : lightGrayColor,
                          ),
                          height: state.tabShowed == TripTabShowed.event
                              ? 2.0
                              : 1.0,
                        ),
                      ],
                    ),
                  ],
                ),
                vSpace20,
                state.tabShowed == TripTabShowed.trip
                    ? const TripTabTrip()
                    : Container(),
                state.tabShowed == TripTabShowed.photo
                    ? TripTabPhoto(photos: mockTripStepImage)
                    : Container(),
                state.tabShowed == TripTabShowed.partner
                    ? const TripTabPartner()
                    : Container(),
                state.tabShowed == TripTabShowed.event
                    ? const TripTabEvent()
                    : Container(),
                //! Bottom accomodation and about
                Text(
                  localized(context).accomodations,
                  style: boldTextStyle24,
                ),
                vSpace15,
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        border: Border.all(color: primaryColor),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Icon(
                        Ionicons.home,
                        color: primaryColor,
                      ),
                    ),
                    hSpace15,
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        border: Border.all(color: primaryColor),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Icon(
                        Ionicons.bed,
                        color: primaryColor,
                      ),
                    ),
                    hSpace15,
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        border: Border.all(color: primaryColor),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Icon(
                        Ionicons.home,
                        color: primaryColor,
                      ),
                    ),
                    hSpace15,
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        border: Border.all(color: primaryColor),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Icon(
                        Ionicons.bed,
                        color: primaryColor,
                      ),
                    ),
                    hSpace15,
                  ],
                ),
                vSpace20,
                Text(
                  localized(context).about,
                  style: boldTextStyle24,
                ),
                vSpace15,
                Text(
                  state.currentTrip?.about ?? "",
                  style: regularTextStyle16,
                ),
                vSpace100,
              ],
            ),
          ),
        );
      },
    );
  }
}

class TripTabTrip extends StatelessWidget {
  const TripTabTrip({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TripsBloc, TripsState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(40.0)),
              height: 230,
              child: const ShowMaps(),
            ),
            vSpace10,
            SizedBox(
              height: 80,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: mockTripStepImage.length,
                itemBuilder: (context, index) {
                  return Container(
                    width: 150,
                    height: 70,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                          mockTripStepImage[index],
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return hSpace15;
                },
              ),
            ),
            vSpace20,
            Text(
              localized(context).destinations,
              style: boldTextStyle24,
            ),
            vSpace15,
            Expanded(
              child: DestinationGroupedListWidget(
                  destinations: state.currentTrip!.steps!),
            ),
            vSpace20,
          ],
        );
      },
    );
  }
}

class TripTabPhoto extends StatelessWidget {
  const TripTabPhoto({super.key, required this.photos});

  final List<String> photos;

  @override
  Widget build(BuildContext context) {
    return PhotoGridViewWidget(photoPath: photos);
  }
}

class TripTabPartner extends StatelessWidget {
  const TripTabPartner({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(localized(context).partner),
    );
  }
}

class TripTabEvent extends StatelessWidget {
  const TripTabEvent({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(localized(context).events),
    );
  }
}

class DestinationGroupedListWidget extends StatelessWidget {
  const DestinationGroupedListWidget({super.key, required this.destinations});

  final List<mp.Step> destinations;

  @override
  Widget build(BuildContext context) {
    return GroupedListView<mp.Step, String>(
      elements: destinations,
      groupBy: (element) => element.country,
      groupSeparatorBuilder: (value) {
        return Text(
          value,
          style: boldTextStyle16,
        );
      },
      itemBuilder: (context, element) {
        return Text(element.city);
      },
    );
  }
}
