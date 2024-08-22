import 'package:flutter/material.dart';
import 'package:threedpass/core/theme/d3p_theme.dart';

class D3pFloatingActionButtonThemeData extends FloatingActionButtonThemeData {
  const D3pFloatingActionButtonThemeData()
      : super(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(D3pThemeData.buttonBorderRadius),
            ),
          ),
        );
}