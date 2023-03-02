import 'package:flutter/material.dart';
import 'package:threedpass/core/theme/d3p_appbar_theme.dart';
import 'package:threedpass/core/theme/d3p_colors.dart';
import 'package:threedpass/core/theme/d3p_tabbar_theme.dart';
import 'package:threedpass/core/theme/d3p_text_style.dart';
import 'package:threedpass/features/settings_page/bloc/settings_page_cubit.dart';
import 'package:threedpass/setup.dart';

import 'd3p_elevated_button_theme.dart';

class D3pThemeData {
  static MaterialColor mainColor = Colors.green;

  static ThemeData get lightTheme {
    final t = ThemeData(
      primarySwatch: mainColor,
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
    final t1 = t.copyWith(
      elevatedButtonTheme: D3pElevatedButtonTheme.theme(t),
    );
    return t1;
  }

  static ThemeData get darkTheme {
    final t = ThemeData.dark().copyWith(
      brightness: Brightness.dark,
      colorScheme: ColorScheme.fromSwatch(
        primarySwatch: mainColor,
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

    final t1 = t.copyWith(
      elevatedButtonTheme: D3pElevatedButtonTheme.theme(t),
    );
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
