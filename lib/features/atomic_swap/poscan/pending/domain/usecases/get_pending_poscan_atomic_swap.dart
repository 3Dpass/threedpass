import 'package:threedpass/core/chains/domain/entities/hex_ex.dart';
import 'package:threedpass/core/chains/domain/usecases/encode_address.dart';
import 'package:threedpass/core/polkawallet/utils/datetime_from_block_number.dart';
import 'package:threedpass/core/usecase.dart';
import 'package:threedpass/features/atomic_swap/poscan/common/data/poscan_atomic_swap_repository.dart';
import 'package:threedpass/features/atomic_swap/poscan/pending/domain/entities/pending_poscan_atomic_swap.dart';

class GetPendingPoscanAtomicSwap
    extends UseCase<List<PendingPoscanAtomicSwap>, void> {
  final PoscanAtomicSwapRepository poscanAtomicSwapRepository;
  final EncodeAddress encodeAddress;

  const GetPendingPoscanAtomicSwap({
    required this.poscanAtomicSwapRepository,
    required this.encodeAddress,
  });

  @override
  Future<List<PendingPoscanAtomicSwap>> call(final void _) async {
    final rawData = await poscanAtomicSwapRepository.pendingSwaps();
    return Future.wait(
      rawData.map(
        (final e) async => PendingPoscanAtomicSwap(
          from: e.source,
          to: await encodeAddress(e.keyHash.substring(82, 146)),
          decodedTo: e.keyHash.substring(82, 146),
          hashProof: HexEx(noPrefixValue: e.keyHash.substring(178, 242)),
          deadline: dateTimeFromBlockNumber(e.endBlock),
          action: e.action,
        ),
      ),
    );
  }
}
