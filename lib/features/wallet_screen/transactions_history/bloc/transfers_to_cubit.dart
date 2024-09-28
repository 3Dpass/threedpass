import 'package:threedpass/features/graphql/transfers_history/domain/entities/transfers_request_params.dart';
import 'package:threedpass/features/wallet_screen/transactions_history/bloc/get_transfers_cubit.dart';
import 'package:threedpass/features/wallet_screen/transactions_history/domain/entities/transfers_dto.dart';
import 'package:threedpass/features/wallet_screen/transactions_history/domain/usecases/get_transfers.dart';

class TransfersToCubit extends GetTransfersCubit {
  TransfersToCubit({
    required this.toMultiAddressAccountId,
    required this.getTransfers,
  });

  final String toMultiAddressAccountId;
  final GetTransfers getTransfers;

  @override
  Future<TransfersDTO> getData(final String pageKey) {
    return getTransfers(
      GetTransfersParams(
        pageKey: pageKey,
        toMultiAddressAccountId: toMultiAddressAccountId,
      ),
    );
  }
}
