part of '../actual_balance.dart';

class _MainBalanceContent extends StatelessWidget {
  const _MainBalanceContent({
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
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        AssetBalanceText(
          balance: BalanceUtils.formattedTotal(
            balance,
            tokenDecimals,
          ),
          tokenSymbol: tokenSymbol,
        ),
        const SizedBox(height: 16),
        AvaliableBalanceCard(
          balance: balance.availableBalance as String,
          tokenSymbol: tokenSymbol,
          tokenDecimals: tokenDecimals,
        ),

        // const SizedBox(width: 8),
        LockedBalanceCard(
          balance: balance.lockedBalance as String,
          tokenSymbol: tokenSymbol,
          tokenDecimals: tokenDecimals,
        ),
        // const SizedBox(width: 8),
        ReservedBalanceCard(
          balance: balance.reservedBalance as String,
          tokenSymbol: tokenSymbol,
          tokenDecimals: tokenDecimals,
        ),
      ],
    );
  }
}
