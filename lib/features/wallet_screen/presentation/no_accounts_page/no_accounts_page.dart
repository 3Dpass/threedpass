import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:threedpass/core/widgets/appbars/common_logo_appbar.dart';
import 'package:threedpass/features/wallet_screen/presentation/no_accounts_page/widgets/account_card.dart';
import 'package:threedpass/features/wallet_screen/presentation/widgets/connect_status.dart';
import 'package:threedpass/features/wallet_screen/presentation/widgets/open_web_wallet_card.dart';

class NoAccountsPage extends StatelessWidget {
  const NoAccountsPage({final Key? key}) : super(key: key);

  @override
  Widget build(final BuildContext context) {
    return Scaffold(
      appBar: CommonLogoAppbar(
        title: 'wallet_header_title'.tr(),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          OpenWebWalletCard(),
          ConnectStatus(),
          AccountCard(),
          SizedBox(),
        ],
      ),
    );
  }
}
