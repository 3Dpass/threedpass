import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:threedpass/core/theme/d3p_special_styles.dart';
import 'package:threedpass/features/settings_page/presentation/widgets/wallet_settings/node_url_button.dart';

class WalletSettingsBlock extends StatelessWidget {
  const WalletSettingsBlock({final Key? key}) : super(key: key);

  @override
  Widget build(final BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'wallet_settings_title'.tr(),
          style: Theme.of(context).customTextStyles.d3ptitleLarge,
        ),
        const NodeUrlButton(),
        // const SizedBoxH36(),
      ],
    );
  }
}
