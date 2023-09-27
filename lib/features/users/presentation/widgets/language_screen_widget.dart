import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:language_picker/languages.dart';
import 'package:waaa/component/language_picker.dart';
import 'package:waaa/core/constants/spacer.dart';
import 'package:waaa/core/theme/text_styles.dart';
import 'package:waaa/features/users/presentation/manager/bloc/register/register_bloc.dart';
import 'package:waaa/features/users/presentation/widgets/show_country_selected.dart';

import 'package:waaa/injection_container.dart' as di;

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
        return SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(30),
            child: Column(
              children: [
                vSpace60,
                Text(
                  localized(context).select_your_native_language,
                  textAlign: TextAlign.center,
                  style: boldTextStyle24,
                ),
                vSpace40,
                if (state.nativeLanguage.name.isNotEmpty)
                  ShowLanguageSelected(
                    language: state.nativeLanguage.name,
                  ),
                LanguagePicker(
                    textButton: localized(context).select_your_native_language,
                    callback: (Language value) => {
                          registerBloc.add(
                              NativeLanguageSelected(nativeLanguage: value))
                        }),
                vSpace60,
                Text(
                  localized(context).select_other_spoken_languages,
                  textAlign: TextAlign.center,
                  style: boldTextStyle24,
                ),
                vSpace40,
                if (state.spokenLanguages.isNotEmpty)
                  ShowLanguageItemSelected(
                      spokenLanguages: state.spokenLanguages),
                vSpace20,
                LanguagePicker(
                    textButton:
                        localized(context).select_other_spoken_languages,
                    callback: (Language value) => {
                          registerBloc
                              .add(SpeakLanguagesSelected(speakLanguage: value))
                        }),
                vSpace100,
                ElevatedButton(
                    style: primaryButton,
                    onPressed: () {
                      BlocProvider.of<RegisterBloc>(context)
                          .add(ValidateLanguagesButtonPressed());
                    },
                    child: Text(
                      localized(context).next,
                      style: boldTextStyle12,
                    ))
              ],
            ),
          ),
        );
      },
    );
  }
}
