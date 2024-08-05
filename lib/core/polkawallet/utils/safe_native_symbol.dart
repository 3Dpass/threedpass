import 'package:polkawallet_sdk/api/types/networkStateData.dart';

extension SafeNativeSymbol on NetworkStateData {
  String? get safeNativeSymbol {
    if (tokenSymbol?.isNotEmpty ?? false) {
      return tokenSymbol!.first;
    } else {
      return null;
    }
  }
}
