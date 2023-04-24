import 'package:flutter/material.dart';
import 'package:polkawallet_sdk/api/types/balanceData.dart';
import 'package:threedpass/core/polkawallet/utils/balance_utils.dart';
import 'package:threedpass/core/theme/d3p_special_styles.dart';
import 'package:threedpass/features/wallet_screen/presentation/assets_page/widgets/balance_card/avaliable_balance_card.dart';
import 'package:threedpass/features/wallet_screen/presentation/assets_page/widgets/balance_card/locked_balance_card.dart';
import 'package:threedpass/features/wallet_screen/presentation/assets_page/widgets/balance_card/reserved_balance_card.dart';
import 'package:threedpass/features/wallet_screen/presentation/widgets/asset_balance_text.dart';

class BalanceCards extends StatelessWidget {
  const BalanceCards({
    required this.balance,
    required this.tokenDecimals,
    required this.tokenSymbol,
    final Key? key,
  }) : super(key: key);

  final BalanceData balance;
  final int tokenDecimals;
  final String tokenSymbol;

  @override
  Widget build(final BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AssetBalanceText(
            balance: BalanceUtils.formattedTotal(
              balance,
              tokenDecimals,
            ),
            tokenSymbol: tokenSymbol,
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisSize: MainAxisSize.min,
            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              AvaliableBalanceCard(
                balance: balance.availableBalance as String,
                tokenSymbol: tokenSymbol,
                tokenDecimals: tokenDecimals,
              ),
              const SizedBox(width: 8),
              LockedBalanceCard(
                balance: balance.lockedBalance as String,
                tokenSymbol: tokenSymbol,
                tokenDecimals: tokenDecimals,
              ),
              const SizedBox(width: 8),
              ReservedBalanceCard(
                balance: balance.reservedBalance as String,
                tokenSymbol: tokenSymbol,
                tokenDecimals: tokenDecimals,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
