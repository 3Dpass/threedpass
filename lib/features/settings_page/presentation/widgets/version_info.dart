part of '../settings_page.dart';

class _VersionInfo extends StatelessWidget {
  const _VersionInfo();

  @override
  Widget build(final BuildContext context) {
    final p = getIt<PackageInfo>();
    return Align(
      child: Text.rich(
        TextSpan(
          text: '',
          children: [
            TextSpan(
              text: '${p.version}+${p.buildNumber}',
              style: Theme.of(context).customTextStyles.secondaryText,
            ),
          ],
        ),
      ),
    );
  }
}
