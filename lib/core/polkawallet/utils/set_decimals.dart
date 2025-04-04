import 'package:decimal/decimal.dart';
import 'package:rational/rational.dart';

extension SetDecimals on Decimal {
  Decimal setDecimalsForUserInput(final int decimals) {
    // TODO Check here and in other places that user input fractional part has less numbers than actual asset decimals
    return this * Decimal.fromBigInt(BigInt.from(10).pow(decimals));
  }

  Rational setDecimalsForRaw(final int decimals) {
    return this / Decimal.fromBigInt(BigInt.from(10).pow(decimals));
  }

  bool hasCorrectDecimals(final int decimals) {
    return scale <= decimals;
  }
}
