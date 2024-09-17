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
    final data = await getAllPools.call(GetAllPoolsParams(address: address));
    data.when(
      left: (final e) => emit(
        AsyncValue.error(
          e,
          StackTrace.current, // TODO Set real stacktrace from Failure
        ),
      ),
      right: (final data) => emit(
        AsyncValue.data(
          _State(
            pools: data,
          ),
        ),
      ),
    );
  }
}
