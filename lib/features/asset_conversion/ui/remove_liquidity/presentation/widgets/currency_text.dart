import 'package:flutter/material.dart';
import 'package:threedpass/core/theme/d3p_colors.dart';

class CurrencyText extends StatelessWidget {
  const CurrencyText({
    required this.asset1Amount,
    required this.asset1Symbol,
    required this.asset2Amount,
    required this.asset2Symbol,
    super.key,
  });

  final double asset1Amount;
  final String asset1Symbol;
  final double asset2Amount;
  final String asset2Symbol;

  @override
  Widget build(BuildContext context) {
    final medium = Theme.of(context).textTheme.bodyMedium;
    final mediumSecondary = medium!.copyWith(color: D3pColors.disabled);
    return Text.rich(
      TextSpan(
        text: asset1Amount.toString(),
        style: medium,
        children: [
          TextSpan(text: ' $asset1Symbol = ', style: mediumSecondary),
          TextSpan(text: asset2Amount.toString(), style: medium),
          TextSpan(text: ' $asset2Symbol', style: mediumSecondary),
        ],
      ),
    );
  }
}
