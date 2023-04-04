class TransferHistoryUI {
  const TransferHistoryUI({
    required this.amount,
    required this.blockDateTime,
    required this.fromAddress,
    required this.isFrom,
    required this.symbols,
    required this.toAddress,
    required this.extrisincStatus,
  });

  final String amount;
  final String symbols;
  final String fromAddress;
  final String toAddress;

  /// This item is about fact that tokens were send FROM THIS account TO ANOTHER
  final bool isFrom;

  final DateTime blockDateTime;
  final ExtrisincStatus? extrisincStatus;
}

enum ExtrisincStatus { none, loading, loaded }
