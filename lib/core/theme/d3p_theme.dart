import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:threedpass/core/theme/d3p_appbar_theme.dart';
import 'package:threedpass/core/theme/d3p_bottom_sheet_theme.dart';
import 'package:threedpass/core/theme/d3p_card_theme.dart';
import 'package:threedpass/core/theme/d3p_colors.dart';
import 'package:threedpass/core/theme/d3p_elevated_button_theme.dart';
import 'package:threedpass/core/theme/d3p_filled_button_theme.dart';
import 'package:threedpass/core/theme/d3p_floating_action_button_theme_data.dart';
import 'package:threedpass/core/theme/d3p_outlined_button_theme.dart';
import 'package:threedpass/core/theme/d3p_tabbar_theme.dart';
import 'package:threedpass/core/theme/d3p_text_button_theme.dart';
import 'package:threedpass/core/theme/d3p_text_input_theme.dart';
import 'package:threedpass/features/settings_page/bloc/settings_page_cubit.dart';
import 'package:threedpass/setup.dart';

class D3pThemeData {
  static const mainColor = D3pColors.mainColor;
  // static const Color secondaryButtonBG = Color(0xFF6D9B83);

  static final Color shimmerBaseColor = Colors.grey.shade400;
  static final Color shimmerHighlightColor = Colors.grey.shade100;

  static const double buttonHeight = 50;
  static const double buttonPadding = 12;
  static const double buttonBorderRadius = 12; // D3pCardTheme.radiusValue;

  static ThemeData themeData(final Brightness brightness) {
    // return brightness == Brightness.light ? lightTheme : darkTheme;
    final t = ThemeData(
      inputDecorationTheme: const InputDecorationTheme(
        hintStyle: TextStyle(color: D3pColors.disabled),
        focusedBorder: D3pTextInputTheme.focusedBorder,
        border: D3pTextInputTheme.border,
        errorMaxLines: 3,
      ),
      useMaterial3: false,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      brightness: brightness,
      disabledColor: D3pColors.disabled,
      primarySwatch: D3pColors.mainColor,
      appBarTheme: const D3pAppBarTheme(),
      bottomSheetTheme: const D3pBottomSheetThemeData(),
      cardTheme: D3pCardTheme.theme,
      dialogTheme: const DialogTheme(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            D3pCardTheme.radius,
          ),
        ),
      ),
      elevatedButtonTheme: D3pElevatedButtonTheme(),
      filledButtonTheme: D3pFilledButtonTheme(),
      textButtonTheme: D3pTextButtonThemeData(),
    );

    return t.copyWith(
      tabBarTheme: D3pTabBarTheme(
        brightness == Brightness.light
            ? t.colorScheme.primaryContainer
            : t.colorScheme.primary,
      ),
      outlinedButtonTheme: D3pOutlinedButtonTheme(
        borderSideColor: t.colorScheme.primary,
      ),
      colorScheme: t.colorScheme.copyWith(
        secondary: D3pColors.mainColor,
      ),
      floatingActionButtonTheme: D3pFloatingActionButtonThemeData(
        foregroundColor: t.colorScheme.onPrimary,
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
