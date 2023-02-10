import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/features/settings_page/bloc/settings_page_cubit.dart';
import 'package:threedpass/features/settings_page/domain/entities/global_settings.dart';

class ThemeBuilder extends StatelessWidget {
  const ThemeBuilder({
    required this.builder,
    super.key,
  });

  final Widget Function(
    BuildContext context,
    Brightness brightness,
  ) builder;

  @override
  Widget build(final BuildContext context) {
    return BlocBuilder<SettingsConfigCubit, GlobalSettings>(
      buildWhen: (final previous, final current) =>
          previous.appSettings.darkTheme != current.appSettings.darkTheme,
      builder: (final BuildContext context, final GlobalSettings value) =>
          builder(
        context,
        value.appSettings.darkTheme ? Brightness.dark : Brightness.light,
      ),
    );
  }
}
