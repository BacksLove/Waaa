import 'package:flutter/material.dart';
import 'package:waaa/models/Event.dart';

import '../../../../core/theme/text_styles.dart';
import 'package:waaa/core/route/routes.dart' as route;

class NewsCarouselWidget extends StatelessWidget {
  const NewsCarouselWidget({
    super.key,
    required List<Event?> listEvents,
  }) : _listEvents = listEvents;

  // TODO: Change to News Entity
  final List<Event?> _listEvents;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 170,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _listEvents.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, route.eventDetailPage,
                  arguments: _listEvents[index]?.id);
            },
            child: Card(
              elevation: 0,
              child: Container(
                height: 220,
                width: MediaQuery.of(context).size.width / 2.5,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  image: DecorationImage(
                      image: NetworkImage(_listEvents[index]?.mainPhoto ?? ""),
                      fit: BoxFit.cover),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 10, left: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        _listEvents[index]?.name ?? "",
                        style: boldWhiteTextStyle20,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
