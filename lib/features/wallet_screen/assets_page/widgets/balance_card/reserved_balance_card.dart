import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:threedpass/features/wallet_screen/assets_page/widgets/balance_card/basic_balance_card.dart';

class ReservedBalanceCard extends StatelessWidget {
  const ReservedBalanceCard({
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
      child: BasicBalanceRow(
        iconData: Icons.shield_outlined,
        balance: balance,
        tokenSymbol: tokenSymbol,
        tokenDecimals: tokenDecimals,
        title: 'balance_reserved_title'.tr(),
      ),
    );
  }
}
