import 'package:flutter/material.dart';

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
    final styles = Theme.of(context).textTheme;
    return Text.rich(
      TextSpan(
        text: balance,
        children: [
          TextSpan(
            text: ' ' + tokenSymbol,
            style: styles.bodySmall,
          ),
        ],
      ),
      style: styles.headlineMedium!.copyWith(color: styles.bodyLarge!.color),
    );
  }
}
