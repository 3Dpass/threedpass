import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:threedpass/features/wallet_screen/presentation/widgets/asset_page/balance_card/basic_balance_card.dart';

class AvaliableBalanceCard extends StatelessWidget {
  const AvaliableBalanceCard({
    Key? key,
    required this.balance,
    required this.tokenSymbol,
    required this.tokenDecimals,
  }) : super(key: key);

  final String balance;
  final String tokenSymbol;
  final int tokenDecimals;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: BasicBalanceCard(
        iconData: Icons.wallet,
        balance: balance,
        tokenSymbol: tokenSymbol,
        tokenDecimals: tokenDecimals,
        title: 'balance_avaliable_title'.tr(),
      ),
    );
  }
}
