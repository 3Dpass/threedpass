import 'package:decimal/decimal.dart';
import 'package:rational/rational.dart';

extension SetDecimals on Decimal {
  Decimal setDecimalsForUserInput(final int decimals) {
    return this * Decimal.fromBigInt(BigInt.from(10).pow(decimals));
  }

  Rational setDecimalsForRaw(final int decimals) {
    return this / Decimal.fromBigInt(BigInt.from(10).pow(decimals));
  }
}
