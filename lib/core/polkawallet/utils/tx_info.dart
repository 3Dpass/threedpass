import 'package:logger/logger.dart';
import 'package:polkawallet_sdk/api/types/txInfoData.dart';
import 'package:polkawallet_sdk/plugin/store/balances.dart';
import 'package:polkawallet_sdk/storage/types/keyPairData.dart';
import 'package:threedpass/core/polkawallet/utils/balance_utils.dart';
import 'package:threedpass/core/polkawallet/utils/transfer_type.dart';
import 'package:threedpass/setup.dart';

abstract class TransferTxInfoI {
  final KeyPairData senderData;
  final int decimals;

  const TransferTxInfoI({
    required this.decimals,
    required this.senderData,
  });

  TxInfoData txInfo(
    final TransactionOption transferType,
  );
  List<String> params(final String? amount, final String toAddress);
}

class AssetsTransferTx extends TransferTxInfoI {
  final TokenBalanceData tokenBalanceData;
  const AssetsTransferTx({
    required super.decimals,
    required super.senderData,
    required this.tokenBalanceData,
  });

  @override
  TxInfoData txInfo(
    final TransactionOption transferType,
  ) =>
      TxInfoData(
        'assets',
        TransferTypeValue(transferType).toString(),
        TxSenderData(senderData.address, senderData.pubKey),
      );

  @override
  List<String> params(
    final String? amount,
    final String toAddress,
  ) {
    // https://polkadot.js.org/docs/substrate/extrinsics/#transferid-compactu32-target-multiaddress-amount-compactu128

    if (tokenBalanceData.decimals == null) {
      getIt<Logger>().w(
        'DANGER! tokenBalanceData.decimals is null when get params for AssetsTransferTx.',
      );
    }

    final realAmount = BalanceUtils.tokenInt(
      amount,
      tokenBalanceData.decimals ?? decimals,
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
  const CoinsTransferTx({
    required super.decimals,
    required super.senderData,
  });

  @override
  TxInfoData txInfo(
    final TransactionOption transferType,
  ) =>
      TxInfoData(
        'balances',
        TransferTypeValue(transferType).toString(),
        TxSenderData(
          senderData.address,
          senderData.pubKey,
        ),
      );

  @override
  List<String> params(
    final String? amount,
    final String toAddress,
  ) {
    final realAmount = BalanceUtils.tokenInt(
      amount,
      decimals,
    );

    return [
      // params.to
      toAddress,
      // params.amount
      realAmount.toString(),
    ];
  }
}
