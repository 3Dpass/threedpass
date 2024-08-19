import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:threedpass/core/theme/d3p_appbar_theme.dart';
import 'package:threedpass/core/theme/d3p_colors.dart';
import 'package:threedpass/core/theme/d3p_outlined_button_theme.dart';
import 'package:threedpass/core/theme/d3p_tabbar_theme.dart';
import 'package:threedpass/core/theme/d3p_text_style.dart';
import 'package:threedpass/features/settings_page/bloc/settings_page_cubit.dart';
import 'package:threedpass/setup.dart';

import 'd3p_elevated_button_theme.dart';

class D3pThemeData {
  static final mainColor = D3pColors.mainColor;
  static const Color secondaryButtonBG = Color(0xFF6D9B83);

  static final Color shimmerBaseColor = Colors.grey.shade400;
  static final Color shimmerHighlightColor = Colors.grey.shade100;

  static const double buttonHeight = 50;
  static const double buttonPadding = 12;

  static const bottomSheetThemeData = BottomSheetThemeData(
    shape: RoundedRectangleBorder(
      side: BorderSide.none,
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(16),
        topRight: Radius.circular(16),
      ),
    ),
  );

  static ThemeData themeData(final Brightness brightness) {
    // return brightness == Brightness.light ? lightTheme : darkTheme;
    return ThemeData(
      brightness: brightness,
      colorSchemeSeed: D3pColors.mainColor,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      appBarTheme: const D3pAppBarTheme(),
      tabBarTheme: const D3pTabBarTheme(),
      bottomSheetTheme: bottomSheetThemeData,
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          minimumSize: const Size(0, 50),
          // textStyle: D3pBasicTextStyle.button,
        ),
      ),
      inputDecorationTheme: const InputDecorationTheme(
        hintStyle: TextStyle(color: D3pColors.disabled),
      ),
    );
  }

  static CupertinoThemeData cupertinoThemeData(final Brightness brightness) =>
      CupertinoThemeData(
        primaryColor: D3pColors.mainColor,
        brightness: brightness,
        barBackgroundColor: const D3pAppBarTheme().backgroundColor,
        // scaffoldBackgroundColor: resolveBGColor(brightness),
      );
}

class RealBrightness {
  static Brightness get fromSettings =>
      getIt<SettingsConfigCubit>().state.appSettings.darkTheme
          ? Brightness.dark
          : Brightness.light;
}
