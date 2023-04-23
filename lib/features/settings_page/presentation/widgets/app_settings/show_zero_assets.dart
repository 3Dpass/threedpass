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
    return D3pSwitchButton(
      text: 'show_zero_assets_label'.tr(),
      onChanged: (final value) => onChanged(value, context),
      initialValue: BlocProvider.of<SettingsConfigCubit>(context)
          .state
          .appSettings
          .showZeroAssets,
    );
  }
}
