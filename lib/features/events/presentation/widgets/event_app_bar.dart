import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:ionicons/ionicons.dart';
import 'package:waaa/core/constants/image_constants.dart';
import 'package:waaa/core/enums/event_enum.dart';
import 'package:waaa/core/theme/colors.dart';
import 'package:waaa/features/events/presentation/manager/bloc/event_detail/event_detail_bloc.dart';
import 'package:waaa/models/Event.dart';

class EventDetailAppBar extends StatelessWidget {
  const EventDetailAppBar({
    super.key,
    required this.currentEvent,
  });

  final Event currentEvent;

  @override
  Widget build(BuildContext context) {
    final EventDetailBloc eventDetailBloc = context.read<EventDetailBloc>();
    return BlocBuilder<EventDetailBloc, EventDetailState>(
      builder: (context, state) {
        return SliverAppBar(
          pinned: true,
          expandedHeight: 230.0,
          backgroundColor: Colors.white,
          elevation: 0,
          flexibleSpace: FlexibleSpaceBar(
              background: Stack(
            fit: StackFit.expand,
            children: [
              Image.network(
                currentEvent.mainPhoto ?? noPhotoImage,
                fit: BoxFit.cover,
              ),
              if (state.status == EventDetailEnum.updateDetail)
                Align(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 10.0, bottom: 10.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50.0),
                        color: secondaryColor,
                      ),
                      child: IconButton(
                        onPressed: () {
                          // Search photo
                        },
                        icon: const Icon(
                          Ionicons.pencil,
                        ),
                      ),
                    ),
                  ),
                )
            ],
          )),
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: Colors.white),
              child: IconButton(
                onPressed: () {
                  (state.status == EventDetailEnum.showDetail)
                      ? Navigator.of(context).pop()
                      : eventDetailBloc.add(EventGoToDetailPressed());
                },
                icon: const Icon(
                  FeatherIcons.chevronLeft,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
