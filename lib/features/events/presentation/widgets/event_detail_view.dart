import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:ionicons/ionicons.dart';
import 'package:waaa/core/theme/colors.dart';
import 'package:waaa/core/theme/text_styles.dart';
import 'package:waaa/core/util/localized.dart';
import 'package:waaa/features/events/presentation/widgets/event_detail_button_row.dart';
import 'package:waaa/features/events/presentation/widgets/event_detail_tile.dart';
import 'package:waaa/features/home/presentation/widgets/user_carrousel.dart';
import 'package:waaa/models/Event.dart';
import '../../../../core/constants/spacer.dart';

class ShowEventDetails extends StatelessWidget {
  const ShowEventDetails({
    super.key,
    required this.currentEvent,
  });

  final Event currentEvent;

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.all(15),
      sliver: SliverList(
          delegate: SliverChildListDelegate([
        Text(
          currentEvent.isPublic != null && currentEvent.isPublic!
              ? localized(context).public_event
              : localized(context).private_event,
          style: lightPrimarySemiBoldTextStyle12,
        ),
        vSpace15,
        Text(
          currentEvent.name,
          style: boldTextStyle24,
        ),
        vSpace25,
        const EventButtonRow(),
        vSpace15,
        EventDetailTile(
            icon: Ionicons.checkmark_circle,
            tileKey: localized(context).theme,
            tileValue: currentEvent.topic.name),
        EventDetailTile(
            icon: Ionicons.pencil,
            tileKey: localized(context).description,
            tileValue: currentEvent.description),
        EventDetailTile(
            icon: Ionicons.location,
            tileKey: localized(context).place,
            tileValue:
                "${currentEvent.city}, ${currentEvent.country} - ${currentEvent.address}"),
        EventDetailTile(
            icon: Ionicons.calendar,
            tileKey: "Date et heure",
            tileValue:
                // Todo : Mettre le texte dans le localized
                "\nDébut : ${currentEvent.begin}\nFin : ${currentEvent.end} à ${currentEvent.hourEnd}"),
        vSpace20,
        // Infos
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: lightGrayColor)),
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
                        currentEvent.participants?.length != null
                            ? currentEvent.participants!.length.toString()
                            : "0",
                        style: lightPrimaryBoldTextStyle18,
                      ),
                      Text(
                        localized(context).participate,
                        style: regularTextStyle16,
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Text(
                        "0",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: lightPrimaryColor),
                      ),
                      Text(
                        localized(context).interested,
                        style: regularTextStyle16,
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Text(
                        currentEvent.nbShare == null
                            ? "0"
                            : currentEvent.nbShare.toString(),
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: lightPrimaryColor),
                      ),
                      Text(
                        localized(context).shares,
                        style: regularTextStyle16,
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
            Ionicons.person,
            color: primaryColor,
          ),
          title: Text(
            localized(context).coorganizers,
            style: boldTextStyle18,
          ),
        ),
        CoorganizerCarrousel(coowners: currentEvent.coowner, withName: true),
        // Convives
        ListTile(
          leading: Icon(
            Ionicons.people,
            color: primaryColor,
          ),
          title: Text(
            localized(context).guests,
            style: boldTextStyle18,
          ),
        ),
        ParticipantCarrousel(
            paticipants: currentEvent.participants, withName: true),
        // Audiences
        const SizedBox(height: 15),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Audience de l'evenenement",
              style: semiBoldTextStyle16,
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                FeatherIcons.moreHorizontal,
              ),
            ),
          ],
        )
      ])),
    );
  }
}
