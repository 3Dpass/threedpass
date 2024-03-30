import 'package:polkawallet_sdk/plugin/store/balances.dart';
import 'package:threedpass/core/polkawallet/app_service.dart';

/// Load balances for assets // TODO REMOVE ASSETS
class NonNativeTokensApi {
  final AppService service;
  final String address;

  NonNativeTokensApi(this.service, this.address);

  Future<List<TokenBalanceData>> process() async {
    final result = <TokenBalanceData>[];

    // final tokensCommonData = await service.plugin.sdk.api.assets.getAssetsAll();
    // final dynamic allTokens = await service.plugin.sdk.api.universal
    //     .callNoSign(second: 'assets', third: 'metadata', args: null);

    final dynamic lol = await service.plugin.sdk.api.universal.callNoSign(
      calls: ['query', 'poscanAssets', 'metadata', 'entries'],
      args: null,
    );

    final d = 1 + 1;
    // final ids = tokensCommonData.map((final e) => e.id ?? '').toList();
    // ids.removeWhere((final element) => element.isEmpty);

    // final balances = await service.plugin.sdk.api.universal
    //     .callNoSign(second: second, third: third, args: args);

    // final balances =
    //     await service.plugin.sdk.api.assets.queryAssetsBalances(ids, address);

    // for (int i = 0; i < tokensCommonData.length; i++) {
    //   final tcd = tokensCommonData[i];
    //   final balanceData = TokenBalanceData(
    //     id: tcd.id,
    //     fullName: tcd.fullName,
    //     name: tcd.name,
    //     symbol: tcd.symbol,
    //     type: tcd.type,
    //     amount: balances[i].balance ?? '0',
    //     decimals: tcd.decimals,
    //   );
    //   result.add(balanceData);
    // }

    // return result;
    return [];
  }

  // Future<void> setTokens() async {
  //   final tokens = await process();
  //   // service.plugin.balances.setTokens(tokens);
  // }
}
