part of './app_service_cubit.dart';

extension DirtyArchitectureTrick on AppServiceLoaderCubit {
  Future<void> _afterInit() async {
    final objectsStore = getIt<ObjectsStore>(
      param1: this.state.networkStateData.ss58Format ?? ss58formatLive,
    );
    unawaited(getIt<PoscanObjectsCubit>().init(objectsStore));

    getIt<PoscanAssetsCubit>().switchAccount(state.keyring.current);
    unawaited(getIt<PoscanAssetsCubit>().init());

    if (state.keyring.current.address != null) {
      unawaited(
        getIt<PoolsCubit>().update(
          address: state.keyring.current.address!,
        ),
      );
    }
  }
}
