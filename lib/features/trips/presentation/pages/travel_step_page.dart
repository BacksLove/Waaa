import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waaa/component/snack_bar.dart';
import 'package:waaa/core/enums/trips_enum.dart';
import 'package:waaa/features/trips/presentation/bloc/travel_step_bloc.dart';
import 'package:waaa/features/trips/presentation/widgets/travel_step_date_view.dart';
import 'package:waaa/features/trips/presentation/widgets/travel_step_info_view.dart';
import 'package:waaa/features/trips/presentation/widgets/travel_step_trips_view.dart';

class TravelStepPage extends StatelessWidget {
  const TravelStepPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TravelStepBloc, TravelStepState>(
      listener: (context, state) {
        if (state.error == TripsError.tripNameEmpty) {
          showFloatingFlushbar(
              context, null, "Entrez un nom"); // TODO: Localized
        }
      },
      builder: (context, state) {
        if (state.steps == TravelSteps.infos) {
          return const TravelStepView();
        } else if (state.steps == TravelSteps.date) {
          return const TravelStepDateView();
        } else if (state.steps == TravelSteps.trip) {
          return const TravelStepTripView();
        }
        return Container();
      },
    );
  }
}
