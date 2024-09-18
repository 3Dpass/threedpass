import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/core/utils/async_value.dart';
import 'package:threedpass/features/asset_conversion/domain/entities/pool_full_info.dart';
import 'package:threedpass/features/asset_conversion/domain/use_cases/get_basic_pools.dart';

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
  }) : super(
          const AsyncValue.loading(
            _State(
              pools: [],
            ),
          ),
        );

  final GetBasicPools getAllPools;

  Future<void> update({required final String address}) async {
    await getAllPools.safeCall(
      params: GetAllPoolsParams(address: address),
      onError: (final e, final stackTrace) => emit(
        AsyncValue.error(
          e,
          stackTrace,
        ),
      ),
      onSuccess: (final List<PoolFullInfo> data) {
        emit(
          AsyncValue.data(
            _State(
              pools: data,
            ),
          ),
        );
      },
    );
  }
}
