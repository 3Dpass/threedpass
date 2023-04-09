import 'package:polkawallet_sdk/plugin/store/balances.dart';
import 'package:threedpass/core/polkawallet/app_service.dart';

extension FindTBD on AppService {
  TokenBalanceData findTokenBalanceData(
    final String assetId,
  ) {
    final tokenBalanceData = plugin.balances.tokens
        .firstWhere((final element) => element.id == assetId);

    return tokenBalanceData;
  }
}
