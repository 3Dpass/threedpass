import 'package:flutter/material.dart';
import 'package:threedpass/core/theme/d3p_special_styles.dart';

class AssetBalanceText extends StatelessWidget {
  final String tokenSymbol;
  final String balance;

  const AssetBalanceText({
    required this.balance,
    required this.tokenSymbol,
    super.key,
  });

  @override
  Widget build(final BuildContext context) {
    final styles = Theme.of(context).customTextStyles;
    return Text.rich(
      TextSpan(
        text: balance,
        children: [
          TextSpan(
            text: ' ' + tokenSymbol,
            style: styles.dp3BodySmall,
          ),
        ],
      ),
      style: styles.d3pheadlineMedium,
    );
  }
}
