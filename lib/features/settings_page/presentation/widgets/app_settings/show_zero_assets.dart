part of '../../settings_page.dart';

class _ShowZeroAssets extends StatelessWidget {
  const _ShowZeroAssets({final Key? key}) : super(key: key);

  void onChanged(final bool newValue, final BuildContext context) {
    final cubit = BlocProvider.of<SettingsConfigCubit>(context);
    final newAppSettings =
        cubit.state.appSettings.copyWith(showZeroAssets: newValue);
    final newState = cubit.state.copyWith(appSettings: newAppSettings);
    cubit.updateSettings(newState);
  }

  @override
  Widget build(final BuildContext context) {
    return DefaultSettingsButton.boolean(
      text: 'show_zero_assets_label'.tr(),
      iconData: Icons.exposure_zero_outlined,
      iconColor: Colors.green,
      initialValue: BlocProvider.of<SettingsConfigCubit>(context)
          .state
          .appSettings
          .showZeroAssets,
      onPressedBool: (final bool p0) => onChanged(p0, context),
    );
  }
}
