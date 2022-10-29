import 'package:flutter/material.dart';
import 'package:threedpass/core/theme/d3p_special_colors.dart';
import 'package:threedpass/core/theme/d3p_theme.dart';

extension SpecialStyles on ThemeData {
  CustomTextStyles get customTextStyles => CustomTextStyles(this);
}

class CustomTextStyles {
  CustomTextStyles(this.themeData) : brightness = RealBrightness.fromSettings;

  final Brightness brightness;
  final ThemeData themeData;

  TextStyle get tableHeader => TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        fontStyle: FontStyle.italic,
        color: brightness == Brightness.light ? Colors.black : Colors.white,
      );

  TextStyle get switchButtonLabelEnabled => themeData.textTheme.bodyText2!;

  TextStyle get switchButtonLabelDisabled =>
      themeData.textTheme.bodyText2!.copyWith(
        color: themeData.customColors.disabled,
      );

  TextStyle get matchesHyperlink => themeData.textTheme.bodyText2!.copyWith(
        color: themeData.customColors.hyperlink,
      );

  TextStyle get appTitle => themeData.textTheme.bodyText1!.copyWith(
        color: Colors.white,
      );
  TextStyle get appBarText => const TextStyle(
        fontSize: 16,
        color: Colors.grey,
      );
  TextStyle get appBarTextBright => const TextStyle(
        fontSize: 18,
        color: Colors.white,
      );

  TextStyle get accountName => themeData.textTheme.bodyText1!.copyWith(
        color: Colors.white,
      );
  TextStyle get accountAddress => themeData.textTheme.bodyText2!.copyWith(
        color: Colors.grey,
      );

  TextStyle get noObjectsPlaceholder =>
      themeData.textTheme.subtitle1!.copyWith(color: Colors.grey);
}
