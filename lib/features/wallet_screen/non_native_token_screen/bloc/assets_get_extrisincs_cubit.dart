import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:logger/logger.dart';
import 'package:polkawallet_sdk/plugin/store/balances.dart';
import 'package:super_core/super_core.dart';
import 'package:threedp_graphql/features/events/domain/events_request_params.dart';
import 'package:threedp_graphql/features/extrinsics/domain/extrisincs_request_params.dart';
import 'package:threedpass/core/polkawallet/utils/extrinsic_status.dart';
import 'package:threedpass/features/wallet_screen/non_native_token_screen/domain/entities/transfer_non_native_token_atom.dart';
import 'package:threedpass/features/wallet_screen/non_native_token_screen/domain/entities/transfer_non_native_tokens_dto.dart';
import 'package:threedpass/features/wallet_screen/non_native_token_screen/domain/usecases/assets_get_extrinsics.dart';
import 'package:threedpass/features/wallet_screen/non_native_token_screen/domain/usecases/get_events_usecase.dart';
import 'package:threedpass/setup.dart';

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

  TokenBalanceData get tokenBalanceData =>
      getExtrinsics.paramsUseCase.tokenBalanceData;

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
          events.when(
            left: (final err) {
              getIt<Logger>().e(err);
            },
            right: (final event) {
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
                      event.isSuccessful,
                    ),
                  ],
                );
              } else {
                getIt<Logger>().wtf(
                  'Block ${item.blockNumber} with id ${item.extrinsicIdx} and status ${item.extrisincStatus} was not found in list. I do not understand why is this possible?! Somehow it throws errors...',
                );
              }
              pagingController.itemList = list;
              // pagingController.notifyListeners();
              // print('${item.blockDatetime} ${item.runtimeType}');
            },
          );
        }
      }
    } else {
      getIt<Logger>().wtf(
        'AssetsGetExtrinsicsCubit pagingController.itemList is null. This situation is impossible. If you see this in the console, something really bad happens.',
      );
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
    unawaited(update());
  }
}
