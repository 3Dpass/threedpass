import 'package:threedpass/core/chains/domain/entities/display_account.dart';

class BasicPendingAtomicSwapData {
  final DisplayAccount from;
  final DisplayAccount to;
  final DateTime deadline;

  const BasicPendingAtomicSwapData({
    required this.from,
    required this.to,
    required this.deadline,
  });
}
