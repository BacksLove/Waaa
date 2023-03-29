import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:waaa/component/app_bar.dart';
import 'package:waaa/core/theme/colors.dart';
import 'package:waaa/features/auth/presentation/manager/auth_bloc/auth_bloc.dart';
import 'package:waaa/features/events/presentation/pages/event_detail_page.dart';
import 'package:waaa/features/users/domain/entities/user_entity.dart';

import '../../../../core/theme/common_widget/button.dart';
import '../../../events/domain/entities/event_entity.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late AuthBloc authBloc;
  
  final _userNear = [
    const User(username: "Stanley", photoUrl: "https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=987&q=80"),
    const User(username: "Cédric", photoUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSya5dwz7sppH6NGJVip5KpNHbO6feSmMVJoQ&usqp=CAU"),
    const User(username: "Ralph", photoUrl: "https://images.unsplash.com/photo-1500648767791-00dcc994a43e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=3000&q=80"),
    const User(username: "Jeremy", photoUrl: "https://images.unsplash.com/photo-1624561172888-ac93c696e10c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=989&q=80"),
    const User(username: "Boubakar", photoUrl: "https://img1.freepng.fr/20180409/rhe/kisspng-karlovy-vary-computer-icons-avatar-health-care-man-icon-5acb932fc01531.0083656115232909277868.jpg"),
    const User(username: "Stanley", photoUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSya5dwz7sppH6NGJVip5KpNHbO6feSmMVJoQ&usqp=CAU"),
    const User(username: "Stanley", photoUrl: "https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=987&q=80"),
    const User(username: "Stanley", photoUrl: "https://images.unsplash.com/photo-1500648767791-00dcc994a43e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=3000&q=80"),
    const User(username: "Stanley", photoUrl: "https://images.unsplash.com/photo-1624561172888-ac93c696e10c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=989&q=80"),
  ];

  final _eventsWaaa = [
    const Event(name: "Les prisons de Manille", participants: [], address: "address", country: "Philipinnes", city: "Manille", photoUrl: "https://www.travelandleisure.com/thmb/3lMG0Y3CgAoqF8Sv-bxNQ9xcUFE=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/Boracay-PHILIPPINES0717-d6a7597bd2414650a0f7d31778347af6.jpg"),
    const Event(name: "Big ben visit", participants: [], address: "address", country: "Angleterre", city: "Londre", photoUrl: "https://www.guidesulysse.com/images/destinations/iStock_000061870898_Full.jpg"),
    const Event(name: "La seine en folie", participants: [], address: "address", country: "France", city: "Paris", photoUrl: "https://cdn.getyourguide.com/img/location/5ffeb392eb81e.jpeg/75.jpg"),
    const Event(name: "Douala tour", participants: [], address: "address", country: "Cameroun", city: "Douala", photoUrl: "https://images.radio-canada.ca/q_auto,w_960/v1/ici-info/16x9/cameroun-yaounde-canada-mediateur-facilitateur-conflit.JPG"),
  ];

  @override
  void initState() {
    super.initState();
    authBloc = BlocProvider.of<AuthBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ListView(
          children: [
            const Text(
              "Voyageurs autour de vous",
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.normal,
              ),
            ),
            const SizedBox(height: 35,),
            UserListCarrousel(userNear: _userNear, withName: false,),
            EventsWaaa(listEvents: _eventsWaaa),
            const SizedBox(height: 35,),
            EventsUser(listEvents: _eventsWaaa),
            const SizedBox(height: 35,),
            EventsUser(listEvents: _eventsWaaa),
          ],
        )
      ),
    );
  }
}

class UserItemList extends StatelessWidget {
  const UserItemList({super.key, required user, required isOnline, required withName}) : _currentUser = user, _isOnline = isOnline, _withName = withName;

  final User _currentUser;
  final bool _isOnline;
  final bool _withName;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                width: 70,
                height: 70,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: NetworkImage(_currentUser.photoUrl!),
                      fit: BoxFit.fitWidth
                  ),
                ),
              ),
              _isOnline ?
              Container(
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
                      border: Border.all(color: Colors.white, width: 1)),
                  child: const Text("")
                ),
              ) : Container()
            ],
          ),
          const SizedBox(height: 10,),
          if (_withName)
            Text(
              _currentUser.username,
              textAlign: TextAlign.left,
              style: const TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 12,
                color: Colors.black,
              ),
            ),
        ],
      ),
    );
  }

}

class UserListCarrousel extends StatelessWidget {
  const UserListCarrousel({
    super.key,
    required List<User> userNear,
    required bool withName,
  }) : _userNear = userNear, _withName = withName;

  final List<User> _userNear;
  final bool _withName;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: _userNear.length,
          itemBuilder: (BuildContext context, int index) {
            return
              _userNear[index].photoUrl != null ?
                  UserItemList(user: _userNear[index], isOnline: true, withName: _withName,)
                  : const Placeholder();
          }
      ),
    );
  }
}

class EventsWaaa extends StatelessWidget {
  const EventsWaaa({super.key, required listEvents}) : _listEvents = listEvents ;

  final List<Event> _listEvents;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Events WAAA",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold
          ),
        ),
        const SizedBox(height: 10.0),
        if (_listEvents.isNotEmpty)
           Card (
             elevation: 0,
            child: Container (
              height: 170,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                image:  DecorationImage(
                    image: NetworkImage(_listEvents.first.photoUrl),
                    fit:BoxFit.cover
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 20, top: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      _listEvents.first.city,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.white
                      ),
                    ),
                    const SizedBox(height: 5,),
                    Text(
                      _listEvents.first.country,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                          color: Colors.white
                      ),
                    ),
                  ],
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
                  child: Card (
                    elevation: 0,
                    child: Container (
                      height: 170,
                      padding: const EdgeInsets.all(10),
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        image: DecorationImage(
                            image: NetworkImage(_listEvents[1].photoUrl),
                            fit:BoxFit.cover
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              _listEvents[1].country,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Colors.white
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Card (
                    elevation: 0,
                    child: Container (
                      height: 170,
                      padding: const EdgeInsets.all(10),
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        image: DecorationImage(
                            image: NetworkImage(_listEvents[2].photoUrl),
                            fit:BoxFit.cover
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              _listEvents[2].country,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Colors.white
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
        ),
        const SizedBox(height: 10,),
        if (_listEvents.isNotEmpty)
          ElevatedButton(
              style: primaryButton,
              onPressed: () {},
              child: const Text("Voir tout")
          ),
      ],
    );
  }

}

class EventsUser extends StatelessWidget {
  const EventsUser({super.key, required listEvents}) : _listEvents = listEvents ;

  final List<Event> _listEvents;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Event(s)",
          style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold
          ),
        ),
        const SizedBox(height: 10.0),
        SizedBox(
          height: 170,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: _listEvents.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => EventDetailPage(currentEvent: _listEvents[index])));
                  },
                  child: Card (
                    elevation: 0,
                    child: Container (
                      height: 170,
                      width: MediaQuery.of(context).size.width / 2,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        image: DecorationImage(
                            image: NetworkImage(_listEvents[index].photoUrl),
                            fit:BoxFit.cover
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 10, left: 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              _listEvents[index].name,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Colors.white
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              }
          ),
        ),
        const SizedBox(height: 15,),
        SizedBox(
          height: 35,
          child: Row(
            children: [
              Expanded(
                child: ElevatedButton(
                    style: outlinedBlackButton,
                    onPressed: () {},
                    child: const Text("Tout voir")
                ),
              ),
              const SizedBox(width: 10,),
              Expanded(
                child: ElevatedButton.icon(
                  style: primaryButton,
                  onPressed: () {},
                  label: const Text("Créer un event"),
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
