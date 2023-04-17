import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:waaa/component/country_picker.dart';
import 'package:waaa/core/constants/image_constants.dart';
import 'package:waaa/features/users/presentation/manager/register_bloc.dart';

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
                (state.nationality.isNotEmpty)
                    ? Column(
                        children: [
                          SvgPicture.asset(
                            checkImageSvg,
                            width: 35,
                            height: 35,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            state.nationality,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 14),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                        ],
                      )
                    : Container(),
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
                (state.residency.isNotEmpty)
                    ? Column(
                        children: [
                          SvgPicture.asset(
                            checkImageSvg,
                            width: 35,
                            height: 35,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            state.residency,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 14),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                        ],
                      )
                    : Container(),
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
