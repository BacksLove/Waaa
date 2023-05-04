import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:waaa/core/theme/colors.dart';
import 'package:waaa/core/theme/common_widget/button.dart';
import 'package:waaa/core/theme/text_styles.dart';
import 'package:waaa/core/util/input_converter.dart';
import 'package:waaa/core/util/localized.dart';
import 'package:waaa/core/util/maps.dart';
import 'package:waaa/core/util/mocks/events.dart';
import 'package:waaa/features/events/presentation/widgets/event_carousel.dart';

import '../../../../component/dropdown.dart';
import '../../../../core/constants/spacer.dart';
import '../../../users/domain/entities/user_entity.dart';

class ProfilPage extends StatefulWidget {
  const ProfilPage({super.key, required this.currentUser});

  final User currentUser;

  @override
  State<ProfilPage> createState() => _ProfilPageState();
}

class _ProfilPageState extends State<ProfilPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(slivers: [
      UserProfileAppBar(
        currentUser: widget.currentUser,
      ),
      ShowUserDetails(currentUser: widget.currentUser),
    ]));
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
    return SliverPadding(
      padding: const EdgeInsets.all(15),
      sliver: SliverList(
          delegate: SliverChildListDelegate(
        [
          //! Rang du prénom
          vSpace15,
          Row(
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
              hSpace10,
              IconButton(
                onPressed: () {},
                icon: const Icon(FeatherIcons.moreVertical),
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
              const Text(
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
              const Text(
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
                  children: const [
                    Text(
                      "24",
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
                    const Text(
                      "11k",
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
          vSpace20,
          const Placeholder(
            fallbackHeight: 100,
          ),
          vSpace30,
          const Placeholder(
            fallbackHeight: 40,
          ),
          //! Mes voyages
          //const MyTripsTab(),
          //! Mon actualités
          const MyNewsTab(),
          vSpace100,
        ],
      )),
    );
  }
}

class ShowSpokenLanguages extends StatelessWidget {
  const ShowSpokenLanguages({super.key, required this.spokenLanguages});

  final List<String> spokenLanguages;

  @override
  Widget build(BuildContext context) {
    return const Placeholder(
      fallbackHeight: 50,
    );
  }
}

class UserProfileAppBar extends StatelessWidget {
  const UserProfileAppBar({
    super.key,
    required this.currentUser,
  });

  final User currentUser;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      expandedHeight: 180.0,
      backgroundColor: Colors.white,
      elevation: 0,
      flexibleSpace: FlexibleSpaceBar(
        background: Image.network(
          (currentUser.photo != null) ? currentUser.photo! : "photo a définir",
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
      actions: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100), color: Colors.white),
            child: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(
                FeatherIcons.messageSquare,
                color: Colors.black,
              ),
            ),
          ),
        ),
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
          height: 200,
          child: const ShowMaps(),
        ),
      ],
    );
  }
}

class MyNewsTab extends StatelessWidget {
  const MyNewsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        vSpace30,
        Text(
          localized(context).news_feed,
          style: boldTextStyle24,
        ),
        vSpace20,
        EventsCarouselWidget(listEvents: mockEventsList),
      ],
    );
  }
}
