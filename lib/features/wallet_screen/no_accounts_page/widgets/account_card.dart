import 'package:flutter/material.dart';
import 'package:threedpass/core/widgets/d3p_card.dart';
import 'package:threedpass/core/widgets/paddings.dart';
import 'package:threedpass/features/wallet_screen/no_accounts_page/widgets/create_account_button.dart';
import 'package:threedpass/features/wallet_screen/no_accounts_page/widgets/import_account_button.dart';

class AccountCard extends StatelessWidget {
  const AccountCard({final Key? key}) : super(key: key);

  @override
  Widget build(final BuildContext context) {
    return const D3pCard(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          children: [
            H8(),
            CreateAccountButton(),
            H4(),
            ImportAccountButton(),
            H8(),
          ],
        ),
      ),
    );
  }
}
