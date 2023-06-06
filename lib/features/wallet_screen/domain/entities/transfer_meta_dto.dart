import 'package:polkawallet_sdk/api/types/txInfoData.dart';
import 'package:polkawallet_sdk/plugin/store/balances.dart';
import 'package:threedpass/core/polkawallet/app_service.dart';
import 'package:threedpass/core/polkawallet/utils/balance_utils.dart';
import 'package:threedpass/core/polkawallet/utils/network_state_data_extension.dart';
import 'package:threedpass/core/polkawallet/utils/tx_info.dart';

abstract class TransferMetaDTO {
  const TransferMetaDTO();
  MetaInfoType get type;

  String getBalance(final AppService appService);
  String getName();
  TxInfoData getTxInfo(final AppService appService);
  List<String> getParams(
    final AppService appService,
    final String? amount,
    final String toAddress,
  );
}

class CoinsTransferMetaDTO extends TransferMetaDTO {
  final String coinName;

  const CoinsTransferMetaDTO({
    required this.coinName,
  });

  @override
  MetaInfoType get type => MetaInfoType.coin;

  @override
  String getBalance(final AppService appService) {
    return BalanceUtils.balance(
      appService.balance.value.availableBalance as String?,
      appService.networkStateData.safeDecimals,
    );
  }

  @override
  String getName() {
    return coinName;
  }

  @override
  TxInfoData getTxInfo(final AppService appService) {
    return CoinsTransferTx(appService: appService).txInfo;
  }

  @override
  List<String> getParams(
    final AppService appService,
    final String? amount,
    final String toAddress,
  ) {
    return CoinsTransferTx(appService: appService).params(amount, toAddress);
  }
}

class AssetTransferMetaDTO extends TransferMetaDTO {
  final TokenBalanceData tokenBalanceData;

  const AssetTransferMetaDTO({
    required this.tokenBalanceData,
  });

  @override
  MetaInfoType get type => MetaInfoType.asset;

  @override
  String getBalance(final AppService appService) {
    return BalanceUtils.balance(
      tokenBalanceData.amount,
      tokenBalanceData.decimals ?? 12,
    );
  }

  @override
  String getName() {
    return tokenBalanceData.symbol ?? '';
  }

  @override
  TxInfoData getTxInfo(final AppService appService) {
    return AssetsTransferTx(
      appService: appService,
      tokenBalanceData: tokenBalanceData,
    ).txInfo;
  }

  @override
  List<String> getParams(
    final AppService appService,
    final String? amount,
    final String toAddress,
  ) {
    return AssetsTransferTx(
      appService: appService,
      tokenBalanceData: tokenBalanceData,
    ).params(amount, toAddress);
  }
}

enum MetaInfoType { asset, coin }
