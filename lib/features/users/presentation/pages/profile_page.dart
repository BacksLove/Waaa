import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:waaa/component/error_screen.dart';
import 'package:waaa/component/loading_screen.dart';
import 'package:waaa/core/constants/image_constants.dart';
import 'package:waaa/core/enums/user_enum.dart';
import 'package:waaa/core/theme/colors.dart';
import 'package:waaa/core/theme/common_widget/button.dart';
import 'package:waaa/core/theme/text_styles.dart';
import 'package:waaa/core/util/input_converter.dart';
import 'package:waaa/core/util/localized.dart';
import 'package:waaa/core/util/maps.dart';
import 'package:waaa/features/events/presentation/widgets/event_carousel.dart';
import 'package:waaa/features/events/presentation/widgets/event_user_carousel.dart';
import 'package:waaa/features/hobbies/presentation/widgets/hobbies_gridview.dart';
import 'package:country_flags/country_flags.dart';
import 'package:waaa/models/Event.dart';
import 'package:waaa/models/User.dart';

import '../../../../component/dropdown.dart';
import '../../../../core/constants/spacer.dart';
import '../manager/bloc/profile/profile_bloc.dart';

import 'package:waaa/injection_container.dart' as di;

// ignore: must_be_immutable
class ProfilPage extends StatefulWidget {
  ProfilPage(
      {super.key, required this.currentUser, this.isFromSearching = false});

  final User currentUser;
  bool isFromSearching;

  @override
  State<ProfilPage> createState() => _ProfilPageState();
}

class _ProfilPageState extends State<ProfilPage> {
  late ProfileBloc profileBloc;

  @override
  void initState() {
    profileBloc = di.sl<ProfileBloc>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => profileBloc,
      child: BlocBuilder<ProfileBloc, ProfileState>(
        builder: (context, state) {
          switch (state.status) {
            case ProfileStatus.initial:
              {
                profileBloc.add(ProfileLoadData(
                    userId: widget.currentUser.cognitoUserPoolId ?? ""));
                return const LoadingScreen();
              }
            case ProfileStatus.loading:
              return const LoadingScreen();
            case ProfileStatus.loaded:
              return Scaffold(
                body: CustomScrollView(
                  slivers: [
                    UserProfileAppBar(
                      currentUser: state.currentUser,
                      isFromSearching: widget.isFromSearching,
                    ),
                    ShowUserDetails(currentUser: state.currentUser),
                  ],
                ),
              );
            case ProfileStatus.failed:
              return const ErrorScreen();
            default:
              return const LoadingScreen();
          }
        },
      ),
    );
  }
}

class ShowUserDetails extends StatelessWidget {
  const ShowUserDetails({
    super.key,
    required this.currentUser,
  });

  final User currentUser;

  @override
  Widget build(BuildContext context) {
    final ProfileBloc profileBloc = context.read<ProfileBloc>();
    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (context, state) {
        return SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          sliver: SliverList(
            delegate: SliverChildListDelegate(
              [
                //! Rang du prénom
                vSpace15,
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      currentUser.username,
                      style: boldTextStyle24,
                    ),
                    hSpace10,
                    Expanded(
                      child: (currentUser.languagesSpeak != null)
                          ? ShowSpokenLanguages(
                              spokenLanguages: currentUser.languagesSpeak!)
                          : Container(),
                    ),
                    SizedBox(
                      height: 50,
                      child: IconButton(
                        onPressed: () {},
                        icon: const Icon(FeatherIcons.moreVertical),
                      ),
                    )
                  ],
                ),
                //! Rang de la localisation
                vSpace10,
                Row(
                  children: [
                    Icon(
                      FeatherIcons.mapPin,
                      color: primaryColor,
                    ),
                    hSpace5,
                    Text(
                      "Paris, France",
                      style: regularTextStyle14,
                    ),
                    hSpace15,
                    Text(
                      DateConverter().dateToTimeString(DateTime.now()),
                      style: regularTextStyle14,
                    ),
                    const Spacer(),
                    SizedBox(
                      width: 100,
                      height: 25,
                      child: ElevatedButton(
                        style: primaryButton,
                        onPressed: () {},
                        child: Text(localized(context).follow),
                      ),
                    )
                  ],
                ),
                vSpace15,
                //! Rang de la nationalité
                Row(
                  children: [
                    Icon(
                      FeatherIcons.flag,
                      color: primaryColor,
                    ),
                    hSpace5,
                    Text(
                      "Française",
                      style: regularTextStyle14,
                    )
                  ],
                ),
                //! Follow et Age
                vSpace15,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          Text(
                            state.age,
                            style: boldTextStyle20,
                          ),
                          Text(
                            "Age",
                            style: regularTextStyle14,
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Text(
                            state.followers,
                            style: boldTextStyle20,
                          ),
                          Text(
                            localized(context).followers,
                            style: regularTextStyle14,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                //! Hobbies
                vSpace15,
                HobbiesGridWidget(
                    hobbies: currentUser.hobbies != null
                        ? currentUser.hobbies!
                        : []),
                vSpace15,
                //! Tabs
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    TextButton(
                      onPressed: () {
                        profileBloc.add(ProfileTripTabPressed());
                      },
                      child: Text(
                        localized(context).trips,
                        style: boldTextStyle16,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        profileBloc.add(ProfileNewsTabPressed());
                      },
                      child: Text(
                        localized(context).news__1,
                        style: boldTextStyle16,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: (MediaQuery.of(context).size.width / 2) - 15,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50.0),
                        color:
                            state.isTripShowed ? primaryColor : lightGrayColor,
                      ),
                      height: state.isTripShowed ? 2.0 : 1.0,
                    ),
                    Container(
                      width: (MediaQuery.of(context).size.width / 2) - 15,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50.0),
                        color:
                            state.isTripShowed ? lightGrayColor : primaryColor,
                      ),
                      height: state.isTripShowed ? 1.0 : 2.0,
                    ),
                  ],
                ),
                state.isTripShowed
                    ?
                    //! Mes voyages
                    const MyTripsTab()
                    :
                    //! Mon actualités
                    MyNewsTab(
                        events: currentUser.events,
                      ),
                vSpace50,
              ],
            ),
          ),
        );
      },
    );
  }
}

class ShowSpokenLanguages extends StatelessWidget {
  const ShowSpokenLanguages({super.key, required this.spokenLanguages});

  final List<String> spokenLanguages;

  @override
  Widget build(BuildContext context) {
    if (spokenLanguages.length <= 3) {
      return SizedBox(
        height: 25,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: spokenLanguages.length,
            itemBuilder: (context, index) {
              return CircleAvatar(
                child: CountryFlags.flag(
                  spokenLanguages[index],
                  height: 50,
                  width: 50,
                  borderRadius: 20,
                ),
              );
            }),
      );
    } else {
      return SizedBox(
        height: 25,
        child: Row(
          children: [
            CircleAvatar(
              child: CountryFlags.flag(
                spokenLanguages[0],
                height: 30,
                width: 30,
                borderRadius: 20,
              ),
            ),
            CircleAvatar(
              child: CountryFlags.flag(
                spokenLanguages[1],
                height: 30,
                width: 30,
                borderRadius: 20,
              ),
            ),
            CircleAvatar(
              child: CountryFlags.flag(
                spokenLanguages[2],
                height: 30,
                width: 30,
                borderRadius: 20,
              ),
            ),
            hSpace10,
            SizedBox(
              height: 25,
              width: 55,
              child: ElevatedButton(
                style: primaryButton,
                onPressed: () {},
                child: Text(
                  "+ ${spokenLanguages.length - 3}",
                  style: boldWhiteTextStyle14,
                ),
              ),
            )
          ],
        ),
      );
    }
  }
}

class UserProfileAppBar extends StatelessWidget {
  const UserProfileAppBar({
    super.key,
    required this.currentUser,
    required this.isFromSearching,
  });

  final User currentUser;
  final bool isFromSearching;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: isFromSearching ? true : false,
      expandedHeight: 280,
      backgroundColor: Colors.white,
      elevation: 0,
      flexibleSpace: FlexibleSpaceBar(
        collapseMode: CollapseMode.pin,
        background: Stack(
          fit: StackFit.expand,
          children: [
            Image.network(
              currentUser.photo ?? noPhotoImage,
              fit: BoxFit.cover,
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 30,
                decoration: const BoxDecoration(
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
      leading: isFromSearching
          ? Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: Colors.white,
                ),
                child: IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(
                    FeatherIcons.chevronLeft,
                    color: Colors.black,
                  ),
                ),
              ),
            )
          : null,
      actions: [
        isFromSearching
            ? Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Colors.white,
                  ),
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      FeatherIcons.messageSquare,
                      color: Colors.black,
                    ),
                  ),
                ),
              )
            : Container(),
      ],
    );
  }
}

class MyTripsTab extends StatelessWidget {
  const MyTripsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        vSpace30,
        Row(
          children: [
            Text(
              localized(context).trips__1,
              style: boldTextStyle24,
            ),
            const Spacer(),
            Expanded(
              child: WaaaDropdownWidget(
                labelText: "Année",
                items: const ["2020", "2021", "2022", "2023"],
                onChanged: (value) {},
                selectedItem: null,
              ),
            ),
          ],
        ),
        vSpace20,
        Container(
          decoration: const BoxDecoration(color: Colors.blue),
          height: 230,
          child: const ShowMaps(),
        ),
      ],
    );
  }
}

class MyNewsTab extends StatelessWidget {
  const MyNewsTab({super.key, required this.events});

  final List<Event>? events;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        vSpace30,
        Text(
          localized(context).events,
          style: boldTextStyle24,
        ),
        vSpace20,
        if (events != null) EventsUserCarouselWidget(listEvents: events!),
        vSpace20,
        Text(
          localized(context).news_feed,
          style: boldTextStyle24,
        ),
        vSpace20,
        if (events != null) EventsCarouselWidget(listEvents: events!),
      ],
    );
  }
}
