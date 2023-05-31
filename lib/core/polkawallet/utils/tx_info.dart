import 'package:logger/logger.dart';
import 'package:polkawallet_sdk/api/types/txInfoData.dart';
import 'package:polkawallet_sdk/plugin/store/balances.dart';
import 'package:threedpass/core/polkawallet/app_service.dart';
import 'package:threedpass/core/polkawallet/utils/balance_utils.dart';
import 'package:threedpass/core/polkawallet/utils/network_state_data_extension.dart';
import 'package:threedpass/setup.dart';

abstract class TransferTxInfoI {
  final AppService appService;

  const TransferTxInfoI({
    required this.appService,
  });

  TxInfoData get txInfo;
  List<String> params(final String? amount, final String toAddress);
}

class AssetsTransferTx extends TransferTxInfoI {
  final TokenBalanceData tokenBalanceData;
  const AssetsTransferTx({
    required super.appService,
    required this.tokenBalanceData,
  });

  @override
  TxInfoData get txInfo => TxInfoData(
        'assets',
        'transfer',
        appService.userSenderData,
      );

  @override
  List<String> params(final String? amount, final String toAddress) {
    // https://polkadot.js.org/docs/substrate/extrinsics/#transferid-compactu32-target-multiaddress-amount-compactu128

    if (tokenBalanceData.decimals == null) {
      getIt<Logger>().w(
        'DANGER! tokenBalanceData.decimals is null when get params for AssetsTransferTx.',
      );
    }

    final realAmount = BalanceUtils.tokenInt(
      amount,
      tokenBalanceData.decimals ?? appService.networkStateData.safeDecimals,
    );

    if (tokenBalanceData.id == null) {
      throw Exception('TokenBalanceData.id is null');
    }

    return [
      tokenBalanceData.id!,
      // params.to
      toAddress,
      // params.amount
      realAmount.toString(),
    ];
  }
}

class CoinsTransferTx extends TransferTxInfoI {
  const CoinsTransferTx({required super.appService});

  @override
  TxInfoData get txInfo => TxInfoData(
        'balances',
        'transfer',
        TxSenderData(
          appService.keyring.current.address,
          appService.keyring.current.pubKey,
        ),
      );

  @override
  List<String> params(final String? amount, final String toAddress) {
    final realAmount = BalanceUtils.tokenInt(
      amount,
      appService.networkStateData.safeDecimals,
    );

    return [
      // params.to
      toAddress,
      // params.amount
      realAmount.toString(),
    ];
  }
}
