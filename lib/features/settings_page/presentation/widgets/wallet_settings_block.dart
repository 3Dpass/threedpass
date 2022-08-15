import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class WalletSettingsBlock extends StatelessWidget {
  const WalletSettingsBlock({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'wallet_settings_title'.tr(),
          style: Theme.of(context).textTheme.headline6,
        ),
        SizedBox(height: 16),
      ],
    );
  }
}
