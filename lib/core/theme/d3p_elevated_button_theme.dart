import 'package:flutter/material.dart';
import 'package:threedpass/core/theme/d3p_colors.dart';
import 'package:threedpass/core/theme/d3p_special_styles.dart';

abstract class D3pElevatedButtonTheme {
  static ElevatedButtonThemeData theme(final ThemeData t) {
    return ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: t.colorScheme.primary,
        disabledBackgroundColor: t.cardColor,
        disabledForegroundColor: t.colorScheme.onSurface.withOpacity(0.50),
        textStyle: t.customTextStyles.d3pFloatingButton,
        padding: const EdgeInsets.symmetric(horizontal: 8),
      ).copyWith(
        foregroundColor: MaterialStateProperty.resolveWith(
          (final states) {
            if (states.contains(MaterialState.disabled)) {
              return D3pColors.disabled;
            } else {
              return t.colorScheme.onPrimary;
            }
          },
        ),
      ),
    );
  }
}
