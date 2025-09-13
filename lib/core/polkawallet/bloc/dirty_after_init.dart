part of './app_service_cubit.dart';

extension DirtyAfterInit on AppServiceLoaderCubit {
  Future<void> _afterInit() async {
    unawaited(getIt<RemoteObjectsCountCubit>().setObjCount());

    if (state.keyring.current.address != null) {
      unawaited(
        getIt<PoolsCubit>().update(
          address: state.keyring.current.address!,
        ),
      );

      getIt<PoscanAssetsCubit>().switchAccount(state.keyring.current);

      currentAccountCubit.switchAccount(
        CurrentAccount(
          nativeP3D: KeyPair(
            address: state.keyring.current.address!,
            name: state.keyring.current.name,
            pubKey: state.keyring.current.pubKey!,
          ),
        ),
      );

      getIt<PendingAtomicSwapCubit>().init();

      unawaited(getIt<PoscanAssetsCubit>().init());

      getIt<UserObjectsListCubit>().load();
    }
  }
}
