import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waaa/component/country_picker.dart';
import 'package:waaa/core/theme/text_styles.dart';
import 'package:waaa/features/users/presentation/manager/bloc/register/register_bloc.dart';
import 'package:waaa/features/users/presentation/widgets/show_country_selected.dart';

import '../../../../core/constants/spacer.dart';
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
        return SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(30),
            child: Column(
              children: [
                vSpace60,
                Text(
                  localized(context).select_a_nationality,
                  textAlign: TextAlign.center,
                  style: boldTextStyle24,
                ),
                vSpace40,
                if (state.nationality.isNotEmpty)
                  ShowCountrySelected(country: state.nationality),
                CountryPicker(
                    textButton: localized(context).select_a_residency,
                    callback: (value) => {
                          registerBloc.add(NationalityCountrySelected(
                              nationalityCountry: value))
                        }),
                vSpace60,
                Text(
                  localized(context).select_a_residency,
                  textAlign: TextAlign.center,
                  style: boldTextStyle24,
                ),
                vSpace40,
                if (state.residency.isNotEmpty)
                  ShowCountrySelected(country: state.residency),
                CountryPicker(
                    textButton: localized(context).select_a_residency,
                    callback: (value) => {
                          registerBloc.add(
                              ResidenceCountrySelected(residenceCountry: value))
                        }),
                vSpace150,
                ElevatedButton(
                  style: primaryButton,
                  onPressed: () {
                    BlocProvider.of<RegisterBloc>(context)
                        .add(ValidateCountriesButtonPressed());
                  },
                  child: Text(
                    localized(context).next,
                    style: boldTextStyle12,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
