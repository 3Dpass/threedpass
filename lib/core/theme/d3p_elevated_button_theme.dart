import 'package:flutter/material.dart';

abstract class D3pElevatedButtonTheme {
  static ElevatedButtonThemeData theme(final ThemeData t) {
    return ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: t.colorScheme.primary,
        foregroundColor: t.colorScheme.onPrimary,
        disabledBackgroundColor: t.cardColor,
        disabledForegroundColor: t.colorScheme.onSurface.withOpacity(0.50),
        minimumSize: const Size.fromHeight(50),
      ),
    );
  }
}
