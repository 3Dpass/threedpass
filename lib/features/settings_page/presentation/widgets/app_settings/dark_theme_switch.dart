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
    return BlocBuilder<SettingsConfigCubit, GlobalSettings>(
      builder: (context, state) => DefaultSettingsButton.boolean(
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
