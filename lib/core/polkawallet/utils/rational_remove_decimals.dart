import 'package:rational/rational.dart';

extension RemoveDecimals on Rational {
  BigInt removeDecimals(final int decimals) {
    return (this * Rational(BigInt.from(10).pow(decimals))).toBigInt();
  }
}
