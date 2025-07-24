import 'package:threedpass/core/chains/domain/entities/address.dart';

class BasicPendingAtomicSwapData {
  final Address from;
  final Address to;
  final DateTime deadline;

  const BasicPendingAtomicSwapData({
    required this.from,
    required this.to,
    required this.deadline,
  });
}
