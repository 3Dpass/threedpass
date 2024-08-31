import 'package:flutter/material.dart';
import 'package:threedpass/core/polkawallet/utils/balance_utils.dart';

class BasicBalanceRow extends StatelessWidget {
  final String tokenSymbol;
  final String balance;
  final int tokenDecimals;
  final IconData iconData;
  final String title;

  const BasicBalanceRow({
    required this.balance,
    required this.tokenDecimals,
    required this.tokenSymbol,
    required this.iconData,
    required this.title,
    final Key? key,
  }) : super(key: key);

  @override
  Widget build(final BuildContext context) {
    final textStyles = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                iconData,
                size: 20,
              ),
              const SizedBox(width: 8),
              Text(
                title,
                style: textStyles.bodyMedium,
              ),
            ],
          ),
          Text.rich(
            TextSpan(
              text: BalanceUtils.balance(
                balance,
                tokenDecimals,
              ),
              children: [
                TextSpan(
                  text: ' ' + tokenSymbol,
                  style: textStyles.bodySmall,
                ),
              ],
            ),
            style: textStyles.bodyMedium,
          ),
        ],
      ),
    );
  }
}
