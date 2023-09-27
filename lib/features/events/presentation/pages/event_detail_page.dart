import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waaa/component/error_screen.dart';
import 'package:waaa/component/loading_screen.dart';
import 'package:waaa/core/enums/event_enum.dart';
import 'package:waaa/features/events/presentation/manager/bloc/event_detail/event_detail_bloc.dart';
import 'package:waaa/features/events/presentation/widgets/event_app_bar.dart';
import 'package:waaa/features/events/presentation/widgets/event_detail_view.dart';
import 'package:waaa/features/events/presentation/widgets/event_edit_view.dart';

import 'package:waaa/injection_container.dart' as di;

class EventDetailPage extends StatelessWidget {
  const EventDetailPage({Key? key, required this.eventId}) : super(key: key);

  final String eventId;

  @override
  Widget build(BuildContext context) {
    final EventDetailBloc eventDetailBloc = di.sl<EventDetailBloc>();
    return BlocProvider(
      create: (context) =>
          eventDetailBloc..add(EventDetailLoadData(eventId: eventId)),
      child: Scaffold(
        body: BlocBuilder<EventDetailBloc, EventDetailState>(
          builder: (context, state) {
            if (state.status == EventDetailEnum.failed) {
              return const ErrorScreen();
            } else if (state.status == EventDetailEnum.loading) {
              return const LoadingScreen(
                text: "chargement en cours",
              );
            } else if (state.status == EventDetailEnum.showDetail) {
              return CustomScrollView(
                slivers: [
                  EventDetailAppBar(currentEvent: state.currentEvent),
                  ShowEventDetails(currentEvent: state.currentEvent),
                ],
              );
            } else if (state.status == EventDetailEnum.updateDetail) {
              return CustomScrollView(
                slivers: [
                  EventDetailAppBar(currentEvent: state.currentEvent),
                  EditEvent(currentEvent: state.currentEvent),
                ],
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}
