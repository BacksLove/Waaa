import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:waaa/component/date_picker.dart';
import 'package:waaa/core/theme/colors.dart';
import 'package:waaa/core/util/localized.dart';

import '../../../../component/dropdown.dart';
import '../../../../component/form_textfield.dart';
import '../../../../component/toggle_button.dart';

class CreateEventPage extends StatelessWidget {
  const CreateEventPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> dropdownMock = [
      "Festif",
      "Restaurant",
      "Concert",
      "Visite"
    ];

    final List<String> dropdownMock1 = [
      "0 - 10",
      "10 - 50",
      "50 - 100",
      "+ 100"
    ];

    TextEditingController titleController = TextEditingController();
    TextEditingController adressController = TextEditingController();
    TextEditingController startDateController = TextEditingController();
    TextEditingController endDateController = TextEditingController();

    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            localized(context).create_an_event,
            style: const TextStyle(color: Colors.black),
          ),
          leading: IconButton(
            icon: const Icon(FeatherIcons.x),
            color: Colors.black,
            onPressed: () => Navigator.pop(context),
          ),
          backgroundColor: transparentColor,
          elevation: 0,
        ),
        body: Container(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              WaaaTextField(
                controller: titleController,
                label: localized(context).name_of_the_event,
                isColored: true,
              ),
              const SizedBox(
                height: 20,
              ),
              const Placeholder(
                fallbackHeight: 140,
                fallbackWidth: double.infinity,
              ),
              const SizedBox(
                height: 20,
              ),
              WaaaToggleButton(
                trueText: localized(context).private_event,
                falseText: localized(context).public_event,
                onChanged: (value) {},
              ),
              const SizedBox(
                height: 20,
              ),
              WaaaDropdownWidget(
                labelText: localized(context).theme,
                items: dropdownMock,
                onChanged: (value) {},
                selectedItem: null,
              ),
              const SizedBox(
                height: 20,
              ),
              WaaaTextField(
                controller: adressController,
                label: localized(context).event_adress,
                icondata: FeatherIcons.mapPin,
              ),
              const SizedBox(
                height: 20,
              ),
              WaaaDatePicker(
                  controller: startDateController,
                  label: localized(context).start_date_and_time),
              const SizedBox(
                height: 20,
              ),
              WaaaDatePicker(
                  controller: endDateController,
                  label: localized(context).end_date_and_time),
              const SizedBox(
                height: 20,
              ),
              WaaaDropdownWidget(
                labelText: localized(context).number_of_people,
                items: dropdownMock1,
                onChanged: (value) {},
                selectedItem: null,
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width / 2.3,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50.0),
                      color: lightPrimaryColor,
                    ),
                    height: 5.0,
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 2.3,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50.0),
                      color: lightGrayColor,
                    ),
                    height: 5.0,
                  ),
                ],
              )
            ],
          ),
        ));
  }
}
