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
    final t0 = ThemeData.from(
      colorScheme: ColorScheme.fromSeed(
        seedColor: D3pColors.mainColor,
        brightness: brightness,
        // Make dark theme background less dark by adjusting surface colors
        surface: brightness == Brightness.dark ? const Color(0xFF1F1F1F) : null,
        surfaceDim:
            brightness == Brightness.dark ? const Color(0xFF1F1F1F) : null,
        surfaceContainerLowest:
            brightness == Brightness.dark ? const Color(0xFF1F1F1F) : null,
        surfaceContainerLow:
            brightness == Brightness.dark ? const Color(0xFF242424) : null,
        surfaceContainer:
            brightness == Brightness.dark ? const Color(0xFF272727) : null,
        surfaceContainerHigh:
            brightness == Brightness.dark ? const Color(0xFF2C2C2C) : null,
        surfaceContainerHighest:
            brightness == Brightness.dark ? const Color(0xFF313131) : null,
      ),
      useMaterial3: true,
    );
    final t = t0.copyWith(
      inputDecorationTheme: const InputDecorationTheme(
        hintStyle: TextStyle(color: D3pColors.disabled),
        focusedBorder: D3pTextInputTheme.focusedBorder,
        border: D3pTextInputTheme.border,
        errorMaxLines: 3,
      ),
      visualDensity: VisualDensity.adaptivePlatformDensity,
      brightness: brightness,
      disabledColor: D3pColors.disabled,
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
      floatingActionButtonTheme: D3pFloatingActionButtonThemeData(
        foregroundColor: t.colorScheme.onPrimaryContainer,
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
