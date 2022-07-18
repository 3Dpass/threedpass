import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:threedpass/features/wallet_page/presentation/widgets/create_account_button.dart';
import 'package:threedpass/features/wallet_page/presentation/widgets/import_account_button.dart';

class AccountCard extends StatelessWidget {
  const AccountCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          children: [
            Text(
              'Coming soon'.tr(),
              style: Theme.of(context).textTheme.subtitle1,
            ),
            const SizedBox(height: 16),
            const CreateAccountButton(),
            const ImportAccountButton(),
          ],
        ),
      ),
    );
  }
}
