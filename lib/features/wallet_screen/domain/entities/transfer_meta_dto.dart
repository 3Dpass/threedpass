import 'package:polkawallet_sdk/api/types/txInfoData.dart';
import 'package:polkawallet_sdk/plugin/store/balances.dart';
import 'package:threedpass/core/polkawallet/app_service.dart';
import 'package:threedpass/core/polkawallet/utils/balance_utils.dart';
import 'package:threedpass/core/polkawallet/utils/network_state_data_extension.dart';
import 'package:threedpass/core/polkawallet/utils/transfer_type.dart';
import 'package:threedpass/core/polkawallet/utils/tx_info.dart';

abstract class TransferMetaDTO {
  const TransferMetaDTO();
  MetaInfoType get type;

  double getBalance();
  String getName();
  TxInfoData getTxInfo(final TransferType transferType);

  List<String> getParams(
    final String? amount,
    final String toAddress,
  );
}

class CoinsTransferMetaDTO extends TransferMetaDTO {
  final String coinName;
  final CoinsTransferTx txInfoValue;
  final AppService appService;

  CoinsTransferMetaDTO({
    required this.coinName,
    required this.appService,
  }) : txInfoValue = CoinsTransferTx(
          appService: appService,
        );

  @override
  MetaInfoType get type => MetaInfoType.coin;

  @override
  double getBalance() {
    return BalanceUtils.balanceToDouble(
      appService.chosenAccountBalance.value.availableBalance as String,
      appService.networkStateData.safeDecimals,
    );
  }

  @override
  String getName() {
    return coinName;
  }

  @override
  TxInfoData getTxInfo(final TransferType transferType) {
    return txInfoValue.txInfo(transferType);
  }

  @override
  List<String> getParams(
    final String? amount,
    final String toAddress,
  ) {
    return txInfoValue.params(amount, toAddress);
  }
}

class AssetTransferMetaDTO extends TransferMetaDTO {
  final TokenBalanceData tokenBalanceData;
  final AssetsTransferTx txInfoValue;

  AssetTransferMetaDTO({
    required this.tokenBalanceData,
    required final AppService appService,
  }) : txInfoValue = AssetsTransferTx(
          appService: appService,
          tokenBalanceData: tokenBalanceData,
        );

  @override
  MetaInfoType get type => MetaInfoType.asset;

  @override
  double getBalance() {
    return BalanceUtils.balanceToDouble(
      tokenBalanceData.amount!,
      tokenBalanceData.decimals ?? 12,
    );
  }

  @override
  String getName() {
    return tokenBalanceData.symbol ?? '';
  }

  @override
  TxInfoData getTxInfo(final TransferType transferType) {
    return txInfoValue.txInfo(transferType);
  }

  @override
  List<String> getParams(
    final String? amount,
    final String toAddress,
  ) {
    return txInfoValue.params(amount, toAddress);
  }
}

enum MetaInfoType { asset, coin }
