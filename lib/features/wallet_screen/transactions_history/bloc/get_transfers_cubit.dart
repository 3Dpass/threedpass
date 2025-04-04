import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:threedpass/features/wallet_screen/transactions_history/domain/entities/transfer_item.dart';
import 'package:threedpass/features/wallet_screen/transactions_history/domain/entities/transfers_dto.dart';

abstract class GetTransfersCubit extends Cubit<void> {
  GetTransfersCubit() : super(null) {
    pagingController = PagingController(firstPageKey: '1')
      ..addPageRequestListener((final String pageKey) async {
        await nextPage(pageKey);
      });
  }

  late final PagingController<String, TransferItem> pagingController;

  /// Override this method and call proper UseCase.
  Future<TransfersDTO> getData(final String pageKey);

  Future<void> nextPage(
    final String pageKey,
  ) async {
    try {
      final data = await getData(pageKey);
      if (data.objects.isEmpty) {
        pagingController.appendLastPage(data.objects);
      } else {
        pagingController.appendPage(data.objects, data.nextPageKey);
      }
    } on Object catch (e, _) {
      pagingController.error = e;
    }
  }
}
