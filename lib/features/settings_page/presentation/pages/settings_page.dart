import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:threedpass/features/settings_page/presentation/widgets/hash_settings_block.dart';
import 'package:threedpass/features/settings_page/presentation/widgets/preview_settings_block.dart';
import 'package:threedpass/features/settings_page/presentation/widgets/settings_appbar.dart';
import 'package:threedpass/features/settings_page/presentation/widgets/wallet_settings_block.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SettingsAppbar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: const [
              SizedBox(height: 16),
              HashSettingsBlock(),
              PreviewSettingsBlock(),
              WalletSettingsBlock(),
            ],
          ),
        ),
      ),
    );
  }
}
