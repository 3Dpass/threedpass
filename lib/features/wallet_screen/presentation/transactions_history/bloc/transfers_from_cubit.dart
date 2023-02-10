import 'package:super_core/super_core.dart';
import 'package:threedp_graphql/features/transfers_history/domain/entities/transfers_request_params.dart';
import 'package:threedpass/features/wallet_screen/presentation/transactions_history/bloc/get_transfers_cubit.dart';
import 'package:threedpass/features/wallet_screen/presentation/transactions_history/domain/entities/transfers_dto.dart';
import 'package:threedpass/features/wallet_screen/presentation/transactions_history/domain/usecases/get_transfers.dart';

class TransfersFromCubit extends GetTransfersCubit {
  TransfersFromCubit({
    required this.fromMultiAddressAccountId,
    required this.getTransfers,
  });

  final String fromMultiAddressAccountId;
  final GetTransfers getTransfers;

  @override
  Future<Either<Failure, TransfersDTO>> getData(final String pageKey) {
    return getTransfers(
      GetTransfersParams(
        pageKey: pageKey,
        fromMultiAddressAccountId: fromMultiAddressAccountId,
      ),
    );
  }
}
