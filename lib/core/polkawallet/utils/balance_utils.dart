import 'dart:math';

import 'package:intl/intl.dart';
import 'package:polkawallet_sdk/api/types/balanceData.dart';
import 'package:threedpass/common/logger.dart';

class BalanceUtils {
  static BigInt balanceTotal(BalanceData? balance) {
    return balanceInt((balance?.freeBalance ?? 0).toString()) +
        balanceInt((balance?.reservedBalance ?? 0).toString());
  }

  /// number transform 1:
  /// from raw <String> of Api data to <BigInt>
  static BigInt balanceInt(String? raw) {
    if (raw == null || raw.isEmpty) {
      return BigInt.zero;
    }
    if (raw.contains(',') || raw.contains('.')) {
      if (raw.contains('e')) {
        // eg. 1.63e+25
        return BigInt.from(double.parse(raw));
      }
      return BigInt.from(NumberFormat(',##0.000').parse(raw));
    } else {
      return BigInt.parse(raw);
    }
  }

  /// number transform 2:
  /// from <BigInt> to <double>
  static double bigIntToDouble(BigInt? value, int decimals) {
    if (value == null) {
      return 0;
    }
    return value / BigInt.from(pow(10, decimals));
  }

  /// number transform 3:
  /// from <double> to <String> in token format of ",##0.000"
  static String doubleFormat(
    double? value, {
    int length = 4,
    int round = 0,
  }) {
    if (value == null) {
      return '~';
    }
    NumberFormat f =
        NumberFormat(",##0${length > 0 ? '.' : ''}${'#' * length}", 'en_US');
    return f.format(value);
  }

  /// combined number transform 1-3:
  /// from raw <String> to <String> in token format of ",##0.000"
  static String balance(
    String? raw,
    int decimals, {
    int length = 4,
  }) {
    if (raw == null || raw.isEmpty) {
      return '~';
    }
    return doubleFormat(
      bigIntToDouble(balanceInt(raw), decimals),
      length: length,
    );
  }

  /// number transform 4:
  /// from <String of double> to <BigInt>
  static BigInt tokenInt(String? value, int decimals) {
    if (value == null) {
      return BigInt.zero;
    }
    double v = 0;
    try {
      if (value.contains(',') || value.contains('.')) {
        v = NumberFormat(",##0.${"0" * decimals}").parse(value) as double;
      } else {
        v = double.parse(value);
      }
    } catch (err) {
      logger.e('BalanceUtils.tokenInt() error: ${err.toString()}');
      // debugPrint();
    }
    return BigInt.from(v * pow(10, decimals));
  }

  static String formattedTotal(BalanceData balanceData, int decimals) {
    return doubleFormat(bigIntToDouble(balanceTotal(balanceData), decimals));
  }
}

extension NullCheck on BalanceData {
  bool get isNull =>
      availableBalance == null ||
      reservedBalance == null ||
      lockedBalance == null;
}
