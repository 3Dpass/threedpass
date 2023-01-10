import 'package:flutter/material.dart';
import 'package:threedpass/core/theme/d3p_appbar_theme.dart';
import 'package:threedpass/core/theme/d3p_colors.dart';
import 'package:threedpass/core/theme/d3p_tabbar_theme.dart';
import 'package:threedpass/core/theme/d3p_text_style.dart';
import 'package:threedpass/features/settings_page/bloc/settings_page_cubit.dart';
import 'package:threedpass/setup.dart';

class D3pThemeData {
  static ThemeData lightTheme = ThemeData(
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
      button: D3pBasicTextStyle.button,
      bodyText1: D3pBasicTextStyle.bodyText1,
      bodyText2: D3pBasicTextStyle.bodyText2,
    ),
    appBarTheme: const D3pAppBarTheme(),
    tabBarTheme: const D3pTabBarTheme(),
  );

  static ThemeData darkTheme = ThemeData.dark().copyWith(
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
      button: D3pBasicTextStyle.button,
      bodyText1: D3pBasicTextStyle.bodyText1,
      bodyText2: D3pBasicTextStyle.bodyText2,
    ),
    appBarTheme: const D3pAppBarTheme(),
    tabBarTheme: const D3pTabBarTheme(),
  );

  static ThemeData themeData(final Brightness brightness) {
    return brightness == Brightness.light ? lightTheme : darkTheme;
  }
}

// TODO Move to getIt<>()
class RealBrightness {
  static Brightness get fromSettings =>
      getIt<SettingsConfigCubit>().state.appSettings.darkTheme
          ? Brightness.dark
          : Brightness.light;
}
