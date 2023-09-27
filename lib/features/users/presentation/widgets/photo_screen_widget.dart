import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:image_picker/image_picker.dart';
import 'package:waaa/core/constants/spacer.dart';
import 'package:waaa/core/theme/text_styles.dart';
import 'package:waaa/features/users/presentation/manager/bloc/register/register_bloc.dart';

import 'package:waaa/injection_container.dart' as di;

import '../../../../core/theme/colors.dart';
import '../../../../core/theme/common_widget/button.dart';
import '../../../../core/util/localized.dart';

class PhotoScreenWidget extends StatelessWidget {
  const PhotoScreenWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final RegisterBloc registerBloc = di.sl<RegisterBloc>();

    return Container(
      padding: const EdgeInsets.all(20.0),
      child: SingleChildScrollView(
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
                    color: lightGrayColor,
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
                        color: lightGrayColor,
                        style: BorderStyle.solid,
                      ),
                    ),
                    child: Container(
                      padding: const EdgeInsets.all(50),
                      child: BlocBuilder<RegisterBloc, RegisterState>(
                        builder: (context, state) {
                          if (state.photoUrl.isNotEmpty) {
                            return SizedBox(
                              height: 150,
                              width: 150,
                              child: CircleAvatar(
                                backgroundImage: Image.file(
                                  File(state.photoUrl),
                                  fit: BoxFit.cover,
                                ).image,
                              ),
                            );
                          } else {
                            return const CircleAvatar(
                              child: Icon(
                                FeatherIcons.image,
                              ),
                            );
                          }
                        },
                      ),
                    ),
                  ),
                ),
              ),
            ),
            vSpace30,
            ElevatedButton(
                style: primaryButton,
                onPressed: () {
                  registerBloc
                      .add(const OpenImagePicker(source: ImageSource.camera));
                },
                child: Text(
                  localized(context).take_a_photo,
                  style: boldTextStyle12,
                )),
            vSpace15,
            ElevatedButton(
                style: outlinedBlackButton,
                onPressed: () {
                  registerBloc
                      .add(const OpenImagePicker(source: ImageSource.gallery));
                },
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
                child: Text(
                  "Ok, Cool",
                  style: boldTextStyle12,
                ))
          ],
        ),
      ),
    );
  }
}
