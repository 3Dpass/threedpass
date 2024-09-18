abstract class RemoteRepoI<TData, Params> {
  Future<TData> get(final Params params);
}
