import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/features/asset_conversion/domain/entities/pool_full_info.dart';
import 'package:threedpass/features/asset_conversion/domain/use_cases/get_all_pools.dart';

class PoolsState {
  final List<PoolFullInfo> pools;
  final bool isLoading;
  final String? error;

  const PoolsState({
    required this.pools,
    required this.error,
    required this.isLoading,
  });
}

class PoolsCubit extends Cubit<PoolsState> {
  PoolsCubit({
    required this.getAllPools,
  }) : super(
          const PoolsState(
            pools: [],
            error: null,
            isLoading: true,
          ),
        );

  final GetAllPools getAllPools;

  Future<void> update({required final String address}) async {
    final data = await getAllPools.call(GetAllPoolsParams(address: address));
    data.when(
      left: (final e) => emit(
        PoolsState(
          error: e.cause,
          pools: state.pools,
          isLoading: false,
        ),
      ),
      right: (final data) => emit(
        PoolsState(
          error: null,
          pools: data,
          isLoading: false,
        ),
      ),
    );
  }
}
