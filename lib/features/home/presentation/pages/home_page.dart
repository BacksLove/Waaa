import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:waaa/component/circle_avatar.dart';
import 'package:waaa/core/constants/image_constants.dart';
import 'package:waaa/core/constants/spacer.dart';
import 'package:waaa/core/enums/home_enum.dart';
import 'package:waaa/core/theme/colors.dart';
import 'package:waaa/core/theme/text_styles.dart';
import 'package:waaa/core/util/localized.dart';
import 'package:waaa/features/home/presentation/manager/home_bloc/home_bloc.dart';
import 'package:waaa/features/home/presentation/widgets/user_carrousel.dart';
import 'package:waaa/features/users/domain/entities/profile_page_arguments.dart';
import 'package:waaa/models/Event.dart';
import 'package:waaa/models/User.dart';

import '../../../../core/theme/common_widget/button.dart';

import 'package:waaa/core/route/routes.dart' as route;
import 'package:waaa/injection_container.dart' as di;

import '../../../events/presentation/widgets/event_carousel.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late HomeBloc homeBloc;

  @override
  void initState() {
    homeBloc = di.sl<HomeBloc>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => homeBloc,
      child: BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
        if (state.status == HomeStatus.loading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state.status == HomeStatus.failed) {
          return Center(
            child: Text(
              "Une erreur est survenue lors du chargement",
              style: boldTextStyle14,
            ),
          );
        } else if (state.status == HomeStatus.loaded) {
          return Padding(
              padding: const EdgeInsets.all(15.0),
              child: ListView(
                children: [
                  Text(
                    localized(context).travelers_around_you,
                    style: regularTextStyle16,
                  ),
                  vSpace35,
                  UserListCarrousel(
                    userNear: state.usersNear,
                    withName: false,
                  ),
                  EventsWaaa(listEvents: state.waaaEvents),
                  vSpace35,
                  EventsUser(listEvents: state.userEvents),
                  vSpace35,
                ],
              ));
        } else {
          return Container();
        }
      }),
    );
  }
}

class UserItemList extends StatelessWidget {
  const UserItemList(
      {super.key, required user, required isOnline, required withName})
      : _currentUser = user,
        _isOnline = isOnline,
        _withName = withName;

  final User _currentUser;
  final bool _isOnline;
  final bool _withName;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          route.profilePage,
          arguments: ProfilePageArguments(
            user: _currentUser,
            isFromSearching: true,
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(5),
        child: Column(
          children: [
            Stack(
              children: [
                WaaaCircleAvatar(
                  photo: _currentUser.photo,
                  width: 70,
                  height: 70,
                ),
                _isOnline
                    ? Container(
                        width: 65,
                        height: 65,
                        alignment: Alignment.bottomRight,
                        margin: const EdgeInsets.only(top: 5),
                        child: Container(
                            width: 15,
                            height: 15,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: onlineColor,
                                border: Border.all(
                                    color: secondaryColor, width: 1)),
                            child: const Text("")),
                      )
                    : Container()
              ],
            ),
            vSpace10,
            if (_withName)
              Text(
                _currentUser.username,
                textAlign: TextAlign.left,
                style: regularTextStyle12,
              ),
          ],
        ),
      ),
    );
  }
}

class EventsWaaa extends StatelessWidget {
  const EventsWaaa({super.key, required listEvents}) : _listEvents = listEvents;

  final List<Event?> _listEvents;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Events WAAA",
          style: boldTextStyle24,
        ),
        vSpace10,
        if (_listEvents.isNotEmpty)
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, route.eventDetailPage,
                  arguments: _listEvents[0]?.id);
            },
            child: Card(
              elevation: 0,
              child: Container(
                height: 170,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  image: DecorationImage(
                      image: NetworkImage(
                          _listEvents.first?.mainPhoto ?? noPhotoImage),
                      fit: BoxFit.cover),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 20, top: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        _listEvents.first?.city ?? "",
                        style: boldWhiteTextStyle20,
                      ),
                      vSpace5,
                      Text(
                        _listEvents.first?.country ?? "",
                        style: boldWhiteTextStyle12,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        if (_listEvents.length >= 3)
          SizedBox(
            height: 150,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, route.eventDetailPage,
                          arguments: _listEvents[1]?.id);
                    },
                    child: Card(
                      elevation: 0,
                      child: Container(
                        height: 170,
                        padding: const EdgeInsets.all(10),
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          image: DecorationImage(
                              image: NetworkImage(
                                  _listEvents[1]?.mainPhoto ?? noPhotoImage),
                              fit: BoxFit.cover),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                _listEvents[1]?.country ?? "",
                                style: boldWhiteTextStyle20,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, route.eventDetailPage,
                          arguments: _listEvents[2]?.id);
                    },
                    child: Card(
                      elevation: 0,
                      child: Container(
                        height: 170,
                        padding: const EdgeInsets.all(10),
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          image: DecorationImage(
                              image: NetworkImage(
                                  _listEvents[2]?.mainPhoto ?? noPhotoImage),
                              fit: BoxFit.cover),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                _listEvents[2]?.country ?? "",
                                style: boldWhiteTextStyle20,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        vSpace10,
        if (_listEvents.isNotEmpty)
          ElevatedButton(
              style: primaryButton,
              onPressed: () {},
              child: Text(
                localized(context).see_all,
                style: regularTextStyle16,
              )),
      ],
    );
  }
}

class EventsUser extends StatelessWidget {
  const EventsUser({super.key, required listEvents}) : _listEvents = listEvents;

  final List<Event?> _listEvents;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          localized(context).events,
          style: boldTextStyle24,
        ),
        vSpace10,
        if (_listEvents.isEmpty)
          Text(
            "There's no event, create one",
            style: regularTextStyle16,
          )
        else
          EventsCarouselWidget(listEvents: _listEvents),
        vSpace15,
        SizedBox(
          height: 35,
          child: Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  style: outlinedBlackButton,
                  onPressed: () {},
                  child: Text(
                    localized(context).see_all,
                    style: regularTextStyle16,
                  ),
                ),
              ),
              hSpace10,
              Expanded(
                child: ElevatedButton.icon(
                  style: primaryButton,
                  onPressed: () {
                    Navigator.pushNamed(context, route.createEventPage);
                  },
                  label: Text(
                    localized(context).create_an_event,
                    style: regularTextStyle16,
                  ),
                  icon: const Icon(FeatherIcons.plusCircle),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
