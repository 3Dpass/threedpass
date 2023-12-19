import 'package:threedpass/core/polkawallet/utils/extrinsic_status.dart';

class TransferHistoryUI {
  const TransferHistoryUI({
    required this.amount,
    required this.blockDateTime,
    required this.fromAddress,
    required this.direction,
    required this.symbols,
    required this.toAddress,
    required this.extrisincStatus,
    required this.decimals,
  });

  final String amount;
  final String symbols;
  final String fromAddress;
  final String toAddress;

  /// It says assets were send FROM this TO another
  final TransferDirection direction;

  final int decimals;

  final DateTime? blockDateTime;
  final ExtrisincStatus? extrisincStatus;
}

enum TransferDirection { from, to, all }
