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

  // https://github.com/flutter/flutter/blob/ad200896cbe17f8b2ae3560f541c1abafa8f4cd1/packages/flutter/lib/src/material/input_decorator.dart#L4564C22-L4564C22
  Color get defaultInputColor => brightness == Brightness.light
      ? const Color(0x0A000000)
      : const Color(0x1AFFFFFF);
}

extension PinCodeColors on CustomColors {
  Color get pinButtonBGColor => brightness == Brightness.light
      ? D3pColors.lightScaffoldBackground
      : D3pColors.alternativeDarkBackground;
}

extension NotificationCard on CustomColors {
  Color get errorCardBGColor => brightness == Brightness.light
      ? Colors.red.shade100
      : Colors.red.shade900;
}

extension SwapPageColors on CustomColors {
  Color get assetChoiceChipPrefixColor =>
      brightness == Brightness.light ? Colors.black : D3pColors.disabled;
}
