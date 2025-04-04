import 'package:flutter/material.dart';
import 'package:threedpass/core/theme/d3p_theme_data.dart';

class D3pFloatingActionButtonThemeData extends FloatingActionButtonThemeData {
  const D3pFloatingActionButtonThemeData({
    required final Color foregroundColor,
  }) : super(
          foregroundColor: foregroundColor,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(D3pThemeData.buttonBorderRadius),
            ),
          ),
        );
}
