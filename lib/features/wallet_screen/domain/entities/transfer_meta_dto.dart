import 'package:polkawallet_sdk/api/types/txInfoData.dart';
import 'package:polkawallet_sdk/plugin/store/balances.dart';
import 'package:threedpass/core/polkawallet/app_service.dart';
import 'package:threedpass/core/polkawallet/utils/balance_utils.dart';
import 'package:threedpass/core/polkawallet/utils/network_state_data_extension.dart';
import 'package:threedpass/core/polkawallet/utils/tx_info.dart';

abstract class TransferMetaDTO {
  const TransferMetaDTO();
  MetaInfoType get type;

  String getBalance(final AppService appService) {
    switch (type) {
      case MetaInfoType.asset:
        final metaTyped = this as AssetTransferMetaDTO;
        return BalanceUtils.balance(
          metaTyped.tokenBalanceData.amount,
          metaTyped.tokenBalanceData.decimals ?? 12,
        );

      case MetaInfoType.coin:
        return BalanceUtils.balance(
          appService.balance.value.availableBalance as String?,
          appService.networkStateData.safeDecimals,
        );
    }
  }

  String getName() {
    switch (type) {
      case MetaInfoType.asset:
        final metaTyped = this as AssetTransferMetaDTO;
        return metaTyped.tokenBalanceData.symbol ?? '';

      case MetaInfoType.coin:
        return (this as CoinsTransferMetaDTO).coinName;
    }
  }

  TxInfoData getTxInfo(final AppService appService) {
    switch (type) {
      case MetaInfoType.asset:
        final typed = this as AssetTransferMetaDTO;
        return AssetsTransferTx(
          appService: appService,
          tokenBalanceData: typed.tokenBalanceData,
        ).txInfo;

      case MetaInfoType.coin:
        return CoinsTransferTx(appService: appService).txInfo;
    }
  }

  List<String> getParams(
    final AppService appService,
    final String? amount,
    final String toAddress,
  ) {
    switch (type) {
      case MetaInfoType.asset:
        final typed = this as AssetTransferMetaDTO;
        return AssetsTransferTx(
          appService: appService,
          tokenBalanceData: typed.tokenBalanceData,
        ).params(amount, toAddress);

      case MetaInfoType.coin:
        return CoinsTransferTx(appService: appService)
            .params(amount, toAddress);
    }
  }
}

class CoinsTransferMetaDTO extends TransferMetaDTO {
  final String coinName;

  const CoinsTransferMetaDTO({
    required this.coinName,
  });

  @override
  MetaInfoType get type => MetaInfoType.coin;
}

class AssetTransferMetaDTO extends TransferMetaDTO {
  final TokenBalanceData tokenBalanceData;

  const AssetTransferMetaDTO({
    required this.tokenBalanceData,
  });

  @override
  MetaInfoType get type => MetaInfoType.asset;
}

enum MetaInfoType { asset, coin }
