import 'package:flutter/material.dart';
import 'package:threedpass/core/polkawallet/utils/balance_utils.dart';
import 'package:threedpass/core/theme/d3p_special_styles.dart';
import 'package:threedpass/core/widgets/d3p_card.dart';

class BasicBalanceCard extends StatelessWidget {
  final String tokenSymbol;
  final String balance;
  final int tokenDecimals;
  final IconData iconData;
  final String title;

  const BasicBalanceCard({
    required this.balance,
    required this.tokenDecimals,
    required this.tokenSymbol,
    required this.iconData,
    required this.title,
    final Key? key,
  }) : super(key: key);

  @override
  Widget build(final BuildContext context) {
    final textStyles = Theme.of(context).customTextStyles;
    return D3pCard(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Column(
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
                  style: textStyles.d3pBodyMedium,
                ),
              ],
            ),
            const SizedBox(height: 4),
            Text.rich(
              TextSpan(
                text: BalanceUtils.balance(
                  balance,
                  tokenDecimals,
                ),
                children: [
                  TextSpan(
                    text: ' ' + tokenSymbol,
                    style: textStyles.dp3BodySmall,
                  ),
                ],
              ),
              style: textStyles.d3pBodyMedium,
            ),
          ],
        ),
      ),
    );
  }
}
