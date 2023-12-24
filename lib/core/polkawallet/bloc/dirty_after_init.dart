part of './app_service_cubit.dart';

extension DirtyArchitectureTrick on AppServiceLoaderCubit {
  Future<void> _afterInit() async {
    unawaited(getIt<PoscanObjectsCubit>().loadAll());
  }
}
