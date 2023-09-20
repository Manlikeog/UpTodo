import 'package:flutter/material.dart';
import 'package:uptodo/utils/colours.dart';

class UpToDoTheme {
  static ThemeData themeData() {
    return ThemeData(
      dividerColor: DIVIDERCOLOR,
      colorScheme: ColorScheme.fromSwatch(
        primarySwatch: kCustomPryColor,
      ),
      scaffoldBackgroundColor: BACKGROUNDCOLOR,
      highlightColor: PRYCOLOR.withOpacity(0.5),
      hoverColor: PRYCOLOR.withOpacity(0.5),
      focusColor: PRYCOLOR.withOpacity(0.5),
      splashColor: PRYCOLOR.withOpacity(0.5),
      disabledColor: Colors.grey,
      brightness: Brightness.light,
      useMaterial3: true,
      appBarTheme: const AppBarTheme(
        elevation: 0,
      ),
      textSelectionTheme: TextSelectionThemeData(
        selectionColor: PRYCOLOR.withOpacity(0.2),
      ),
    );
  }
}
