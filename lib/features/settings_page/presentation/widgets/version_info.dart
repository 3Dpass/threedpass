import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:threedpass/core/theme/d3p_special_styles.dart';
import 'package:threedpass/setup.dart';

class VersionInfo extends StatelessWidget {
  const VersionInfo({super.key});

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
