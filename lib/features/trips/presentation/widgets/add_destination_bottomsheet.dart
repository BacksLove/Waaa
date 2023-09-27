import 'package:aws_common/aws_common.dart';
import 'package:country_state_city_picker/country_state_city_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:group_button/group_button.dart';
import 'package:waaa/component/groupbutton_list.dart';
import 'package:waaa/component/number_wheel.dart';
import 'package:waaa/core/constants/spacer.dart';
import 'package:waaa/core/theme/colors.dart';
import 'package:waaa/core/theme/common_widget/button.dart';
import 'package:waaa/core/theme/text_styles.dart';
import 'package:waaa/core/util/localized.dart';
import 'package:waaa/features/trips/presentation/bloc/travel_step_bloc.dart';
import 'package:waaa/models/ModelProvider.dart' as mp;

class AddDestinationBottomSheet extends StatelessWidget {
  const AddDestinationBottomSheet(
      {super.key, required this.blocContext, this.step});

  final BuildContext blocContext;
  final mp.Step? step;

  @override
  Widget build(BuildContext context) {
    String country = "";
    String city = "";
    int days = 0;
    int weeks = 0;
    int months = 0;

    GroupButtonController categoryController = GroupButtonController();
    // TODO : Traduire cette bottomSheet et mock
    return BlocProvider.value(
      value: BlocProvider.of<TravelStepBloc>(blocContext),
      child: BlocBuilder<TravelStepBloc, TravelStepState>(
        builder: (context, state) {
          return SingleChildScrollView(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  localized(context).add_trip,
                  style: boldTextStyle18,
                  textAlign: TextAlign.center,
                ),
                vSpace30,
                SelectState(
                  onCountryChanged: (value) {
                    country = value;
                  },
                  onStateChanged: (value) {},
                  onCityChanged: (value) {
                    city = value;
                  },
                ),
                vSpace20,
                Text(
                  "Motif du voyage",
                  style: semiBoldTextStyle16,
                ),
                vSpace15,
                WaaaGroupButton(
                  groupController: categoryController,
                  list: state.categories.map((e) => e!.name).toList(),
                  isRadio: true,
                ),
                vSpace20,
                Text(
                  localized(context).duration,
                  style: semiBoldTextStyle16,
                ),
                vSpace15,
                Text(
                  localized(context).how_long_was_your_stay,
                  style: regularTextStyle16,
                ),
                vSpace10,
                SizedBox(
                  height: 200,
                  child: Row(
                    children: [
                      Expanded(
                        child: WaaaNumberWheel(
                          maxValue: 7,
                          callback: (value) {
                            days = value;
                          },
                        ),
                      ),
                      Expanded(
                        child: WaaaNumberWheel(
                          maxValue: 10,
                          callback: (value) {
                            weeks = value;
                          },
                        ),
                      ),
                      Expanded(
                        child: WaaaNumberWheel(
                          maxValue: 10,
                          callback: (value) {
                            months = value;
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 50,
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          localized(context).days,
                          style: regularTextStyle16.copyWith(
                              color: lightGrayColor),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          'Semaine',
                          style: regularTextStyle16.copyWith(
                              color: lightGrayColor),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          "Mois",
                          style: regularTextStyle16.copyWith(
                              color: lightGrayColor),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
                vSpace20,
                ElevatedButton(
                  style: primaryButton,
                  onPressed: () {
                    blocContext.read<TravelStepBloc>().add(AddNewStepEvent(
                          country: country,
                          city: city,
                          days: days,
                          weeks: weeks,
                          months: months,
                          categoryIndex: categoryController.selectedIndex ?? 0,
                          modifyStep: step != null,
                          step: step,
                        ));
                    Navigator.pop(context);
                  },
                  child: Text(localized(context).add),
                ),
                vSpace20,
              ],
            ),
          );
        },
      ),
    );
  }
}

/*Widget addDestinationBottomSheetWidget(BuildContext context) {
  String country = "";
  String city = "";
  int days = 0;
  int weeks = 0;
  int months = 0;
  GroupButtonController categoryController = GroupButtonController();

  return BlocBuilder<TravelStepBloc, TravelStepState>(
    builder: (context, state) {
      return SingleChildScrollView(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              localized(context).add_trip,
              style: boldTextStyle18,
              textAlign: TextAlign.center,
            ),
            vSpace30,
            SelectState(
              onCountryChanged: (value) {
                country = value;
              },
              onStateChanged: (value) {},
              onCityChanged: (value) {
                city = value;
              },
            ),
            vSpace20,
            Text(
              "Motif du voyage",
              style: semiBoldTextStyle16,
            ),
            vSpace15,
            WaaaGroupButton(
              groupController: categoryController,
              list: state.categories.map((e) => e!.name).toList(),
              isRadio: true,
            ),
            vSpace20,
            Text(
              localized(context).duration,
              style: semiBoldTextStyle16,
            ),
            vSpace15,
            Text(
              localized(context).how_long_was_your_stay,
              style: regularTextStyle16,
            ),
            vSpace10,
            SizedBox(
              height: 200,
              child: Row(
                children: [
                  Expanded(
                    child: WaaaNumberWheel(
                      maxValue: 7,
                      callback: (value) {
                        days = value;
                      },
                    ),
                  ),
                  Expanded(
                    child: WaaaNumberWheel(
                      maxValue: 10,
                      callback: (value) {
                        weeks = value;
                      },
                    ),
                  ),
                  Expanded(
                    child: WaaaNumberWheel(
                      maxValue: 15,
                      callback: (value) {
                        months = value;
                      },
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 50,
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      localized(context).days,
                      style: regularTextStyle16.copyWith(color: lightGrayColor),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      'Semaine',
                      style: regularTextStyle16.copyWith(color: lightGrayColor),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      "Mois",
                      style: regularTextStyle16.copyWith(color: lightGrayColor),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
            vSpace20,
            ElevatedButton(
              style: primaryButton,
              onPressed: () {
                context.read<TravelStepBloc>().add(AddNewStepEvent(
                    country: country,
                    city: city,
                    days: days,
                    weeks: weeks,
                    months: months,
                    categoryIndex: categoryController.selectedIndex ?? 0));
              },
              child: Text(localized(context).add),
            ),
            vSpace20,
          ],
        ),
      );
    },
  );
}
*/