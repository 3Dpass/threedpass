import 'package:polkawallet_sdk/plugin/store/balances.dart';
import 'package:threedpass/core/polkawallet/app_service.dart';

/// Load balances for assets
class NonNativeTokensApi {
  final AppService service;
  final String address;

  NonNativeTokensApi(this.service) : address = service.keyring.current.address!;

  Future<List<TokenBalanceData>> process() async {
    final result = <TokenBalanceData>[];

    final tokensCommonData = await service.plugin.sdk.api.assets.getAssetsAll();
    final ids = tokensCommonData.map((e) => e.id ?? '').toList();
    ids.removeWhere((element) => element.isEmpty);

    final balances =
        await service.plugin.sdk.api.assets.queryAssetsBalances(ids, address);

    for (int i = 0; i < tokensCommonData.length; i++) {
      final tcd = tokensCommonData[i];
      final balanceData = TokenBalanceData(
        id: tcd.id,
        fullName: tcd.fullName,
        name: tcd.name,
        symbol: tcd.symbol,
        type: tcd.type,
        amount: balances[i].balance ?? '0',
      );
      result.add(balanceData);
    }

    return result;
  }

  Future<void> setTokens() async {
    final tokens = await process();
    service.plugin.balances.setTokens(tokens);
  }
}
