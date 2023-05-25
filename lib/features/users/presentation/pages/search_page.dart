import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:group_button/group_button.dart';
import 'package:waaa/component/country_picker.dart';
import 'package:waaa/component/form_textfield.dart';
import 'package:waaa/component/groupbutton_list.dart';
import 'package:waaa/component/snack_bar.dart';
import 'package:waaa/core/constants/spacer.dart';
import 'package:waaa/core/enums/search_enum.dart';
import 'package:waaa/core/theme/common_widget/button.dart';
import 'package:waaa/core/theme/text_styles.dart';
import 'package:waaa/core/util/localized.dart';
import 'package:waaa/core/util/mocks/gender.dart';
import 'package:waaa/core/util/mocks/travels.dart';
import 'package:waaa/features/home/presentation/widgets/show_nationalities.dart';
import 'package:waaa/features/users/presentation/manager/bloc/search/search_bloc.dart';

import 'package:waaa/injection_container.dart' as di;
import 'package:waaa/core/route/routes.dart' as route;

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  late SearchBloc searchBloc;

  @override
  void initState() {
    searchBloc = di.sl<SearchBloc>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController titleController = TextEditingController();
    TextEditingController localisationController = TextEditingController();
    TextEditingController nationalityController = TextEditingController();
    GroupButtonController travelTypeController = GroupButtonController();
    GroupButtonController genderController = GroupButtonController();

    return BlocProvider(
      create: (context) => searchBloc,
      child: BlocListener<SearchBloc, SearchState>(
        listener: (context, state) {
          if (state.status == SearchStatus.failed) {
            showFloatingFlushbar(
              context,
              localized(context).user_not_found,
              "",
            );
          }
          if (state.status == SearchStatus.succeed) {
            Navigator.pushNamed(
              context,
              route.searchResultPage,
              arguments: state.users,
            );
          }
        },
        child: Scaffold(
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                WaaaTextField(
                  controller: titleController,
                  label: localized(context).nickname,
                  leadingIcon: FeatherIcons.search,
                ),
                vSpace30,
                WaaaTextField(
                  controller: localisationController,
                  label: localized(context).where_is_the_traveler,
                  leadingIcon: FeatherIcons.search,
                ),
                vSpace20,
                TextfieldCountryPicker(
                  controller: nationalityController,
                  textLabel: localized(context).nationality,
                  callback: (String value) {
                    searchBloc.add(SearchAddCountry(country: value));
                  },
                ),
                BlocBuilder<SearchBloc, SearchState>(
                  builder: (context, state) {
                    return ShowNationalitiesSelected(
                      nationalities: state.nationalities,
                      onPressed: (value) {
                        searchBloc.add(SearchRemoveCountry(country: value));
                      },
                    );
                  },
                ),
                vSpace20,
                WaaaGroupButton(
                  groupController: travelTypeController,
                  list: mockTravelType,
                  title: localized(context).type_of_travel,
                ),
                vSpace20,
                WaaaGroupButton(
                  groupController: genderController,
                  list: mockGender,
                  title: localized(context).gender,
                  isRadio: true,
                ),
                vSpace20,
                WaaaRangeSlider(
                  onSelected: (RangeValues value) {
                    searchBloc.add(SearchChangeRange(range: value));
                  },
                ),
                vSpace20,
                SizedBox(
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      searchBloc.add(
                        SearchButtonPressed(
                          username: titleController.text,
                          localisation: localisationController.text,
                          selectedTypesOfTravel:
                              travelTypeController.selectedIndexes.toList(),
                          selectedGender: genderController.selectedIndex,
                        ),
                      );
                    },
                    style: primaryButton,
                    child: Text(
                      localized(context).search,
                      style: regularTextStyle16,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class WaaaRangeSlider extends StatefulWidget {
  const WaaaRangeSlider({super.key, required this.onSelected});

  final Function onSelected;

  @override
  State<WaaaRangeSlider> createState() => _WaaaRangeSliderState();
}

class _WaaaRangeSliderState extends State<WaaaRangeSlider> {
  RangeValues range = const RangeValues(22, 80);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          localized(context).age,
          style: semiBoldTextStyle16,
        ),
        vSpace20,
        RangeSlider(
          values: range,
          min: 0,
          max: 100,
          divisions: 100,
          labels: RangeLabels(
            range.start.round().toString(),
            range.end.round().toString(),
          ),
          onChanged: (value) {
            setState(() {
              range = value;
            });
            widget.onSelected(value);
          },
        ),
        vSpace5,
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "${range.start.round().toString()} ans", // TODO: Mettre string
              style: regularTextStyle16,
            ),
            hSpace40,
            Text(
              "${range.end.round().toString()} ans", // TODO: Mettre string
              style: regularTextStyle16,
            ),
          ],
        )
      ],
    );
  }
}
