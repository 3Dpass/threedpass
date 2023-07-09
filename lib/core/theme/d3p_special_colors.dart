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

  // Card backgound
  Color get mnemonicInputBackground {
    return brightness == Brightness.light ? Colors.grey[300]! : cardBackground;
  }
}

extension SpecialCustomColors on CustomColors {
  // Meaninful
  Color get dangerColor => Colors.red;
  // For disabled items text
  Color get disabled => D3pColors.disabled;
  // Icon preview
  Color get addressIconBackground => Colors.white;
  // Color for all links
  Color get hyperlink => Colors.blue;
  // Misc
  Color get dividerColor => Colors.grey;
}

extension AppBarCustomColors on CustomColors {
  Color get appBarBackground => Colors.black;
  Color get appBarButton => Colors.white;
  Color get appBarColor => Colors.white;
}

extension IconCustomColors on CustomColors {
  Color get positiveIcon => Colors.green;
  Color get errorIcon => dangerColor;
  Color get uncertainIcon => Colors.orange;
  Color get popMenuIcon => Colors.grey;
  Color get moreFadedGrey =>
      brightness == Brightness.light ? Colors.grey[400]! : Colors.grey[700]!;
}

extension TextCustomColors on CustomColors {
  Color get themeOpposite =>
      brightness == Brightness.light ? Colors.black : Colors.white;
}

extension ScaffoldCustomColors on CustomColors {
  Color get scaffoldBackground => brightness == Brightness.light
      ? D3pColors.lightScaffoldBackground
      : D3pColors.darkScaffoldBackground;
  Color get cardBackground => brightness == Brightness.light
      ? D3pColors.lightCardBackground
      : D3pColors.darkCardBackground;
}

extension PinCodeColors on CustomColors {
  Color get pinButtonBGColor => brightness == Brightness.light
      ? D3pColors.lightScaffoldBackground
      : D3pColors.alternativeDarkBackground;
}
