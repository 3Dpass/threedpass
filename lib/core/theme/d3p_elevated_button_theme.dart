import 'package:flutter/material.dart';
import 'package:threedpass/core/theme/d3p_colors.dart';
import 'package:threedpass/core/theme/d3p_special_styles.dart';
import 'package:threedpass/core/theme/d3p_theme.dart';

abstract class D3pElevatedButtonTheme {
  static ElevatedButtonThemeData theme(final ThemeData t) {
    return ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: t.colorScheme.primary,
        disabledBackgroundColor: t.cardColor,
        disabledForegroundColor: D3pColors.disabled,
        foregroundColor: t.colorScheme.onPrimary,
        textStyle: t.customTextStyles.d3pFloatingButton,
        padding:
            const EdgeInsets.symmetric(horizontal: D3pThemeData.buttonPadding),
      ),
    );
  }
}
