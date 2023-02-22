import 'package:flutter/material.dart';
import 'package:threedpass/core/theme/d3p_colors.dart';
import 'package:threedpass/core/theme/d3p_theme.dart';

extension SpecialColors on ThemeData {
  CustomColors get customColors => CustomColors(this);
}

class CustomColors {
  CustomColors(
    this.themeData,
    // this.platform,
  ) : brightness = RealBrightness.fromSettings;

  final Brightness brightness;
  final ThemeData themeData;
  // final TargetPlatform platform;

  // Meaninful
  Color get dangerColor => Colors.red;
  // For disabled items text
  Color get disabled => D3pColors.disabled;

  Color get addressIconBackground => Colors.white;

  // Appbar decoration
  Color get appBarBackground => Colors.black;
  Color get appBarButton => Colors.white;
  Color get appBarColor => Colors.white;

  // Mnemonic input
  Color get mnemonicInputBackground {
    return brightness == Brightness.light ? Colors.grey[300]! : cardBackground;
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

  // Text
  Color get themeOpposite =>
      brightness == Brightness.light ? Colors.black : Colors.white;

  // Scaffold - page themed backgrounds
  Color get scaffoldBackground => brightness == Brightness.light
      ? D3pColors.lightScaffoldBackground
      : D3pColors.darkScaffoldBackground;
  Color get cardBackground => brightness == Brightness.light
      ? D3pColors.lightCardBackground
      : D3pColors.darkCardBackground;

  // Color get themedIcon =>
  //     brightness == Brightness.light ? Colors.black : Colors.white;
}
