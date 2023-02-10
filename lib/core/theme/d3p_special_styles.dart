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

  TextStyle get switchButtonLabelEnabled => themeData.textTheme.bodyMedium!;

  TextStyle get switchButtonLabelDisabled =>
      themeData.textTheme.bodyMedium!.copyWith(
        color: themeData.customColors.disabled,
      );

  TextStyle get matchesHyperlink => themeData.textTheme.bodyMedium!.copyWith(
        color: themeData.customColors.hyperlink,
      );

  TextStyle get appTitle => themeData.textTheme.bodyLarge!.copyWith(
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

  TextStyle get accountName => themeData.textTheme.bodyLarge!.copyWith(
        color: Colors.white,
      );
  TextStyle get accountAddress => themeData.textTheme.bodyMedium!.copyWith(
        color: Colors.grey,
      );

  TextStyle get noObjectsPlaceholder =>
      themeData.textTheme.titleMedium!.copyWith(color: Colors.grey);

  TextStyle get secondaryText => themeData.textTheme.bodyMedium!.copyWith(
        color: Colors.grey,
      );
}
