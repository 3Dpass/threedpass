import 'package:threedpass/core/polkawallet/app_service.dart';
import 'package:threedpass/core/polkawallet/utils/balance_utils.dart';
import 'package:threedpass/core/polkawallet/utils/find_token_symbol.dart';
import 'package:threedpass/core/polkawallet/utils/network_state_data_extension.dart';

abstract class TransferMetaDTO {
  const TransferMetaDTO();
  MetaInfoType get type;

  String getBalance(final AppService appService) {
    switch (type) {
      case MetaInfoType.asset:
        final metaTyped = this as AssetTransferMetaDTO;
        final tbd = appService.findTokenBalanceData(metaTyped.assetID);
        return BalanceUtils.balance(
          tbd.amount,
          tbd.decimals ?? 12,
        );

      case MetaInfoType.coin:
        return BalanceUtils.balance(
          appService.balance.value.availableBalance as String?,
          appService.networkStateData.safeDecimals,
        );
      // return BalanceUtils.bigIntToDouble(
      //   BalanceUtils.balanceInt(
      //     appService.balance.value.availableBalance as String?,
      //   ),
      //   appService.networkStateData.safeDecimals,
      // );
    }
  }

  String getName() {
    switch (type) {
      case MetaInfoType.asset:
        return (this as AssetTransferMetaDTO).assetName;

      case MetaInfoType.coin:
        return (this as CoinsTransferMetaDTO).coinName;
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
  final String assetName;
  final String assetID;

  const AssetTransferMetaDTO({
    required this.assetID,
    required this.assetName,
  });

  @override
  MetaInfoType get type => MetaInfoType.asset;
}

enum MetaInfoType { asset, coin }
