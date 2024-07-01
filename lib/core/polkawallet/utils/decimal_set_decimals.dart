import 'package:decimal/decimal.dart';

extension SetDecimals on Decimal {
  Decimal setDecimals(final int decimals) {
    return this * Decimal.fromBigInt(BigInt.from(10).pow(decimals));
  }
}
