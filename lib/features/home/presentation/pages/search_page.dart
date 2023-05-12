import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:group_button/group_button.dart';
import 'package:waaa/component/form_textfield.dart';
import 'package:waaa/component/groupbutton_list.dart';
import 'package:waaa/core/constants/spacer.dart';
import 'package:waaa/core/theme/common_widget/button.dart';
import 'package:waaa/core/theme/text_styles.dart';
import 'package:waaa/core/util/localized.dart';
import 'package:waaa/core/util/mocks/gender.dart';
import 'package:waaa/core/util/mocks/travels.dart';

import '../../../../core/theme/common_widget/group_button_style.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    TextEditingController titleController = TextEditingController();
    TextEditingController localisationController = TextEditingController();
    TextEditingController nationalityController = TextEditingController();
    GroupButtonController travelTypeController = GroupButtonController();
    GroupButtonController genderController = GroupButtonController();

    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            WaaaTextField(
              controller: titleController,
              label: localized(context).nickname,
              leadingIcon: FeatherIcons.search,
            ),
            vSpace30,
            WaaaTextField(
              controller: localisationController,
              label: localized(context).where_is_the_traveler,
              leadingIcon: FeatherIcons.search,
            ),
            vSpace20,
            WaaaTextField(
              controller: nationalityController,
              label: localized(context).nationality,
              leadingIcon: FeatherIcons.search,
            ),
            const ShowSelectedNationality(
              nationalities: ["Française", "Colombienne", "Japonnaise"],
            ),
            vSpace20,
            WaaaGroupButton(
              groupController: travelTypeController,
              list: mockTravelType,
              title: localized(context).type_of_travel,
            ),
            vSpace20,
            WaaaGroupButton(
              groupController: genderController,
              list: mockGender,
              title: localized(context).gender,
            ),
            vSpace20,
            const WaaaRangeSlider(),
            vSpace20,
            SizedBox(
              height: 50,
              child: ElevatedButton(
                onPressed: () {},
                style: primaryButton,
                child: Text(
                  localized(context).search,
                  style: regularTextStyle16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ShowSelectedNationality extends StatelessWidget {
  const ShowSelectedNationality({super.key, required this.nationalities});

  final List<String> nationalities;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      padding: const EdgeInsets.only(left: 40, top: 10),
      child: ListView.builder(
        itemCount: nationalities.length,
        itemBuilder: (_, index) {
          return Text(
            nationalities[index],
            style: regularTextStyle16,
          );
        },
      ),
    );
  }
}

class WaaaRangeSlider extends StatefulWidget {
  const WaaaRangeSlider({super.key});

  @override
  State<WaaaRangeSlider> createState() => _WaaaRangeSliderState();
}

class _WaaaRangeSliderState extends State<WaaaRangeSlider> {
  RangeValues range = const RangeValues(22, 80);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          localized(context).age,
          style: semiBoldTextStyle16,
        ),
        vSpace20,
        RangeSlider(
          values: range,
          min: 0,
          max: 100,
          onChanged: (value) {
            setState(() {
              range = value;
            });
          },
        ),
      ],
    );
  }
}
