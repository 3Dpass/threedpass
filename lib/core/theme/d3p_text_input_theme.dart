import 'package:flutter/material.dart';
import 'package:threedpass/core/theme/d3p_theme.dart';

class D3pTextInputTheme {
  static InputBorder get border => const OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.all(
          Radius.circular(16),
        ),
      );

  static InputBorder get focusedBorder => OutlineInputBorder(
        borderSide: BorderSide(color: D3pThemeData.mainColor),
        borderRadius: const BorderRadius.all(
          Radius.circular(16),
        ),
        gapPadding: 4,
      );
}
