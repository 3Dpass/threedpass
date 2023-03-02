// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:threedpass/core/widgets/input/switch_button.dart';
// import 'package:threedpass/features/settings_page/bloc/settings_page_cubit.dart';
// import 'package:threedpass/features/settings_page/domain/entities/global_settings.dart';
// import 'package:threedpass/features/settings_page/domain/entities/preview_settings.dart';
part of '../../settings_page.dart';

class _DarkThemeSwitch extends StatelessWidget {
  const _DarkThemeSwitch({final Key? key}) : super(key: key);

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
    return D3pSwitchButton(
      text: 'dark_theme_switch_label'.tr(),
      onChanged: (final value) => onChanged(value, context),
      initialValue: BlocProvider.of<SettingsConfigCubit>(context)
          .state
          .appSettings
          .darkTheme,
    );
  }
}
