import 'package:threedpass/core/chains/domain/entities/address.dart';
import 'package:threedpass/core/chains/domain/entities/display_account.dart';
import 'package:threedpass/core/chains/domain/usecases/resolve_name_by_address.dart';
import 'package:threedpass/core/polkawallet/utils/datetime_from_block_number.dart';
import 'package:threedpass/core/usecase.dart';
import 'package:threedpass/features/atomic_swap/basic/domain/enitites/basic_pending_atomic_swap_data.dart';
import 'package:threedpass/features/atomic_swap/poscan/common/data/poscan_atomic_swap_repository.dart';

class GetPendingPoscanAtomicSwap
    extends UseCase<List<BasicPendingAtomicSwapData>, Address> {
  final PoscanAtomicSwapRepository poscanAtomicSwapRepository;
  final ResolveNameByAddress resolveNameByAddress;

  const GetPendingPoscanAtomicSwap({
    required this.poscanAtomicSwapRepository,
    required this.resolveNameByAddress,
  });

  @override
  Future<List<BasicPendingAtomicSwapData>> call(Address param) async {
    final rawData =
        await poscanAtomicSwapRepository.pendingSwaps(address: param);
    return Future.wait(
      rawData.map(
        (final e) async => BasicPendingAtomicSwapData(
          from: DisplayAccount(
            address: e.source,
            name: await resolveNameByAddress(e.source),
          ),
          to: DisplayAccount(
            address: param,
            name: await resolveNameByAddress(param),
          ),
          deadline: dateTimeFromBlockNumber(e.endBlock),
        ),
      ),
    );
  }
}
