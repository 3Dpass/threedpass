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
        textStyle: D3pTextStyle.button,
      ),
    ),
    textTheme: TextTheme(
      button: D3pTextStyle.button,
    ),
  );
}
