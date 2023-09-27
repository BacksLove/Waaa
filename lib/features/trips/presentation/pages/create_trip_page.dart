import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionicons/ionicons.dart';
import 'package:waaa/core/enums/trips_enum.dart';
import 'package:waaa/core/theme/colors.dart';
import 'package:waaa/core/theme/text_styles.dart';
import 'package:waaa/core/util/localized.dart';
import 'package:waaa/features/trips/presentation/bloc/activities_step_bloc.dart';
import 'package:waaa/features/trips/presentation/bloc/create_trip_bloc.dart';
import 'package:waaa/features/trips/presentation/bloc/photo_step_bloc.dart';
import 'package:waaa/features/trips/presentation/bloc/travel_step_bloc.dart';
import 'package:waaa/features/trips/presentation/pages/activities_step_page.dart';
import 'package:waaa/features/trips/presentation/pages/photo_step_page.dart';
import 'package:waaa/features/trips/presentation/pages/travel_step_page.dart';

import 'package:waaa/injection_container.dart' as di;

class CreateTripPage extends StatefulWidget {
  const CreateTripPage({super.key});

  @override
  State<CreateTripPage> createState() => _CreateTripPageState();
}

class _CreateTripPageState extends State<CreateTripPage> {
  late CreateTripBloc createTripBloc;

  @override
  void initState() {
    createTripBloc = di.sl<CreateTripBloc>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => di.sl<CreateTripBloc>()),
        BlocProvider(create: (context) => di.sl<TravelStepBloc>()),
        BlocProvider(create: (context) => di.sl<PhotoStepBloc>()),
        BlocProvider(create: (context) => di.sl<ActivitiesBloc>()),
      ],
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: transparentColor,
          elevation: 0,
          leading: IconButton(
            icon: Icon(
              Ionicons.close,
              color: blackColor,
            ),
            onPressed: () {},
          ),
          title: Text(
            localized(context).create_a_trip,
            style: appBarTextStyle,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: BlocBuilder<CreateTripBloc, CreateTripState>(
            builder: (context, state) {
              switch (state.steps) {
                case TripsSteps.travelStep:
                  return const TravelStepPage();
                case TripsSteps.photoStep:
                  return const PhotoStepPage();
                case TripsSteps.activityStep:
                  return const ActivitiesStepPage();
                case TripsSteps.locomotionStep:
                  return Container();
                case TripsSteps.homeSteps:
                  return Container();
                case TripsSteps.participationStep:
                  return Container();
                case TripsSteps.resumeStep:
                  return Container();
              }
            },
          ),
        ),
      ),
    );
  }
}
