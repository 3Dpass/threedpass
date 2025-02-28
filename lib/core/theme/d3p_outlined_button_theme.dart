import 'package:flutter/material.dart';
import 'package:threedpass/core/theme/d3p_theme_data.dart';

class D3pOutlinedButtonTheme extends OutlinedButtonThemeData {
  D3pOutlinedButtonTheme({
    required final Color borderSideColor,
  }) : super(
          style: OutlinedButton.styleFrom(
            minimumSize: const Size(0, D3pThemeData.buttonHeight),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(D3pThemeData.buttonBorderRadius),
              ),
            ),
          ).copyWith(
            side: WidgetStateBorderSide.resolveWith(
              (final states) {
                if (!states.contains(WidgetState.disabled)) {
                  return BorderSide(color: borderSideColor);
                } else {
                  return null;
                }
              },
            ),
          ),
        );
}
