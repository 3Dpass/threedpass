import 'package:flutter/material.dart';
import 'package:threedpass/core/theme/d3p_colors.dart';
import 'package:threedpass/core/theme/d3p_special_styles.dart';
import 'package:threedpass/core/theme/d3p_theme.dart';

abstract class D3pOutlinedButtonTheme {
  static double width = 2.28;

  static OutlinedButtonThemeData theme(final ThemeData t) {
    return OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: D3pThemeData.mainColor,
        disabledForegroundColor: D3pColors.disabled,
        textStyle: t.customTextStyles.d3pFloatingButton,
        padding:
            const EdgeInsets.symmetric(horizontal: D3pThemeData.buttonPadding),
      ).copyWith(
        side: MaterialStateProperty.resolveWith(
          (final states) {
            if (states.contains(MaterialState.disabled)) {
              return BorderSide(
                color: D3pColors.disabled,
                width: width,
              );
            } else {
              return BorderSide(
                color: D3pThemeData.mainColor,
                width: width,
              );
            }
          },
        ),
      ),
    );
  }
}
