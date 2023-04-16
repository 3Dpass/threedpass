import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:super_core/super_core.dart';
import 'package:threedp_graphql/features/extrinsics/domain/extrisincs_request_params.dart';
import 'package:threedpass/features/wallet_screen/domain/entities/transfer_history_ui.dart';
import 'package:threedpass/features/wallet_screen/presentation/non_native_token_screen/domain/entities/asset_history_transfer.dart';
import 'package:threedpass/features/wallet_screen/presentation/non_native_token_screen/domain/entities/transfer_non_native_token_atom.dart';
import 'package:threedpass/features/wallet_screen/presentation/non_native_token_screen/domain/entities/transfer_non_native_tokens_dto.dart';
import 'package:threedpass/features/wallet_screen/presentation/non_native_token_screen/domain/usecases/assets_get_extrinsics.dart';
import 'package:threedpass/features/wallet_screen/presentation/non_native_token_screen/domain/usecases/get_events_usecase.dart';

class AssetsGetExtrinsicsCubit extends Cubit<void> {
  AssetsGetExtrinsicsCubit({
    required this.getExtrinsics,
    required this.getEvents,
  }) : super(null) {
    pagingController = PagingController(firstPageKey: '1')
      ..addPageRequestListener((final String pageKey) {
        nextPage(pageKey);
      });
  }

  late final PagingController<String, NonNativeTokenHistoryAtomBase>
      pagingController;
  final AssetsGetExtrinsics getExtrinsics;
  final GetEventsUseCase getEvents;

  Future<void> update() async {
    for (var item in pagingController.itemList!.reversed) {
      await Future.delayed(Duration(seconds: 2));
      final list = pagingController.itemList!;
      var index = list.indexOf(item);
      list.replaceRange(
        index,
        index + 1,
        [
          item.ultimateCopyWith(ExtrisincStatus.loaded),
        ],
      );
      pagingController.itemList = list;
      pagingController.notifyListeners();
      print('${item.blockDatetime} ${item.runtimeType}');
    }
  }

  /// Override this method and call proper UseCase.
  Future<Either<Failure, TransfersNonNativeTokenDTO>> getData(
    final String pageKey,
  ) {
    return getExtrinsics.call(
      GetExtrisincsParams(
        pageKey: pageKey,
        callModule: 'Assets',
      ),
    );
  }

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
    update();
  }
}
