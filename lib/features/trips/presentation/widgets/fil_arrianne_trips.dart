import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:waaa/core/constants/spacer.dart';
import 'package:waaa/core/theme/colors.dart';
import 'package:waaa/core/theme/text_styles.dart';
import 'package:waaa/core/util/mocks/trips.dart';

class FilArianeTrips extends StatelessWidget {
  const FilArianeTrips({super.key, required this.currentStep});

  final int currentStep;

  @override
  Widget build(BuildContext context) {
    bool isCurrentStep = false;
    bool? isFirstItem;

    return SizedBox(
      height: 80,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: mockTripSteps.length,
        itemBuilder: (context, index) {
          isCurrentStep = currentStep == index ? true : false;
          if (index == 0) {
            isFirstItem = true;
          } else if (index == mockTripSteps.length - 1) {
            isFirstItem = false;
          } else {
            isFirstItem = null;
          }

          return BreadCrumItem(
              isFirstOrLastItem: isFirstItem,
              isCurrentStep: isCurrentStep,
              index: (index + 1).toString(),
              name: mockTripSteps[index]);
        },
      ),
    );
  }
}

class BreadCrumItem extends StatelessWidget {
  const BreadCrumItem(
      {super.key,
      this.isFirstOrLastItem,
      required this.isCurrentStep,
      required this.index,
      required this.name});

  final bool? isFirstOrLastItem;
  final bool isCurrentStep;
  final String index;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (isFirstOrLastItem != true) ...{
              SizedBox(
                width: 30,
                child: Divider(
                  thickness: 2,
                  color: isCurrentStep ? primaryColor : lightGrayColor,
                ),
              ),
            } else ...{
              SizedBox(
                width: 30,
                child: Divider(
                  thickness: 2,
                  color: transparentColor,
                ),
              ),
            },
            CircleAvatar(
              backgroundColor: isCurrentStep ? primaryColor : lightGrayColor,
              child: Text(
                index,
                style: boldWhiteTextStyle16,
              ),
            ),
            if (isFirstOrLastItem != false) ...{
              SizedBox(
                width: 37,
                child: Divider(
                  thickness: 2,
                  color: isCurrentStep ? primaryColor : lightGrayColor,
                ),
              ),
            } else ...{
              SizedBox(
                width: 37,
                child: Divider(
                  thickness: 2,
                  color: transparentColor,
                ),
              ),
            }
          ],
        ),
        vSpace15,
        Text(
          name,
          style: isCurrentStep ? semiBoldTextStyle14 : regularTextStyle14,
        )
      ],
    );
  }
}

class Breadcrumb extends StatelessWidget {
  const Breadcrumb({super.key, required this.steps, required this.currentStep});

  final List<String> steps;
  final int currentStep;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: _buildBreadcrumbItems(),
    );
  }

  List<Widget> _buildBreadcrumbItems() {
    List<Widget> items = [];

    for (int i = 0; i < steps.length; i++) {
      // Ajouter le cercle contenant la valeur
      items.add(_buildCircle(steps[i]));

      // Ajouter la ligne rouge après chaque cercle, sauf pour le dernier cercle
      if (i < steps.length - 1) {
        items.add(_buildLine());
      }
    }

    return items;
  }

  Widget _buildCircle(String value) {
    bool isCurrentStep = steps.indexOf(value) == currentStep;

    return CircleAvatar(
      backgroundColor: isCurrentStep ? Colors.blue : Colors.grey,
      child: Text(
        value,
        style: boldWhiteTextStyle16,
      ),
    );
  }

  Widget _buildLine() {
    return const Expanded(
      child: Divider(
        color: Colors.red,
        thickness: 2.0,
      ),
    );
  }
}
