import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waaa/features/users/presentation/manager/register_bloc.dart';
import 'package:waaa/features/users/presentation/widgets/show_country_selected.dart';

import 'package:waaa/injection_container.dart' as di;

import '../../../../component/country_picker.dart';
import '../../../../core/theme/common_widget/button.dart';
import '../../../../core/util/localized.dart';

class LanguageScreenWidget extends StatelessWidget {
  const LanguageScreenWidget({super.key});

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
                  localized(context).select_your_native_language,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 24),
                ),
                const SizedBox(
                  height: 40,
                ),
                if (state.nativeLanguage.isNotEmpty)
                  ShowCountrySelected(
                    country: state.nativeLanguage,
                  ),
                CountryPicker(
                    textButton: localized(context).select_your_native_language,
                    callback: (value) => {
                          registerBloc.add(
                              NativeLanguageSelected(nativeLanguage: value))
                        }),
                const SizedBox(
                  height: 60,
                ),
                Text(
                  localized(context).select_other_spoken_languages,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 24),
                ),
                const SizedBox(
                  height: 40,
                ),
                if (state.spokenLanguages.isNotEmpty)
                  ShowCountryItemSelected(
                      spokenLanguages: state.spokenLanguages),
                const SizedBox(
                  height: 20,
                ),
                CountryPicker(
                    textButton:
                        localized(context).select_other_spoken_languages,
                    callback: (value) => {
                          registerBloc
                              .add(SpeakLanguagesSelected(speakLanguage: value))
                        }),
                const SizedBox(
                  height: 100,
                ),
                ElevatedButton(
                    style: primaryButton,
                    onPressed: () {
                      BlocProvider.of<RegisterBloc>(context)
                          .add(ValidateLanguagesButtonPressed());
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
