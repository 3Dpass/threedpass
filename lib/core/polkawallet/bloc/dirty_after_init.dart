part of './app_service_cubit.dart';

extension DirtyArchitectureTrick on AppServiceLoaderCubit {
  Future<void> _afterInit() async {
    final ss58 = this.state.networkStateData.ss58Format ?? ss58formatLive;

    await getIt<ObjectsStore>()
        .open(ss58); // TODO WHEN RECONNECT TO NODE THIS SHOULD BE CALLED
    unawaited(getIt<PoscanObjectsCubit>().init());

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
