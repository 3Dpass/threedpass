import 'package:rational/rational.dart';

class SwapInfo {
  final Rational rate;
  final Rational firstValue;
  final Rational secondValue;

  const SwapInfo({
    required this.rate,
    required this.firstValue,
    required this.secondValue,
  });
}
