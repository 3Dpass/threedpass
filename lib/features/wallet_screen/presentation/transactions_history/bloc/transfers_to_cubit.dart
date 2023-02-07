import 'package:threedpass/core/utils/either.dart';
import 'package:threedpass/core/utils/failure.dart';
import 'package:threedpass/features/wallet_screen/presentation/transactions_history/bloc/get_transfers_cubit.dart';
import 'package:threedpass/features/wallet_screen/presentation/transactions_history/domain/entities/transfers_dto.dart';
import 'package:threedpass/features/wallet_screen/presentation/transactions_history/domain/entities/transfers_request_params.dart';
import 'package:threedpass/features/wallet_screen/presentation/transactions_history/domain/usecases/get_transfers.dart';

class TransfersToCubit extends GetTransfersCubit {
  TransfersToCubit({
    required final this.toMultiAddressAccountId,
    required this.getTransfers,
  });

  final String toMultiAddressAccountId;
  final GetTransfers getTransfers;

  @override
  Future<Either<Failure, TransfersDTO>> getData(final String pageKey) {
    return getTransfers(GetTransfersParams(
      pageKey: pageKey,
      toMultiAddressAccountId: toMultiAddressAccountId,
    ));
  }
}
