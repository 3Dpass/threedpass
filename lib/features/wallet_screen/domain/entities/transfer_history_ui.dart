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

  /// Its says assets were send FROM this TO another
  final TransferDirection direction;

  final int decimals;

  final DateTime? blockDateTime;
  final ExtrisincStatus? extrisincStatus;
}

enum ExtrisincStatus { error, loading, success, failed }

enum TransferDirection { from, to, all }
