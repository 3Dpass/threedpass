import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:polkawallet_sdk/api/types/txInfoData.dart';

class TransferInfoCubit extends Cubit<TransferInfo> {
  TransferInfoCubit(final double balance)
      : super(TransferInfo(balance: balance, fees: null));

  // Future<void> init(final AppService appService) async {
  //   final params = [
  //     appService.keyring.allWithContacts.first.address,
  //     '10000000000',
  //   ];

  //   final txInfo = TxInfoData(
  //     'balances',
  //     'transferKeepAlive',
  //     TxSenderData(
  //       appService.keyring.current.address,
  //       appService.keyring.current.pubKey,
  //     ),
  //   );

  //   // This line throws error:
  //   // {"path":"log","data":{"call":"uid=8;keyring.txFeeEstimate","error":"t.rpc.payment.queryInfo is not a function"}}
  //   // Firstly there were wring types in dart code.
  //   // I fixed them here: https://github.com/L3odr0id/polkawallet_sdk/commit/ccafe364cb231c7d1888648257f5f3002ebb8b2b
  //   // But it turned out that there is a problem with the JS code deep inside.
  //   final fee = await appService.plugin.sdk.api.tx.estimateFees(txInfo, params);

  //   final b = 1 + 1;
  // }
}

class TransferInfo {
  // Max avaliable balance in wallet in human-readable double format
  final double balance;
  final TxFeeEstimateResult? fees;

  const TransferInfo({
    required this.balance,
    required this.fees,
  });
}
