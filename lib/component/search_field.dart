import 'package:aws_common/aws_common.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:searchfield/searchfield.dart';
import 'package:waaa/core/theme/colors.dart';
import 'package:waaa/core/theme/text_styles.dart';
import 'package:waaa/core/util/localized.dart';
import 'package:waaa/models/User.dart';

class WaaaUserSearchField extends StatelessWidget {
  const WaaaUserSearchField({
    super.key,
    required this.userController,
    required this.userList,
    required this.callback,
  });

  final TextEditingController userController;
  final List<User> userList;
  final Function(User) callback;

  @override
  Widget build(BuildContext context) {
    return SearchField(
      suggestions: userList
          .map((user) => SearchFieldListItem(user.username, item: user))
          .toList(),
      suggestionState: Suggestion.hidden,
      maxSuggestionsInViewPort: 6,
      itemHeight: 45,
      controller: userController,
      searchInputDecoration: InputDecoration(
        prefixIcon: const Icon(Ionicons.search),
        labelText: localized(context).search,
        labelStyle: regularTextStyle12,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: lightGrayColor,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(50.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: primaryColor,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(50.0),
        ),
      ),
      onSuggestionTap: (value) {
        callback(value.item!);
      },
    );
  }
}
