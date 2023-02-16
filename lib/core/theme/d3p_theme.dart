import 'package:flutter/material.dart';
import 'package:threedpass/core/theme/d3p_appbar_theme.dart';
import 'package:threedpass/core/theme/d3p_colors.dart';
import 'package:threedpass/core/theme/d3p_tabbar_theme.dart';
import 'package:threedpass/core/theme/d3p_text_style.dart';
import 'package:threedpass/features/settings_page/bloc/settings_page_cubit.dart';
import 'package:threedpass/setup.dart';

class D3pThemeData {
  static ThemeData _elevatedButtonThemeData(final ThemeData t) {
    return t.copyWith(
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: t.colorScheme.primary,
          foregroundColor: t.colorScheme.onPrimary,
          disabledBackgroundColor: t.cardColor,
          disabledForegroundColor: t.colorScheme.onSurface.withOpacity(0.50),
          minimumSize: const Size.fromHeight(50),
        ),
      ),
    );
  }

  static ThemeData get lightTheme {
    final t = ThemeData(
      primarySwatch: Colors.green,
      primaryColor: Colors.black,
      disabledColor: D3pColors.disabled,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          minimumSize: const Size.fromHeight(50),
          textStyle: D3pBasicTextStyle.button,
        ),
      ),
      textTheme: const TextTheme(
        labelLarge: D3pBasicTextStyle.button,
        bodyLarge: D3pBasicTextStyle.bodyLarge,
        bodyMedium: D3pBasicTextStyle.bodyMedium,
      ),
      appBarTheme: const D3pAppBarTheme(),
      tabBarTheme: const D3pTabBarTheme(),
    );
    final t1 = _elevatedButtonThemeData(t);
    return t1;
  }

  static ThemeData get darkTheme {
    final t = ThemeData.dark().copyWith(
      brightness: Brightness.dark,
      colorScheme: ColorScheme.fromSwatch(
        primarySwatch: Colors.green,
      ),
      disabledColor: D3pColors.disabled,
      primaryColor: Colors.black,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          minimumSize: const Size.fromHeight(50),
          textStyle: D3pBasicTextStyle.button,
        ),
      ),
      textTheme: const TextTheme(
        labelLarge: D3pBasicTextStyle.button,
        bodyLarge: D3pBasicTextStyle.bodyLarge,
        bodyMedium: D3pBasicTextStyle.bodyMedium,
      ),
      appBarTheme: const D3pAppBarTheme(),
      tabBarTheme: const D3pTabBarTheme(),
    );

    final t1 = _elevatedButtonThemeData(t);
    return t1;
  }

  static ThemeData themeData(final Brightness brightness) {
    return brightness == Brightness.light ? lightTheme : darkTheme;
  }
}

class RealBrightness {
  static Brightness get fromSettings =>
      getIt<SettingsConfigCubit>().state.appSettings.darkTheme
          ? Brightness.dark
          : Brightness.light;
}
