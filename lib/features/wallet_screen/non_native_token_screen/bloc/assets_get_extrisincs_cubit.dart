import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:threedpass/core/polkawallet/utils/extrinsic_status.dart';
import 'package:threedpass/core/utils/logger.dart';
import 'package:threedpass/features/graphql/events/domain/events_request_params.dart';
import 'package:threedpass/features/graphql/extrinsics/domain/extrisincs_request_params.dart';
import 'package:threedpass/features/poscan_assets/domain/entities/poscan_asset_combined.dart';
import 'package:threedpass/features/wallet_screen/non_native_token_screen/domain/entities/transfer_non_native_token_atom.dart';
import 'package:threedpass/features/wallet_screen/non_native_token_screen/domain/entities/transfer_non_native_tokens_dto.dart';
import 'package:threedpass/features/wallet_screen/non_native_token_screen/domain/usecases/assets_get_extrinsics.dart';
import 'package:threedpass/features/wallet_screen/non_native_token_screen/domain/usecases/get_events_usecase.dart';

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

  PoscanAssetCombined get poscanAssetCombined =>
      getExtrinsics.paramsUseCase.poscanAssetCombined;

  Future<void> update() async {
    if (pagingController.itemList != null) {
      for (final item in pagingController.itemList!) {
        // await Future.delayed(Duration(seconds: 2));
        if (item.extrisincStatus == ExtrinsicStatus.loading ||
            item.extrisincStatus == ExtrinsicStatus.error) {
          final events = await getEvents(
            GetEventsParams(
              pageKey: '1',
              blockNumber: item.blockNumber,
              extrinsicIdx: item.extrinsicIdx,
            ),
          );

          final list = pagingController.itemList!;
          final index = list.indexOf(item);
          if (index != -1) {
            // print(index);
            // print(list.length);
            list.replaceRange(
              index,
              index + 1,
              [
                item.ultimateCopyWith(
                  events.isSuccessful,
                ),
              ],
            );
          } else {
            logger.wtf(
              'Block ${item.blockNumber} with id ${item.extrinsicIdx} and status ${item.extrisincStatus} was not found in list. I do not understand why is this possible?! Somehow it throws errors...',
            );
          }
          pagingController.itemList = list;
          // pagingController.notifyListeners();
          // print('${item.blockDatetime} ${item.runtimeType}');
        }
      }
    } else {
      logger.wtf(
        'AssetsGetExtrinsicsCubit pagingController.itemList is null. This situation is impossible. If you see this in the console, something really bad happens.',
      );
    }
  }

  /// Override this method and call proper UseCase.
  Future<TransfersNonNativeTokenDTO> getData(
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
    try {
      final data = await getData(pageKey);
      if (data.objects.isEmpty) {
        pagingController.appendLastPage(data.objects);
      } else {
        pagingController.appendPage(data.objects, data.nextPageKey);
      }
    } on Object catch (e) {
      pagingController.error = e;
    }

    unawaited(update());
  }
}
