import 'package:threedpass/core/chains/domain/entities/address.dart';
import 'package:threedpass/core/chains/domain/entities/hex_ex.dart';

class BasicPendingAtomicSwapData {
  final Address from;
  final Address to;
  final String decodedTo;
  final HexEx hashProof;
  final DateTime deadline;

  const BasicPendingAtomicSwapData({
    required this.from,
    required this.to,
    required this.decodedTo,
    required this.hashProof,
    required this.deadline,
  });
}
