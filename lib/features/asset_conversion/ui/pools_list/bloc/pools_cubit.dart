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

  Future<void> update({required final String address}) async {
    await getAllPools.safeCall(
      params: null,
      // params: GetAllPoolsParams(address: address),
      onError: (final e, final stackTrace) => emit(
        AsyncValue.error(
          e,
          stackTrace,
        ),
      ),
      onSuccess: (final List<BasicPoolEntity> data) async {
        for (final basic in data) {
          await getFullPoolInfo.safeCall(
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
                  ? List<PoolFullInfo>.from(state.valueOrNull!.pools)
                  : List<PoolFullInfo>.empty(growable: true);
              poolsList.add(pool);
              final resState = _State(
                pools: poolsList,
              );
              if (basic == data.last) {
                emit(
                  AsyncValue.data(resState),
                );
              } else {
                emit(
                  AsyncValue.loading(resState),
                );
              }
            },
          );
        }
      },
    );
  }
}
