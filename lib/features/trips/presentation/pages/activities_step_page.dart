import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionicons/ionicons.dart';
import 'package:waaa/component/search_field.dart';
import 'package:waaa/core/constants/spacer.dart';
import 'package:waaa/core/theme/colors.dart';
import 'package:waaa/core/theme/text_styles.dart';
import 'package:waaa/features/hobbies/presentation/widgets/hobbies_gridview.dart';
import 'package:waaa/features/trips/presentation/bloc/activities_step_bloc.dart';
import 'package:waaa/features/trips/presentation/widgets/fil_arrianne_trips.dart';

class ActivitiesStepPage extends StatelessWidget {
  const ActivitiesStepPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController searchField = TextEditingController();
    return BlocBuilder<ActivitiesBloc, ActivitiesStepState>(
      builder: (context, state) {
        return SingleChildScrollView(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              const FilArianeTrips(currentStep: 2),
              vSpace20,
              for (var destination in state.destinations) ...{
                Container(
                  padding: const EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      style: BorderStyle.solid,
                      color: lightGrayColor,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Ionicons.location,
                            color: primaryColor,
                          ),
                          Text(
                            destination.city,
                            style: boldTextStyle20,
                          ),
                          Text(
                            ", ${destination.country}",
                            style: regularTextStyle20,
                          ),
                        ],
                      ),
                      vSpace20,
                      WaaaSearchField(
                        searchList:
                            state.activities.map((e) => e!.activity).toList(),
                        callback: (value) {},
                        onChange: (value) {},
                      ),
                      vSpace15,
                      const ActivitiesGridWidget(activities: [])
                    ],
                  ),
                ),
                vSpace15,
              },
              Text(
                "TEST",
                style: boldTextStyle24,
              ),
            ],
          ),
        );
      },
    );
  }
}
