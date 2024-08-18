import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:threedpass/core/widgets/d3p_scaffold.dart';
import 'package:threedpass/core/widgets/paddings.dart';
import 'package:threedpass/features/settings_page/presentation/widgets/app_settings/app_settings.dart';
import 'package:threedpass/features/settings_page/presentation/widgets/hash_settings_block.dart';
import 'package:threedpass/features/settings_page/presentation/widgets/preview_settings_block.dart';
import 'package:threedpass/features/settings_page/presentation/widgets/version_info.dart';
import 'package:threedpass/features/settings_page/presentation/widgets/wallet_settings_block.dart';

@RoutePage()
class SettingsPage extends StatelessWidget {
  const SettingsPage({
    final Key? key,
  }) : super(key: key);

  @override
  Widget build(final BuildContext context) {
    return const D3pScaffold(
      appbarTitle: 'settings_title',
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            H8(),
            HashSettingsBlock(),
            // PreviewSettingsBlock(),
            WalletSettingsBlock(),
            AppSettingsBlock(),
            H16(),
            VersionInfo(),
            H8(),
          ],
        ),
      ),
    );
  }
}
