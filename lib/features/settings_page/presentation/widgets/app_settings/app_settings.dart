part of '../../settings_page.dart';

class _AppSettingsBlock extends StatelessWidget {
  const _AppSettingsBlock({final Key? key}) : super(key: key);

  @override
  Widget build(final BuildContext context) {
    return Column(
      children: [
        Text(
          'app_settings_title'.tr(),
          style: Theme.of(context).textTheme.headline6,
        ),
        const SizedBox8(),
        const _RequirementsTextField(),
        const SizedBox(height: 16),
      ],
    );
  }
}
