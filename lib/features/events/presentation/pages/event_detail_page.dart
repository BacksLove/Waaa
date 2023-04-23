import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:waaa/core/theme/colors.dart';
import 'package:waaa/core/util/input_converter.dart';
import 'package:waaa/core/util/localized.dart';
import 'package:waaa/features/events/domain/entities/event_entity.dart';
import 'package:waaa/features/home/presentation/pages/home_page.dart';

import '../../../../component/date_picker.dart';
import '../../../../component/dropdown.dart';
import '../../../../component/form_textfield.dart';
import '../../../../component/toggle_button.dart';

class EventDetailPage extends StatelessWidget {
  EventDetailPage({Key? key, required this.currentEvent}) : super(key: key);

  final Event currentEvent;

  final List<String> dropdownMock = [
    "Festif",
    "Restaurant",
    "Concert",
    "Visite"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(slivers: [
      EventDetailAppBar(
        currentEvent: currentEvent,
      ),
      ShowEventDetails(currentEvent: currentEvent),
      //EditEvent(titleController: titleController, dropdownMock: dropdownMock, debutDateController: debutDateController),
    ]));
  }
}

class EditEvent extends StatelessWidget {
  const EditEvent({super.key, required this.currentEvent});

  final Event currentEvent;

  @override
  Widget build(BuildContext context) {
    final List<String> dropdownMock = [
      "Festif",
      "Restaurant",
      "Concert",
      "Visite"
    ];

    TextEditingController debutDateController = TextEditingController();
    TextEditingController endDateController = TextEditingController();
    TextEditingController addressController = TextEditingController();
    TextEditingController titleController = TextEditingController();

    titleController.text = currentEvent.name;
    debutDateController.text =
        DateConverter().dateToDateString(currentEvent.begin);
    endDateController.text = DateConverter().dateToDateString(currentEvent.end);
    addressController.text = currentEvent.address;

    return SliverPadding(
        padding: const EdgeInsets.all(15),
        sliver: SliverList(
          delegate: SliverChildListDelegate(
            [
              WaaaTextField(
                controller: titleController,
                label: localized(context).name_of_the_event,
                isColored: true,
              ),
              const SizedBox(
                height: 20,
              ),
              WaaaToggleButton(
                  trueText: localized(context).public_event,
                  falseText: localized(context).private_event,
                  onChanged: (value) {}),
              const SizedBox(
                height: 20,
              ),
              WaaaDropdownWidget(
                labelText: "Theme",
                items: dropdownMock,
                selectedItem: dropdownMock.first,
                onChanged: (value) {},
              ),
              const SizedBox(
                height: 20,
              ),
              WaaaTextField(
                controller: titleController,
                label: localized(context).name_of_the_event,
                icondata: FeatherIcons.mapPin,
              ),
              const SizedBox(
                height: 20,
              ),
              WaaaDatePicker(
                controller: debutDateController,
                label: localized(context).start_date_and_time,
              ),
              const SizedBox(
                height: 20,
              ),
              TextButton(
                  onPressed: () {
                    DatePicker.showDateTimePicker(context,
                        showTitleActions: true,
                        minTime: DateTime(2018, 3, 5),
                        maxTime: DateTime(2019, 6, 7),
                        onChanged: (date) {},
                        onConfirm: (date) {},
                        currentTime: DateTime.now(),
                        locale: LocaleType.fr);
                  },
                  child: const Text(
                    'show date time picker',
                    style: TextStyle(color: Colors.blue),
                  )),
              const SizedBox(
                height: 20,
              ),
              WaaaDropdownWidget(
                labelText: "Theme",
                items: dropdownMock,
                selectedItem: dropdownMock.first,
                onChanged: (value) {},
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ));
  }
}

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
          currentEvent.isPublic ? "Evenement public" : "Evenement privé",
          style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: lightPrimaryColor),
        ),
        const SizedBox(
          height: 15,
        ),
        Text(
          currentEvent.name,
          style: const TextStyle(
              fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        const SizedBox(
          height: 25,
        ),
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
                  const SizedBox(
                    height: 5,
                  ),
                  const Text(
                    "Interessée",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                        color: Colors.black),
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
                  const SizedBox(
                    height: 5,
                  ),
                  const Text(
                    "Participe",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                        color: Colors.black),
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
                  const SizedBox(
                    height: 5,
                  ),
                  const Text(
                    "Partager",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                        color: Colors.black),
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
                  const SizedBox(
                    height: 5,
                  ),
                  const Text(
                    "Plus",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                        color: Colors.black),
                  )
                ],
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 15,
        ),
        const EventDetailTile(
            icon: FeatherIcons.checkCircle,
            tileKey: "Thème",
            tileValue: "festif"),
        EventDetailTile(
            icon: FeatherIcons.penTool,
            tileKey: "Description",
            tileValue: currentEvent.description ?? ""),
        EventDetailTile(
            icon: FeatherIcons.mapPin,
            tileKey: "Lieu",
            tileValue:
                "${currentEvent.city}, ${currentEvent.country} - ${currentEvent.address}"),
        EventDetailTile(
            icon: FeatherIcons.calendar,
            tileKey: "Date et heure",
            tileValue:
                "Début : ${currentEvent.begin} à ${currentEvent.hourBegin}\nFin : ${currentEvent.end} à ${currentEvent.hourEnd}"),
        const SizedBox(
          height: 20,
        ),
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
                        "56",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: lightPrimaryColor),
                      ),
                      const Text(
                        "participants",
                        style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 15,
                            color: Colors.black),
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
                            color: lightPrimaryColor),
                      ),
                      const Text(
                        "interessé(é)s",
                        style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 15,
                            color: Colors.black),
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
                            color: lightPrimaryColor),
                      ),
                      const Text(
                        "partages",
                        style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 15,
                            color: Colors.black),
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
                fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
          ),
        ),
        const UserListCarrousel(userNear: [], withName: true),
        // Convives
        ListTile(
          leading: Icon(
            FeatherIcons.user,
            color: primaryColor,
          ),
          title: const Text(
            "Les convive(s)",
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
          ),
        ),
        UserListCarrousel(
            userNear: currentEvent.participants ?? [], withName: true),
        // Audiences
        const SizedBox(height: 15),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Audience de l'evenenement",
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
            ),
            IconButton(
                onPressed: () {},
                icon: const Icon(FeatherIcons.moreHorizontal)),
          ],
        )
      ])),
    );
  }
}

class EventDetailAppBar extends StatelessWidget {
  const EventDetailAppBar({
    super.key,
    required this.currentEvent,
  });

  final Event currentEvent;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      expandedHeight: 180.0,
      backgroundColor: Colors.white,
      elevation: 0,
      flexibleSpace: FlexibleSpaceBar(
        background: Image.network(
          currentEvent.mainPhoto,
          fit: BoxFit.cover,
        ),
      ),
      leading: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100), color: Colors.white),
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
    );
  }
}

class EventDetailTile extends StatelessWidget {
  const EventDetailTile(
      {Key? key,
      required this.icon,
      required this.tileKey,
      required this.tileValue})
      : super(key: key);

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
        text: TextSpan(children: [
          TextSpan(
              text: "$tileKey : ",
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.black)),
          TextSpan(
              text: tileValue,
              style: const TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 18,
                  color: Colors.black))
        ]),
      ),
    );
  }
}
