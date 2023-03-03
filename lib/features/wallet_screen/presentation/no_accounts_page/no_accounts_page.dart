import 'package:flutter/material.dart';
import 'package:threedpass/core/widgets/d3p_scaffold.dart';
import 'package:threedpass/core/widgets/paddings.dart';
import 'package:threedpass/features/wallet_screen/presentation/no_accounts_page/widgets/account_card.dart';
import 'package:threedpass/features/wallet_screen/presentation/widgets/connect_status.dart';

class NoAccountsPage extends StatelessWidget {
  const NoAccountsPage({final Key? key}) : super(key: key);

  @override
  Widget build(final BuildContext context) {
    return D3pScaffold(
      removeBackButton: true,
      appbarTitle: 'wallet_header_title',
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          ConnectStatus(),
          SizedBoxH24(),
          AccountCard(),
        ],
      ),
    );
  }
}
