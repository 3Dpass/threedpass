import 'package:flutter/material.dart';

class D3pCardTheme {
  static const double radiusValue = 4.0;
  static const Radius radius = Radius.circular(radiusValue);

  static CardTheme get theme => const _D3pCardThemeWrapper();
}

class _D3pCardThemeWrapper extends CardTheme {
  const _D3pCardThemeWrapper()
      : super(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(
                D3pCardTheme.radiusValue,
              ),
            ),
          ),
        );
}
