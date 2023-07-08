import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:threedpass/features/settings_page/bloc/settings_page_cubit.dart';
import 'package:threedpass/features/settings_page/domain/entities/app_settings.dart';
import 'package:threedpass/features/settings_page/domain/entities/global_settings.dart';
import 'package:threedpass/features/settings_page/presentation/widgets/default_settings_button.dart';

class DarkThemeSwitch extends StatelessWidget {
  const DarkThemeSwitch({final Key? key}) : super(key: key);

  void onChanged(final bool newValue, final BuildContext context) {
    final cubit = BlocProvider.of<SettingsConfigCubit>(context);
    final newAppSettings =
        cubit.state.appSettings.copyWith(darkTheme: newValue);
    final newState = cubit.state.copyWith(appSettings: newAppSettings);
    cubit.updateSettings(newState);
    // test1.value = !test1.value;
    if (Platform.isIOS) {
      Phoenix.rebirth(context);
    }
  }

  @override
  Widget build(final BuildContext context) {
    return BlocBuilder<SettingsConfigCubit, GlobalSettings>(
      builder: (final context, final state) => DefaultSettingsButton.boolean(
        text: 'dark_theme_switch_label',
        iconData: Icons.wb_sunny_outlined,
        iconColor: Colors.green,
        initialValue:
            // BlocProvider.of<SettingsConfigCubit>(context)
            state.appSettings.darkTheme,
        onPressedBool: (final bool p0) => onChanged(p0, context),
      ),
    );
  }
}
