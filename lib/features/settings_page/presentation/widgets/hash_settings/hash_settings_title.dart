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

    return Text.rich(
      TextSpan(
        text: 'hash_settings_title'.tr() + ' ',
        style: Theme.of(context).textTheme.headline6,
        children: [
          TextSpan(
            text: 'lib version: ' + libVersion,
            style: Theme.of(context).textTheme.caption,
          ),
        ],
      ),
    );
  }
}
