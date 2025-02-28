import 'package:flutter/material.dart';
import 'package:threedpass/core/theme/d3p_theme_data.dart';

class D3pDropdownTheme {
  static InputBorder get border => const OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.all(
          Radius.circular(4),
        ),
      );

  static InputBorder get focusedBorder => OutlineInputBorder(
        borderSide: BorderSide(color: D3pThemeData.mainColor),
        borderRadius: const BorderRadius.all(
          Radius.circular(4),
        ),
        gapPadding: 4,
      );
}
