import 'package:decimal/decimal.dart';
import 'package:rational/rational.dart';

extension RemoveDecimals on Rational {
  BigInt removeDecimals(final int decimals) {
    return (this * Rational(BigInt.from(10).pow(decimals))).toBigInt();
  }

  Rational setDecimalsForRaw(final int decimals) {
    return this /
        Decimal.fromBigInt(BigInt.from(10).pow(decimals)).toRational();
  }

  String setDecimalsNToFixedString(final int decimals) {
    return setDecimalsForRaw(decimals).toDouble().toStringAsFixed(decimals);
  }
}
