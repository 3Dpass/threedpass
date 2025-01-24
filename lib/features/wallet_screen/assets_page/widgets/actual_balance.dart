import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:polkawallet_sdk/api/types/balanceData.dart';
import 'package:threedpass/core/polkawallet/utils/balance_utils.dart';
import 'package:threedpass/core/widgets/buttons/clickable_card.dart';
import 'package:threedpass/core/widgets/other/padding_16.dart';
import 'package:threedpass/features/wallet_screen/assets_page/widgets/balance_card/avaliable_balance_card.dart';
import 'package:threedpass/features/wallet_screen/assets_page/widgets/balance_card/locked_balance_card.dart';
import 'package:threedpass/features/wallet_screen/assets_page/widgets/balance_card/reserved_balance_card.dart';
import 'package:threedpass/features/wallet_screen/widgets/asset_balance_text.dart';
import 'package:threedpass/router/router.gr.dart';

part './balance_card/main_balance_content.dart';

class BalanceCard extends StatelessWidget {
  const BalanceCard({
    required this.balance,
    required this.tokenDecimals,
    required this.tokenSymbol,
    final Key? key,
  }) : super(key: key);

  final BalanceData balance;
  final int tokenDecimals;
  final String tokenSymbol;

  static const double height = 180;

  Future<void> onCardClick(final BuildContext context) async {
    await context.router.push(const TransactionsHistoryRouteWrapper());
  }

  @override
  Widget build(final BuildContext context) {
    return SizedBox(
      height: height,
      child: Padding16(
        child: ClickableCard(
          onTap: () async => onCardClick(context),
          child: _MainBalanceContent(
            balance: balance,
            tokenDecimals: tokenDecimals,
            tokenSymbol: tokenSymbol,
          ),
        ),
      ),
    );
  }
}
