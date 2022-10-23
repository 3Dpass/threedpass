import 'package:flutter/material.dart';
import 'package:threedpass/core/theme/d3p_text_style.dart';

class D3pThemeData {
  static ThemeData lightTheme = ThemeData(
    primarySwatch: Colors.green,
    primaryColor: Colors.black,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        minimumSize: const Size.fromHeight(50),
        textStyle: D3pBasicTextStyle.button,
      ),
    ),
    textTheme: const TextTheme(
      button: D3pBasicTextStyle.button,
      bodyText1: D3pBasicTextStyle.bodyText1,
      bodyText2: D3pBasicTextStyle.bodyText2,
    ),
  );

  static ThemeData darkTheme = ThemeData.dark().copyWith(
    colorScheme: ColorScheme.fromSwatch(
      primarySwatch: Colors.green,
    ),
    primaryColor: Colors.black,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        minimumSize: const Size.fromHeight(50),
        textStyle: D3pBasicTextStyle.button,
      ),
    ),
    textTheme: const TextTheme(
      button: D3pBasicTextStyle.button,
      bodyText1: D3pBasicTextStyle.bodyText1,
      bodyText2: D3pBasicTextStyle.bodyText2,
    ),
  );

  static ThemeData themeData(final Brightness brightness) =>
      brightness == Brightness.light ? lightTheme : darkTheme;
}
