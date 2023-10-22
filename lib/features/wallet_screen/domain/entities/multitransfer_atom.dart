import 'package:polkawallet_sdk/api/types/txInfoData.dart';
import 'package:polkawallet_sdk/storage/types/keyPairData.dart';
import 'package:threedpass/core/polkawallet/utils/balance_utils.dart';
import 'package:threedpass/core/polkawallet/utils/transfer_type.dart';

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

class MultitransferAtomCoins extends TransferTxInfoI {
  // txinfo
  final String senderAddress;
  final String senderPubKey;
  final TransactionOption transferType;
  final String module = 'balances';
  final int decimals;

  // params
  final String toAddress;
  final double amount;

  TxInfoData txInfo(
    final TransactionOption transferType,
  ) =>
      TxInfoData(
        'balances',
        TransferTypeValue(transferType).toString(),
        TxSenderData(
          senderAddress,
          senderPubKey,
        ),
      );

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
