import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waaa/component/scrolldate_picker.dart';
import 'package:waaa/core/constants/spacer.dart';
import 'package:waaa/core/theme/common_widget/button.dart';
import 'package:waaa/core/theme/text_styles.dart';
import 'package:waaa/core/util/localized.dart';
import 'package:waaa/features/trips/presentation/bloc/travel_step_bloc.dart';
import 'package:waaa/features/trips/presentation/widgets/fil_arrianne_trips.dart';

class TravelStepDateView extends StatelessWidget {
  const TravelStepDateView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TravelStepBloc, TravelStepState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const FilArianeTrips(currentStep: 0),
            vSpace40,
            Text(
              localized(context).date_of_departure,
              style: semiBoldTextStyle16,
            ),
            if (!state.isAnActualTrip) ...{
              vSpace20,
              SizedBox(
                height: 250,
                child: WaaaScrollDatePicker(
                  callback: (dateValue) {
                    context
                        .read<TravelStepBloc>()
                        .add(StartDateSelectedEvent(startDate: dateValue));
                  },
                  maxDate: state.maxDate,
                ),
              ),
            },
            vSpace40,
            ListTile(
              leading: Checkbox(
                value: state.isAnActualTrip,
                onChanged: (value) {
                  context.read<TravelStepBloc>().add(NoDateCheckboxevent());
                },
              ),
              title: Text(
                localized(context).i_dont_know_the_date_of_my_itinerary,
                style: regularTextStyle16,
              ),
            ),
            const Spacer(),
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
                        context
                            .read<TravelStepBloc>()
                            .add(const ToTheNextScreenEvent());
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
