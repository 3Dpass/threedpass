import 'package:flutter/material.dart';
import 'package:threedpass/core/theme/d3p_theme.dart';

abstract class D3pElevatedButtonTheme {
  static ElevatedButtonThemeData theme(final ThemeData t) {
    return ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        padding:
            const EdgeInsets.symmetric(horizontal: D3pThemeData.buttonPadding),
      ),
    );
  }
}
