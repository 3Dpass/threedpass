import 'package:flutter/material.dart';

extension SpecialStyles on ThemeData {
  CustomTextStyles get customTextStyles => CustomTextStyles(this);
}

class CustomTextStyles {
  final ThemeData themeData;

  CustomTextStyles(this.themeData);

  TextStyle get tableHeader => TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        fontStyle: FontStyle.italic,
        color: themeData.brightness == Brightness.light
            ? Colors.black
            : Colors.white,
      );
}
