import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:waaa/component/loading_screen.dart';
import 'package:waaa/component/snack_bar.dart';
import 'package:waaa/core/enums/event_enum.dart';
import 'package:waaa/core/theme/colors.dart';
import 'package:waaa/core/theme/text_styles.dart';
import 'package:waaa/core/util/localized.dart';
import 'package:waaa/features/events/presentation/manager/bloc/create_event/create_event_bloc.dart';
import 'package:waaa/features/events/presentation/pages/create_event_part_one.dart';
import 'package:waaa/features/events/presentation/pages/create_event_part_two.dart';

import 'package:waaa/injection_container.dart' as di;

class CreateEventPage extends StatelessWidget {
  const CreateEventPage({super.key});

  @override
  Widget build(BuildContext context) {
    final CreateEventBloc createEventBloc = di.sl<CreateEventBloc>();

    return BlocProvider(
      create: (context) => createEventBloc..add(CreateEventLoadData()),
      child: BlocConsumer<CreateEventBloc, CreateEventState>(
        listener: (context, state) {
          if (state.errorMessage != null && state.errorMessage!.isNotEmpty) {
            showSnackBar(context, state.errorMessage!);
          }
          if (state.step == CreateEventStep.done) {
            Navigator.pop(context);
          }
        },
        builder: (context, state) {
          if (state.step == CreateEventStep.creating) {
            return LoadingScreen(
              text: localized(context).create_an_event,
            );
          }
          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: Text(
                localized(context).create_an_event,
                style: appBarTextStyle,
              ),
              leading: IconButton(
                icon: const Icon(FeatherIcons.x),
                color: blackColor,
                onPressed: () => Navigator.pop(context),
              ),
              backgroundColor: transparentColor,
              elevation: 0,
            ),
            body: SingleChildScrollView(
              padding: const EdgeInsets.all(15.0),
              child: (state.step == CreateEventStep.partOne)
                  ? const CreateEventPartOne()
                  : const CreateEventPartTwo(),
            ),
          );
        },
      ),
    );
  }
}
