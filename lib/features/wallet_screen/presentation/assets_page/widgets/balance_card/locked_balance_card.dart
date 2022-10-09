import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:threedpass/features/wallet_screen/presentation/assets_page/widgets/balance_card/basic_balance_card.dart';

class LockedBalanceCard extends StatelessWidget {
  const LockedBalanceCard({
    required this.balance,
    required this.tokenSymbol,
    required this.tokenDecimals,
    final Key? key,
  }) : super(key: key);

  final String balance;
  final String tokenSymbol;
  final int tokenDecimals;

  @override
  Widget build(final BuildContext context) {
    return Flexible(
      child: BasicBalanceCard(
        iconData: Icons.lock_outline,
        balance: balance,
        tokenSymbol: tokenSymbol,
        tokenDecimals: tokenDecimals,
        title: 'balance_locked_title'.tr(),
      ),
    );
  }
}
