part of '../../settings_page.dart';

class _ScanSettingsTitle extends StatelessWidget {
  const _ScanSettingsTitle({
    final Key? key,
  }) : super(key: key);
  @override
  Widget build(final BuildContext context) {
    final libVersion = BlocProvider.of<SettingsConfigCubit>(context)
        .state
        .scanSettings
        .libVersion;

    final textStyles = Theme.of(context).customTextStyles;
    return Text.rich(
      TextSpan(
        text: 'hash_settings_title'.tr() + ' ',
        style: textStyles.d3ptitleLarge,
        children: [
          TextSpan(
            text: 'lib version: ' + libVersion,
            style: textStyles.dp3BodySmall,
          ),
        ],
      ),
    );
  }
}
