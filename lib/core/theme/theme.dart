import 'package:flutter/material.dart';
import 'package:waaa/core/theme/colors.dart';
import 'package:waaa/core/util/materialcolor.dart';

CustomTheme currentTheme = CustomTheme();

class CustomTheme with ChangeNotifier {
  static bool _isDarkTheme = true;
  ThemeMode get currentTheme => _isDarkTheme ? ThemeMode.dark : ThemeMode.light;

  void toggleTheme() {
    _isDarkTheme = !_isDarkTheme;
    notifyListeners();
  }

  static ThemeData get lightTheme {
    return ThemeData(
      colorScheme: const ColorScheme.light(),
      primarySwatch: MaterialColorGenerator.from(primaryColor),
      primaryColor: primaryColor,
      primaryColorLight: primaryColor,
      scaffoldBackgroundColor: Colors.white,
      fontFamily: 'Poppins',
      textTheme: const TextTheme(),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      colorScheme: const ColorScheme.dark(),
      primarySwatch: MaterialColorGenerator.from(primaryColor),
      primaryColorDark: primaryColor,
      primaryColor: primaryColor,
      scaffoldBackgroundColor: Colors.grey.shade900,
      fontFamily: 'Poppins',
      textTheme: const TextTheme(),
    );
  }
}
