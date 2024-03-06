// import 'package:flutter_test/flutter_test.dart';
// import 'package:threedpass/core/polkawallet/utils/extrinsic_status.dart';
// import 'package:threedpass/core/polkawallet/utils/tx_update_event_logs_handler.dart';

// void main() {
//   group('TxUpdateLogsHandler gets extrinsic message', () {
//     final inputStrings = [
//       '{"path":"onStatusChange11","data":"Ready"}',
//       '{"path":"onStatusChange11","data":"Broadcast"}',
//       '{"path":"txUpdateEvent|msgId=onStatusChange11","data":{"title":"balances.Withdraw","message":"ok"}}',
//       '{"path":"txUpdateEvent|msgId=onStatusChange11","data":{"title":"transactionPayment.TransactionFeePaid","message":"ok"}}',
//       '{"path":"uid=12;keyring.sendTx","data":{"hash":"0x8fe6ad176e277a03a90ea5db0361635bddc669a14d8d72e74269575836750777","blockHash":"0x99d3a3b6f9df21925e63fdb5988d901d67e3fa9b8f2c2c9ae62b9bd24e01cb6a"}}',
//     ];

//     for (final input in inputStrings) {
//       test('false input № ${inputStrings.indexOf(input)}', () {
//         bool res = false;

//         TxUpdateEventLogsHandler('onStatusChange11', ({
//           required final String? message,
//           required final ExtrinsicStatus status,
//         }) {
//           res = true;
//         }).handle(input);

//         expect(res, false);
//       });
//     }

//     test('ExtrinsicSuccess OK', () {
//       const input =
//           '{"path":"txUpdateEvent|msgId=onStatusChange11","data":{"title":"system.ExtrinsicSuccess","message":"ok"}}';

//       String res = '';

//       TxUpdateEventLogsHandler('onStatusChange11', ({
//         required final String? message,
//         required final ExtrinsicStatus status,
//       }) {
//         res = message ?? '';
//       }).handle(input);

//       expect(res, TxUpdateEventLogsHandler.extrinsicSuccess);
//     });

//     test('ExtrinsicFailed + MSG', () {
//       const input =
//           '{"path":"txUpdateEvent|msgId=onStatusChange23","data":{"title":"system.ExtrinsicFailed","message":"balances.InsufficientBalance"}}';

//       String res = '';

//       TxUpdateEventLogsHandler('onStatusChange23', ({
//         required final String? message,
//         required final ExtrinsicStatus status,
//       }) {
//         res = message ?? '';
//       }).handle(input);

//       expect(res, 'balances.InsufficientBalance');
//     });
//   });
// }
