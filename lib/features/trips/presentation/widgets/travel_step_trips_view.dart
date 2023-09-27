import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionicons/ionicons.dart';
import 'package:waaa/core/constants/spacer.dart';
import 'package:waaa/core/theme/colors.dart';
import 'package:waaa/core/theme/common_widget/button.dart';
import 'package:waaa/core/theme/text_styles.dart';
import 'package:waaa/core/util/input_converter.dart';
import 'package:waaa/core/util/localized.dart';
import 'package:waaa/features/trips/presentation/bloc/create_trip_bloc.dart';
import 'package:waaa/features/trips/presentation/bloc/travel_step_bloc.dart';
import 'package:waaa/features/trips/presentation/widgets/add_destination_bottomsheet.dart';
import 'package:waaa/features/trips/presentation/widgets/fil_arrianne_trips.dart';
import 'package:waaa/models/ModelProvider.dart' as mp;

class TravelStepTripView extends StatelessWidget {
  const TravelStepTripView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TravelStepBloc, TravelStepState>(
      builder: (bloccontext, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const FilArianeTrips(currentStep: 0),
            vSpace40,
            Text(
              localized(context).departure,
              style: semiBoldTextStyle16,
            ),
            vSpace20,
            Expanded(
              child: TripsDestinationList(
                countries: state.destinations,
                blocContext: bloccontext,
              ),
            ),
            vSpace20,
            AddDestinationItem(blocContext: bloccontext),
            vSpace20,
            SizedBox(
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {
                      context
                          .read<TravelStepBloc>()
                          .add(ToThePreviousScreenEvent());
                    },
                    child: Text(localized(context).back),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 2.2,
                    child: ElevatedButton(
                      style: primaryButton,
                      onPressed: () {
                        context.read<TravelStepBloc>().add(ToTheNexStepevent());
                      },
                      child: Text(
                        localized(context).next,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}

class TripsDestinationList extends StatelessWidget {
  const TripsDestinationList(
      {super.key, required this.countries, required this.blocContext});

  final List<mp.Step> countries;
  final BuildContext blocContext;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: ListView.builder(
        itemCount: countries.length,
        itemBuilder: (_, index) {
          return TripsDestinationItem(
            destination: countries[index],
            blocContext: blocContext,
          );
        },
      ),
    );
  }
}

class TripsDestinationItem extends StatelessWidget {
  const TripsDestinationItem(
      {super.key, required this.destination, required this.blocContext});

  final mp.Step destination;
  final BuildContext blocContext;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 2,
          child: Text(
            DateConverter().dateToDateString(destination.begin!.getDateTime()),
            style: regularTextStyle16,
          ),
        ),
        Expanded(
          flex: 1,
          child: CircleAvatar(
            backgroundColor: transparentColor,
            child: const Icon(Ionicons.globe),
          ),
        ),
        Expanded(
          flex: 4,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                destination.country,
                style: boldTextStyle16,
              ),
              Text(
                destination.city,
                style: regularTextStyle16,
              ),
            ],
          ),
        ),
        IconButton(
          icon: const Icon(Ionicons.pencil_outline),
          onPressed: () {
            showModalBottomSheet(
                isScrollControlled: true,
                context: context,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(25.0),
                  ),
                ),
                builder: (context) => AddDestinationBottomSheet(
                      blocContext: blocContext,
                      step: destination,
                    ));
          },
          color: lightGrayColor,
        )
      ],
    );
  }
}

class AddDestinationItem extends StatelessWidget {
  const AddDestinationItem({super.key, required this.blocContext});

  final BuildContext blocContext;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Container(),
          ),
          Expanded(
            flex: 1,
            child: CircleAvatar(
              backgroundColor: transparentColor,
              child: const Icon(Ionicons.globe),
            ),
          ),
          Expanded(
            flex: 4,
            child: ElevatedButton(
              style: outlinedBlackButton,
              child: ListTile(
                leading: const Icon(Ionicons.add_circle_sharp),
                title: Text(localized(context).destinations),
              ),
              onPressed: () {
                showModalBottomSheet(
                    isScrollControlled: true,
                    context: context,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(25.0),
                      ),
                    ),
                    builder: (context) => AddDestinationBottomSheet(
                          blocContext: blocContext,
                        ));
              },
            ),
          ),
        ],
      ),
    );
  }
}
