import 'package:flutter/material.dart';
import 'package:threedpass/core/theme/d3p_theme_data.dart';

class D3pTextButtonThemeData extends TextButtonThemeData {
  D3pTextButtonThemeData()
      : super(
          style: FilledButton.styleFrom(
            minimumSize: const Size(0, D3pThemeData.buttonHeight),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(D3pThemeData.buttonBorderRadius),
              ),
            ),
          ),
        );
}
