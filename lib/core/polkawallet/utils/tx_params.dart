// import 'package:polkawallet_sdk/plugin/store/balances.dart';
// import 'package:threedpass/core/polkawallet/utils/balance_utils.dart';

// abstract class TxParams {
//   const TxParams();

//   List<String> paramsToSend();
//   String get toAddress;
//   double get amount;

//   TxParamsType get type;
// }

// class CoinsTxParams extends TxParams {
//   const CoinsTxParams({
//     required this.amount,
//     required this.decimals,
//     required this.toAddress,
//   });

//   @override
//   final double amount;
//   final int decimals;
//   @override
//   final String toAddress;

//   @override
//   List<String> paramsToSend() {
//     final realAmount = BalanceUtils.tokenInt(
//       amount.toString(),
//       decimals,
//     );

//     return [
//       // params.to
//       toAddress,
//       // params.amount
//       realAmount.toString(),
//     ];
//   }

//   @override
//   TxParamsType get type => TxParamsType.coins;
// }

// class AssetsTxParams extends TxParams {
//   const AssetsTxParams({
//     required this.amount,
//     required this.toAddress,
//     required this.tokenBalanceData,
//   });

//   final TokenBalanceData tokenBalanceData;
//   @override
//   final double amount;
//   @override
//   final String toAddress;

//   @override
//   List<String> paramsToSend() {
//     // https://polkadot.js.org/docs/substrate/extrinsics/#transferid-compactu32-target-multiaddress-amount-compactu128
//     final realAmount = BalanceUtils.tokenInt(
//       amount.toString(),
//       tokenBalanceData.decimals ?? 0,
//     );

//     if (tokenBalanceData.id == null) {
//       throw Exception('TokenBalanceData.id is null');
//     }

//     return [
//       tokenBalanceData.id!,
//       // params.to
//       toAddress,
//       // params.amount
//       realAmount.toString(),
//     ];
//   }

//   @override
//   TxParamsType get type => TxParamsType.assets;
// }

// enum TxParamsType { coins, assets }
