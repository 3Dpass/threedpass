import 'package:polkawallet_sdk/api/types/networkStateData.dart';

extension NullCheck on NetworkStateData {
  bool get isNull =>
      ss58Format == null ||
      name == null ||
      tokenDecimals == null ||
      tokenSymbol == null;

  int get safeDecimals => tokenDecimals?.first ?? 12;
}
