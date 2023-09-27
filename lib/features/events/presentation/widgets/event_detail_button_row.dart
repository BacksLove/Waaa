import 'package:aws_common/aws_common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:ionicons/ionicons.dart';
import 'package:waaa/core/theme/colors.dart';
import 'package:waaa/core/theme/text_styles.dart';
import 'package:waaa/core/util/localized.dart';
import 'package:waaa/features/events/presentation/manager/bloc/event_detail/event_detail_bloc.dart';
import '../../../../core/constants/spacer.dart';

class EventButtonRow extends StatelessWidget {
  const EventButtonRow({super.key});

  @override
  Widget build(BuildContext context) {
    final EventDetailBloc eventDetailBloc = context.read<EventDetailBloc>();
    return BlocBuilder<EventDetailBloc, EventDetailState>(
      builder: (context, state) {
        if (state.ownerView) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        eventDetailBloc.add(EventGoToUpdatePressed());
                      },
                      child: Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: veryLightGrayColor,
                        ),
                        padding: const EdgeInsets.all(10),
                        child: Icon(
                          Ionicons.pencil,
                          color: primaryColor,
                        ),
                      ),
                    ),
                    vSpace5,
                    Text(
                      localized(context).modify,
                      style: semiBoldTextStyle14,
                    )
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: veryLightGrayColor,
                      ),
                      padding: const EdgeInsets.all(10),
                      child: Icon(
                        Ionicons.arrow_redo,
                        color: primaryColor,
                      ),
                    ),
                    vSpace5,
                    Text(
                      localized(context).share,
                      style: semiBoldTextStyle14,
                    )
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: veryLightGrayColor,
                      ),
                      padding: const EdgeInsets.all(10),
                      child: Icon(
                        FeatherIcons.moreHorizontal,
                        color: primaryColor,
                      ),
                    ),
                    vSpace5,
                    Text(
                      localized(context).plus,
                      style: semiBoldTextStyle14,
                    )
                  ],
                ),
              ),
            ],
          );
        } else {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Column(
                  children: [
                    Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: veryLightGrayColor,
                      ),
                      padding: const EdgeInsets.all(10),
                      child: Icon(
                        Ionicons.star,
                        color: primaryColor,
                      ),
                    ),
                    vSpace5,
                    Text(
                      localized(context).interested,
                      style: semiBoldTextStyle14,
                    )
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    InkWell(
                      onTap: () {
                        safePrint("attemp to participate");
                        context.read<EventDetailBloc>().add(EventParticipate());
                      },
                      child: Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: veryLightGrayColor,
                        ),
                        padding: const EdgeInsets.all(10),
                        child: Icon(
                          (state.participate)
                              ? Ionicons.checkmark_circle
                              : Ionicons.checkmark_circle_outline,
                          color: primaryColor,
                        ),
                      ),
                    ),
                    vSpace5,
                    Text(
                      localized(context).participate,
                      style: semiBoldTextStyle14,
                    )
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: veryLightGrayColor,
                      ),
                      padding: const EdgeInsets.all(10),
                      child: Icon(
                        Ionicons.arrow_redo,
                        color: primaryColor,
                      ),
                    ),
                    vSpace5,
                    Text(
                      localized(context).share,
                      style: semiBoldTextStyle14,
                    )
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: veryLightGrayColor,
                      ),
                      padding: const EdgeInsets.all(10),
                      child: Icon(
                        FeatherIcons.moreHorizontal,
                        color: primaryColor,
                      ),
                    ),
                    vSpace5,
                    Text(
                      localized(context).plus,
                      style: semiBoldTextStyle14,
                    )
                  ],
                ),
              ),
            ],
          );
        }
      },
    );
  }
}
