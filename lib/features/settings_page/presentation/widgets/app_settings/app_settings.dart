part of '../../settings_page.dart';

class _AppSettingsBlock extends StatelessWidget {
  const _AppSettingsBlock({final Key? key}) : super(key: key);

  @override
  Widget build(final BuildContext context) {
    return Column(
      children: [
        Text(
          'app_settings_title'.tr(),
          style: Theme.of(context).customTextStyles.d3ptitleLarge,
        ),
        const SizedBoxH8(),
        const _RequirementsTextField(),
        const SizedBoxH8(),
        const _DarkThemeSwitch(),
        const SizedBoxH8(),
        const _ShowZeroAssets(),
        const SizedBoxH16(),
      ],
    );
  }
}
