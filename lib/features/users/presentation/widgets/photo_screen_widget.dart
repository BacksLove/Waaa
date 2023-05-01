import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:waaa/core/constants/spacer.dart';
import 'package:waaa/core/theme/text_styles.dart';
import 'package:waaa/features/users/presentation/manager/register_bloc.dart';

import 'package:waaa/injection_container.dart' as di;

import '../../../../core/theme/colors.dart';
import '../../../../core/theme/common_widget/button.dart';
import '../../../../core/util/localized.dart';

class PhotoScreenWidget extends StatelessWidget {
  const PhotoScreenWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final RegisterBloc registerBloc = di.sl<RegisterBloc>();
    //final String photo_url;

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          vSpace50,
          Text(
            localized(context).upload_your_photo,
            textAlign: TextAlign.center,
            style: boldTextStyle22,
          ),
          vSpace20,
          Center(
            child: Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  width: 1,
                  color: grayColor,
                  style: BorderStyle.solid,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(50),
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      width: 1,
                      color: grayColor,
                      style: BorderStyle.solid,
                    ),
                  ),
                  child: Container(
                    padding: const EdgeInsets.all(80),
                    child: const CircleAvatar(
                      child: Icon(FeatherIcons.image),
                    ),
                  ),
                ),
              ),
            ),
          ),
          vSpace30,
          ElevatedButton(
              style: primaryButton,
              onPressed: () {},
              child: Text(
                localized(context).take_a_photo,
                style: boldTextStyle12,
              )),
          vSpace15,
          ElevatedButton(
              style: outlinedBlackButton,
              onPressed: () {},
              child: Text(
                localized(context).browse_from_media,
                style: boldTextStyle12,
              )),
          vSpace30,
          ElevatedButton(
              style: primaryButton,
              onPressed: () {
                registerBloc.add(RegisterCompleteEvent());
              },
              child: const Text(
                "Ok, Cool",
                style: boldTextStyle12,
              ))
        ],
      ),
    );
  }
}
