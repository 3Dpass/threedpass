import 'package:flutter/material.dart';
import 'package:threedpass/core/theme/d3p_colors.dart';
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

  TextStyle get matchesHyperlink => themeData.textTheme.bodyMedium!
      .copyWith(color: themeData.customColors.hyperlink);

  TextStyle get accountName =>
      themeData.textTheme.bodyLarge!.copyWith(color: Colors.white);
  TextStyle get accountAddress =>
      themeData.textTheme.bodyMedium!.copyWith(color: Colors.grey);

  TextStyle get noObjectsPlaceholder =>
      themeData.textTheme.titleMedium!.copyWith(color: Colors.grey);

  TextStyle get secondaryText =>
      themeData.textTheme.bodyMedium!.copyWith(color: Colors.grey);

  // Coloring to fix cupertino
  Color get _themeOpposite => themeData.customColors.themeOpposite;

  TextStyle get d3plabelLarge =>
      themeData.textTheme.labelLarge!.copyWith(color: _themeOpposite);
}

extension SwitchCustomText on CustomTextStyles {
  TextStyle get switchButtonLabelEnabled => d3pBodyMedium;

  TextStyle get switchButtonLabelDisabled =>
      d3pBodyMedium.copyWith(color: themeData.customColors.disabled);
}

extension AppBarCustomText on CustomTextStyles {
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
}

extension HeadLineCustomText on CustomTextStyles {
  TextStyle get d3pheadlineLarge =>
      themeData.textTheme.headlineLarge!.copyWith(color: _themeOpposite);
  TextStyle get d3pheadlineMedium =>
      themeData.textTheme.headlineMedium!.copyWith(color: _themeOpposite);
  TextStyle get d3pheadlineSmall =>
      themeData.textTheme.headlineSmall!.copyWith(color: _themeOpposite);
}

extension TitleCustomText on CustomTextStyles {
  TextStyle get d3ptitleLarge =>
      themeData.textTheme.titleLarge!.copyWith(color: _themeOpposite);
  TextStyle get d3ptitleMedium =>
      themeData.textTheme.titleMedium!.copyWith(color: _themeOpposite);
  TextStyle get dp3titleSmall =>
      themeData.textTheme.titleSmall!.copyWith(color: _themeOpposite);
}

extension BodyCustomText on CustomTextStyles {
  TextStyle get d3pReallyLarge => d3pBodyLarge.copyWith(fontSize: 18);
  TextStyle get d3pBodyLarge =>
      themeData.textTheme.bodyLarge!.copyWith(color: _themeOpposite);
  TextStyle get d3pBodyMedium =>
      themeData.textTheme.bodyMedium!.copyWith(color: _themeOpposite);
  TextStyle get d3pBodySmall =>
      themeData.textTheme.bodySmall!.copyWith(color: _themeOpposite);
}

extension SpecialText on CustomTextStyles {
  TextStyle get d3pSettingsHeader => themeData.textTheme.bodyLarge!
      .copyWith(color: themeData.customColors.moreFadedGrey);

  TextStyle get d3pSettingsHeaderSmall => themeData.textTheme.bodySmall!
      .copyWith(color: themeData.customColors.moreFadedGrey);
}

extension Buttons on CustomTextStyles {
  TextStyle get d3pFloatingButton =>
      themeData.customTextStyles.d3pBodyMedium.copyWith(
        fontSize: 16,
        letterSpacing: 1.2,
        fontWeight: FontWeight.w500,
      );

  TextStyle get hintStyle => d3pBodySmall.copyWith(color: D3pColors.disabled);
}
