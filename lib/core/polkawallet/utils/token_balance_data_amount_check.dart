import 'package:polkawallet_sdk/plugin/store/balances.dart';

extension TokenBalanceDataAmount on TokenBalanceData {
  /// Checks is amount > 0
  bool get amountIsPositive {
    // if amount is not NULL and amount is number and amount is > 0
    return amount != null &&
        double.tryParse(amount!) != null &&
        double.parse(amount!) > 0;
  }
}
