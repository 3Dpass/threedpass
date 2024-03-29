part of './app_service_cubit.dart';

extension DirtyArchitectureTrick on AppServiceLoaderCubit {
  Future<void> _afterInit() async {
    final objectsStore = getIt<ObjectsStore>(
      param1: this.state.networkStateData.ss58Format ?? ss58formatLive,
    );
    unawaited(getIt<PoscanObjectsCubit>().init(objectsStore));
  }
}
