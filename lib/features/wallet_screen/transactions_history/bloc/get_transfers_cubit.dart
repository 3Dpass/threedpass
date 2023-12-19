import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:super_core/super_core.dart';
import 'package:threedpass/features/wallet_screen/transactions_history/domain/entities/transfer_item.dart';
import 'package:threedpass/features/wallet_screen/transactions_history/domain/entities/transfers_dto.dart';

abstract class GetTransfersCubit extends Cubit<void> {
  GetTransfersCubit() : super(null) {
    pagingController = PagingController(firstPageKey: '1')
      ..addPageRequestListener((final String pageKey) {
        nextPage(pageKey);
      });
  }

  late final PagingController<String, TransferItem> pagingController;

  /// Override this method and call proper UseCase.
  Future<Either<Failure, TransfersDTO>> getData(final String pageKey);

  Future<void> nextPage(
    final String pageKey,
  ) async {
    final queryRes = await getData(pageKey);
    queryRes.when(
      left: (final e) {
        pagingController.error = e;
        // final b = 1 + 1;
      },
      right: (final data) {
        if (data.objects.isEmpty) {
          pagingController.appendLastPage(data.objects);
        } else {
          pagingController.appendPage(data.objects, data.nextPageKey);
        }
      },
    );
  }
}
