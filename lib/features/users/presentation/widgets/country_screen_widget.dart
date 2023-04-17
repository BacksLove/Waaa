import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waaa/component/country_picker.dart';
import 'package:waaa/features/users/presentation/manager/register_bloc.dart';
import 'package:waaa/features/users/presentation/widgets/show_country_selected.dart';

import '../../../../core/theme/common_widget/button.dart';
import '../../../../core/util/localized.dart';

import 'package:waaa/injection_container.dart' as di;

class CountryScreenWidget extends StatelessWidget {
  const CountryScreenWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final RegisterBloc registerBloc = di.sl<RegisterBloc>();

    return BlocBuilder<RegisterBloc, RegisterState>(
      bloc: registerBloc,
      builder: (context, state) {
        return Center(
          child: Container(
            padding: const EdgeInsets.all(30),
            child: Column(
              children: [
                const SizedBox(
                  height: 60,
                ),
                Text(
                  localized(context).select_a_nationality,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 24),
                ),
                const SizedBox(
                  height: 40,
                ),
                if (state.nationality.isNotEmpty)
                  ShowCountrySelected(country: state.nationality),
                CountryPicker(
                    textButton: localized(context).select_a_residency,
                    callback: (value) => {
                          registerBloc.add(NationalityCountrySelected(
                              nationalityCountry: value))
                        }),
                const SizedBox(
                  height: 60,
                ),
                Text(
                  localized(context).select_a_residency,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 24),
                ),
                const SizedBox(
                  height: 40,
                ),
                if (state.residency.isNotEmpty)
                  ShowCountrySelected(country: state.residency),
                CountryPicker(
                    textButton: localized(context).select_a_residency,
                    callback: (value) => {
                          registerBloc.add(
                              ResidenceCountrySelected(residenceCountry: value))
                        }),
                const SizedBox(
                  height: 100,
                ),
                ElevatedButton(
                    style: primaryButton,
                    onPressed: () {
                      BlocProvider.of<RegisterBloc>(context)
                          .add(ValidateCountriesButtonPressed());
                    },
                    child: Text(localized(context).next))
              ],
            ),
          ),
        );
      },
    );
  }
}
