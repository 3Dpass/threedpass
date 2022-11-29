import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:threedpass/core/widgets/buttons/card_elevated_button.dart';
import 'package:threedpass/router/router.gr.dart';

class OpenWebWalletButton extends StatelessWidget {
  const OpenWebWalletButton({final Key? key}) : super(key: key);

  @override
  Widget build(final BuildContext context) {
    return D3pCardElevatedButton(
      iconData: Icons.explore,
      text: 'open_web_wallet_button_label'.tr(),
      onPressed: () => context.router.push(
        WebWalletRoute(initialUrl: 'https://wallet.3dpass.org/'),
      ),
    );
  }
}
