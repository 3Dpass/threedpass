import 'package:flutter/material.dart';
import 'package:threedpass/features/settings_page/presentation/widgets/settings_section_header.dart';
import 'package:threedpass/features/settings_page/presentation/widgets/wallet_settings/node_url_button.dart';

class WalletSettingsBlock extends StatelessWidget {
  const WalletSettingsBlock({final Key? key}) : super(key: key);

  @override
  Widget build(final BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        const SettingsSectionHeader(
          title: 'wallet_settings_title',
        ),
        const NodeUrlButton(),
      ],
    );
  }
}
