import 'package:rational/rational.dart';

class RemoveLiquidityInfo {
  final Rational rate;
  final Rational priceImpact;
  final Rational amount1MinRecieve;
  final Rational amount2MinRecieve;
  final Rational amount1Expected;
  final Rational amount2Expected;

  const RemoveLiquidityInfo({
    required this.rate,
    required this.priceImpact,
    required this.amount1MinRecieve,
    required this.amount2MinRecieve,
    required this.amount1Expected,
    required this.amount2Expected,
  });
}
