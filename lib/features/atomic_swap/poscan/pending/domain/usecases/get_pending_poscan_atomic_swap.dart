import 'package:threedpass/core/chains/domain/entities/address.dart';
import 'package:threedpass/core/polkawallet/utils/datetime_from_block_number.dart';
import 'package:threedpass/core/usecase.dart';
import 'package:threedpass/features/atomic_swap/poscan/common/data/poscan_atomic_swap_repository.dart';
import 'package:threedpass/features/atomic_swap/poscan/pending/domain/entities/pending_poscan_atomic_swap.dart';

class GetPendingPoscanAtomicSwap
    extends UseCase<List<PendingPoscanAtomicSwap>, Address> {
  final PoscanAtomicSwapRepository poscanAtomicSwapRepository;

  const GetPendingPoscanAtomicSwap({
    required this.poscanAtomicSwapRepository,
  });

  @override
  Future<List<PendingPoscanAtomicSwap>> call(Address param) async {
    final rawData =
        await poscanAtomicSwapRepository.pendingSwaps(address: param);
    return Future.wait(
      rawData.map(
        (final e) async => PendingPoscanAtomicSwap(
          from: e.source,
          to: param,
          action: e.action,
          deadline: dateTimeFromBlockNumber(e.endBlock),
        ),
      ),
    );
  }
}
