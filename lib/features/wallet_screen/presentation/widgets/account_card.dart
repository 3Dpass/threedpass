import 'package:flutter/material.dart';
import 'package:threedpass/features/wallet_screen/presentation/widgets/create_account_button.dart';
import 'package:threedpass/features/wallet_screen/presentation/widgets/import_account_button.dart';

class AccountCard extends StatelessWidget {
  const AccountCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
