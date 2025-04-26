import 'package:queue/queue.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:threedpass/core/utils/async_value.dart';
import 'package:threedpass/core/utils/logger.dart';
import 'package:threedpass/features/asset_conversion/domain/entities/basic_pool_entity.dart';
import 'package:threedpass/features/asset_conversion/domain/entities/pool_full_info.dart';
import 'package:threedpass/features/asset_conversion/domain/use_cases/get_basic_pools.dart';
import 'package:threedpass/features/asset_conversion/domain/use_cases/get_full_pool_info.dart';

typedef PoolsState = AsyncValue<_State>;

class _State {
  final List<PoolFullInfo> pools;

  const _State({
    required this.pools,
  });
}

class PoolsCubit extends Cubit<PoolsState> {
  PoolsCubit({
    required this.getAllPools,
    required this.getFullPoolInfo,
  }) : super(
          const AsyncValue.loading(
            _State(
              pools: [],
            ),
          ),
        );

  final GetBasicPools getAllPools;
  final GetFullPoolInfo getFullPoolInfo;
  Queue _queue = Queue(parallel: 5);

  void killQueue() {
    _queue.cancel();
    _queue.dispose();
    _queue = Queue(parallel: 5);
  }

  bool updating = false;

  Future<void> update({required final String address}) async {
    if (updating) {
      Fluttertoast.showToast(
        msg: 'Already updating pools',
        toastLength: Toast.LENGTH_SHORT,
      );
      return;
    }
    updating = true;
    logger.t('[POOLS] Start pools update');

    await getAllPools.safeCall(
      params: null,
      onError: (final e, final stackTrace) => emit(
        AsyncValue.error(
          e,
          stackTrace,
        ),
      ),
      onSuccess: (final List<BasicPoolEntity> data) {
        logger.t('[POOLS] Got basic pools len=${data.length}');

        killQueue();
        emit(AsyncValue.loading(_State(pools: [])));

        for (final basic in data) {
          _queue.add(
            () => getFullPoolInfo.safeCall(
              params: GetFullPoolInfoParams(
                basicPool: basic,
                address: address,
              ),
              onError: (final e, final stackTrace) {
                logger.e(
                  e,
                  stackTrace: stackTrace,
                );
                Fluttertoast.showToast(
                  msg: 'Failed to fetch pool info. $e',
                  toastLength: Toast.LENGTH_LONG,
                );
              },
              onSuccess: (final PoolFullInfo pool) {
                final poolsList = state.valueOrNull != null
                    ? List<PoolFullInfo>.of(state.valueOrNull!.pools)
                    : List<PoolFullInfo>.empty(growable: true);
                poolsList.add(pool);
                final resState = _State(pools: poolsList);

                if (_queue.remainingItemCount == 1) {
                  emit(AsyncValue.data(resState));
                  logger.t('[POOLS] Finish pools update');
                  updating = false;
                } else {
                  emit(AsyncValue.loading(resState));
                  logger.t('[POOLS] Yield pools');
                }
              },
            ),
          );
        }
      },
    );
  }
}
