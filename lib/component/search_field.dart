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
    this.userController,
    required this.userList,
    required this.callback,
    required this.onChange,
  });

  final TextEditingController? userController;
  final List<User?> userList;
  final Function(User) callback;
  final Function(String) onChange;

  @override
  Widget build(BuildContext context) {
    return SearchField(
      suggestions: userList
          .map((user) => SearchFieldListItem(user!.username, item: user))
          .toList(),
      suggestionState: Suggestion.hidden,
      maxSuggestionsInViewPort: 6,
      itemHeight: 45,
      controller: userController,
      suggestionsDecoration: SuggestionDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
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
      onSearchTextChanged: (value) {
        onChange(value);
        return null;
      },
      onSuggestionTap: (value) {
        callback(value.item!);
      },
    );
  }
}

class WaaaSearchField extends StatelessWidget {
  const WaaaSearchField({
    super.key,
    required this.searchList,
    required this.callback,
    required this.onChange,
  });

  final List<String> searchList;
  final Function callback;
  final Function onChange;

  @override
  Widget build(BuildContext context) {
    TextEditingController userController = TextEditingController();
    return SearchField(
      suggestions: searchList
          .map((item) => SearchFieldListItem(item, item: item))
          .toList(),
      suggestionState: Suggestion.hidden,
      maxSuggestionsInViewPort: 6,
      itemHeight: 45,
      controller: userController,
      suggestionsDecoration: SuggestionDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
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
      onSearchTextChanged: (value) {
        onChange(value);
        return null;
      },
      onSuggestionTap: (value) {
        callback(value);
      },
    );
  }
}
