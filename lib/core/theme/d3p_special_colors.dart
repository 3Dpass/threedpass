import 'package:flutter/material.dart';
import 'package:threedpass/core/theme/d3p_colors.dart';
import 'package:threedpass/core/theme/d3p_theme.dart';

extension SpecialColors on ThemeData {
  CustomColors get customColors => CustomColors(this);
}

class CustomColors {
  CustomColors(this.themeData) : brightness = RealBrightness.fromSettings;

  final Brightness brightness;
  final ThemeData themeData;

  // Meaninful
  Color get dangerColor => Colors.red;
  // For disabled items text
  Color get disabled => D3pColors.disabled;

  Color get addressIconBackground => Colors.white;

  // Appbar decoration
  Color get appBarBackground => Colors.black;
  Color get appBarButton => Colors.white;

  // Mnemonic input
  Color get mnemonicInputBackground {
    return brightness == Brightness.light
        ? Colors.grey[300]!
        : themeData.cardColor;
  }

  // Color for all links
  Color get hyperlink => Colors.blue;
  // Misc
  Color get dividerColor => Colors.grey;

  // Icons
  Color get positiveIcon => Colors.green;
  Color get errorIcon => dangerColor;
  Color get uncertainIcon => Colors.orange;
  Color get popMenuIcon => Colors.grey;
  // Color get themedIcon =>
  //     brightness == Brightness.light ? Colors.black : Colors.white;
}
