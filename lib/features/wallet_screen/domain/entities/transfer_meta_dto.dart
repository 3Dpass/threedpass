import 'package:polkawallet_sdk/plugin/store/balances.dart';

abstract class TransferMetaDTO {
  const TransferMetaDTO({
    required this.decimals,
    required this.name,
  });

  final int decimals;
  final String name;

  MetaInfoType get type;
}

class CoinsTransferMetaDTO extends TransferMetaDTO {
  const CoinsTransferMetaDTO({
    required super.name,
    required super.decimals,
  });

  @override
  final MetaInfoType type = MetaInfoType.coin;
}

class AssetTransferMetaDTO extends TransferMetaDTO {
  const AssetTransferMetaDTO({
    required super.name,
    required super.decimals,
    required this.tokenBalanceData,
  });

  final TokenBalanceData tokenBalanceData;

  @override
  final MetaInfoType type = MetaInfoType.asset;
}

// class CoinsTransferMetaDTO extends TransferMetaDTO {
//   final String coinName;
//   final CoinsTransferTx txInfoValue;
//   final AppService appService;

//   CoinsTransferMetaDTO({
//     required this.coinName,
//     required this.appService,
//   }) : txInfoValue = CoinsTransferTx(
//           appService: appService,
//         );

//   @override
//   MetaInfoType get type => MetaInfoType.coin;

//   @override
//   double getBalance() {
//     appService.plugin.sdk.api.account.queryBalance(address)
//     return BalanceUtils.balanceToDouble(
//       appService.chosenAccountBalance.value.availableBalance as String,
//       appService.networkStateData.safeDecimals,
//     );
//   }

//   @override
//   int get decimals => appService.networkStateData.safeDecimals;

//   @override
//   String getName() {
//     return coinName;
//   }

//   @override
//   TxInfoData getTxInfo(final TransferType transferType) {
//     return txInfoValue.txInfo(transferType);
//   }

//   @override
//   List<String> getParams(
//     final String? amount,
//     final String toAddress,
//   ) {
//     return txInfoValue.params(amount, toAddress);
//   }
// }

// class AssetTransferMetaDTO extends TransferMetaDTO {
//   final TokenBalanceData tokenBalanceData;
//   final AssetsTransferTx txInfoValue;

//   AssetTransferMetaDTO({
//     required this.tokenBalanceData,
//     required final AppService appService,
//   }) : txInfoValue = AssetsTransferTx(
//           appService: appService,
//           tokenBalanceData: tokenBalanceData,
//         );

//   @override
//   MetaInfoType get type => MetaInfoType.asset;

//   @override
//   double getBalance() {
//     return BalanceUtils.balanceToDouble(
//       tokenBalanceData.amount!,
//       tokenBalanceData.decimals ?? 12,
//     );
//   }

//   @override
//   String getName() {
//     return tokenBalanceData.symbol ?? '';
//   }

//   @override
//   TxInfoData getTxInfo(final TransferType transferType) {
//     return txInfoValue.txInfo(transferType);
//   }

//   @override
//   int get decimals => tokenBalanceData.decimals ?? 12;

//   @override
//   List<String> getParams(
//     final String? amount,
//     final String toAddress,
//   ) {
//     return txInfoValue.params(amount, toAddress);
//   }
// }

enum MetaInfoType { asset, coin }
