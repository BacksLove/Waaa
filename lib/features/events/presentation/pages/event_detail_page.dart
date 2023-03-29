import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:waaa/core/theme/colors.dart';
import 'package:waaa/features/events/domain/entities/event_entity.dart';
import 'package:waaa/features/home/presentation/pages/home_page.dart';

import '../../../users/domain/entities/user_entity.dart';

class EventDetailPage extends StatefulWidget {
  const EventDetailPage({Key? key, required this.currentEvent}) : super(key: key);

  final Event currentEvent;

  @override
  State<EventDetailPage> createState() => _EventDetailPageState();
}

class _EventDetailPageState extends State<EventDetailPage> {

  final _organisateur = [
    const User(username: "Stanley", photoUrl: "https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=987&q=80"),
    const User(username: "Cédric", photoUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSya5dwz7sppH6NGJVip5KpNHbO6feSmMVJoQ&usqp=CAU"),
  ];

  final _convives = [
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

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            expandedHeight: 180.0,
            backgroundColor: Colors.white,
            elevation: 0,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
                  widget.currentEvent.photoUrl,
                fit: BoxFit.cover,
              ),
            ),
            leading: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: Colors.white
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
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(15),
            sliver: SliverList(
                delegate: SliverChildListDelegate(
                    [
                      Text(
                        "Evenement public", // TODO: event['public']
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: lightPrimaryColor
                        ),
                      ),
                      const SizedBox(height: 15,),
                      Text(
                        widget.currentEvent.name,
                        style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.black
                        ),
                      ),
                      const SizedBox(height: 25,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Column(
                              children: [
                                Container(
                                  height: 60,
                                  width: 60,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100),
                                    color: veryLightGrayColor,
                                  ),
                                  padding: const EdgeInsets.all(10),
                                  child: Icon(
                                    FeatherIcons.star,
                                    color: primaryColor,
                                  ),
                                ),
                                const SizedBox(height: 5,),
                                const Text(
                                  "Interessée",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 15,
                                      color: Colors.black
                                  ),
                                )
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                Container(
                                  height: 60,
                                  width: 60,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100),
                                    color: veryLightGrayColor,
                                  ),
                                  padding: const EdgeInsets.all(10),
                                  child: Icon(
                                    FeatherIcons.checkCircle,
                                    color: primaryColor,
                                  ),
                                ),
                                const SizedBox(height: 5,),
                                const Text(
                                  "Participe",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 15,
                                      color: Colors.black
                                  ),
                                )
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                Container(
                                  height: 60,
                                  width: 60,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100),
                                    color: veryLightGrayColor,
                                  ),
                                  padding: const EdgeInsets.all(10),
                                  child: Icon(
                                    FeatherIcons.share,
                                    color: primaryColor,
                                  ),
                                ),
                                const SizedBox(height: 5,),
                                const Text(
                                  "Partager",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 15,
                                      color: Colors.black
                                  ),
                                )
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                Container(
                                  height: 60,
                                  width: 60,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100),
                                    color: veryLightGrayColor,
                                  ),
                                  padding: const EdgeInsets.all(10),
                                  child: Icon(
                                    FeatherIcons.moreHorizontal,
                                    color: primaryColor,
                                  ),
                                ),
                                const SizedBox(height: 5,),
                                const Text(
                                  "Plus",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 15,
                                      color: Colors.black
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 15,),
                      const EventDetailTile(icon: FeatherIcons.checkCircle, tileKey: "Thème", tileValue: "festif"),
                      const EventDetailTile(icon: FeatherIcons.penTool, tileKey: "Description", tileValue: "Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur excepteur sint occaecat"),
                      const EventDetailTile(icon: FeatherIcons.mapPin, tileKey: "Lieu", tileValue: "Rio, Brésil - Café A"),
                      const EventDetailTile(icon: FeatherIcons.calendar, tileKey: "Date et heure", tileValue: "Début : 08/08/2020 à 20h00\nFin : 09/08/2020 à 20h00"),
                      const SizedBox(height: 20,),
                      // Infos
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(color: lightGrayColor)
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 15.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                  child: Column(
                                    children: [
                                      Text(
                                        "56",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                          color: lightPrimaryColor
                                        ),
                                      ),
                                      const Text(
                                        "participants",
                                        style: TextStyle(
                                            fontWeight: FontWeight.normal,
                                            fontSize: 15,
                                            color: Colors.black
                                        ),
                                      )
                                    ],
                                  ),
                              ),
                              Expanded(
                                child: Column(
                                  children: [
                                    Text(
                                      "56",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                          color: lightPrimaryColor
                                      ),
                                    ),
                                    const Text(
                                      "interessé(é)s",
                                      style: TextStyle(
                                          fontWeight: FontWeight.normal,
                                          fontSize: 15,
                                          color: Colors.black
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  children: [
                                    Text(
                                      "56",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                          color: lightPrimaryColor
                                      ),
                                    ),
                                    const Text(
                                      "partages",
                                      style: TextStyle(
                                          fontWeight: FontWeight.normal,
                                          fontSize: 15,
                                          color: Colors.black
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      // Organisateur
                      ListTile(
                        leading: Icon(
                          FeatherIcons.user,
                          color: primaryColor,
                        ),
                        title: const Text(
                          "Co-organisateur(s)",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black
                          ),
                        ),
                      ),
                      UserListCarrousel(userNear: _organisateur, withName: true),
                      // Convives
                      ListTile(
                        leading: Icon(
                          FeatherIcons.user,
                          color: primaryColor,
                        ),
                        title: const Text(
                          "Les convive(s)",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black
                          ),
                        ),
                      ),
                      UserListCarrousel(userNear: _convives, withName: true),
                      // Audiences
                      const SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Audience de l'evenenement",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 15
                            ),
                          ),
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(FeatherIcons.moreHorizontal)
                          ),
                        ],
                      )
                    ]
                )
            ),
          ),
        ],
      ),
    );
  }
}

class EventDetailTile extends StatelessWidget {
  const EventDetailTile({Key? key, required this.icon, required this.tileKey, required this.tileValue}) : super(key: key);

  final IconData icon;
  final String tileKey;
  final String tileValue;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
        color: primaryColor,
      ),
      title: RichText(
        text: TextSpan(
            children: [
              TextSpan(text: "$tileKey : ", style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.black)),
              TextSpan(text: tileValue, style: const TextStyle(fontWeight: FontWeight.normal, fontSize: 18, color: Colors.black))
            ]
        ),
      ),
    );
  }
}



