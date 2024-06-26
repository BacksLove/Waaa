import 'package:flutter/material.dart';
import 'package:waaa/core/constants/image_constants.dart';
import 'package:waaa/core/theme/colors.dart';
import 'package:waaa/models/Event.dart';

import '../../../../core/theme/text_styles.dart';
import 'package:waaa/core/route/routes.dart' as route;

class EventsCarouselWidget extends StatelessWidget {
  const EventsCarouselWidget({
    super.key,
    required List<Event?> listEvents,
  }) : _listEvents = listEvents;

  final List<Event?> _listEvents;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 170,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _listEvents.length,
        itemBuilder: (BuildContext context, int index) {
          if (_listEvents[index] != null) {
            return GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, route.eventDetailPage,
                    arguments: _listEvents[index]?.id);
              },
              child: Card(
                elevation: 0,
                child: Container(
                  height: 170,
                  width: MediaQuery.of(context).size.width / 2,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    image: DecorationImage(
                        image: NetworkImage(
                            _listEvents[index]?.mainPhoto ?? noPhotoImage),
                        colorFilter: ColorFilter.mode(
                            blackColor.withOpacity(.5), BlendMode.darken),
                        fit: BoxFit.cover),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 20, left: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          _listEvents[index]?.name ?? "",
                          style: boldWhiteTextStyle18,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }
          return Container();
        },
      ),
    );
  }
}
