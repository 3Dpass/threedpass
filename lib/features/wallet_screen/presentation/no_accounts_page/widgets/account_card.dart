import 'package:flutter/material.dart';
import 'package:threedpass/features/wallet_screen/presentation/no_accounts_page/widgets/create_account_button.dart';
import 'package:threedpass/features/wallet_screen/presentation/no_accounts_page/widgets/import_account_button.dart';

class AccountCard extends StatelessWidget {
  const AccountCard({final Key? key}) : super(key: key);

  @override
  Widget build(final BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          children: const [
            CreateAccountButton(),
            ImportAccountButton(),
          ],
        ),
      ),
    );
  }
}
