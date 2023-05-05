import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:waaa/core/constants/spacer.dart';
import 'package:waaa/core/theme/colors.dart';
import 'package:waaa/core/util/input_converter.dart';

import '../../../../core/theme/text_styles.dart';
import '../../domain/entities/event_entity.dart';
import 'package:waaa/core/route/routes.dart' as route;

class EventsUserCarouselWidget extends StatelessWidget {
  const EventsUserCarouselWidget({
    super.key,
    required List<Event> listEvents,
  }) : _listEvents = listEvents;

  final List<Event> _listEvents;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _listEvents.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, route.eventDetailPage,
                  arguments: _listEvents[index]);
            },
            child: Card(
              elevation: 0,
              child: Container(
                height: 250,
                width: MediaQuery.of(context).size.width / 2.5,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  image: DecorationImage(
                      image: NetworkImage(_listEvents[index].mainPhoto),
                      fit: BoxFit.cover),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 10, left: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(
                            FeatherIcons.calendar,
                            color: secondaryColor,
                          ),
                          hSpace5,
                          Column(
                            children: [
                              vSpace5,
                              Text(
                                DateConverter().dateToDatetimeString(
                                    _listEvents[index].begin),
                                style: boldWhiteTextStyle12,
                              ),
                              Text(
                                DateConverter().dateToDatetimeString(
                                    _listEvents[index].end),
                                style: boldWhiteTextStyle12,
                              ),
                            ],
                          )
                        ],
                      ),
                      const Spacer(),
                      Text(
                        "${_listEvents[index].country}, ${_listEvents[index].city}",
                        style: boldWhiteTextStyle12,
                      ),
                      Row(
                        children: [
                          Icon(
                            FeatherIcons.mapPin,
                            color: secondaryColor,
                          ),
                          hSpace5,
                          Text(
                            _listEvents[index].address,
                            style: boldWhiteTextStyle14,
                          ),
                        ],
                      )
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
