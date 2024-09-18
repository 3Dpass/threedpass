import 'package:threedpass/core/architecture/local_repository_interface.dart';
import 'package:threedpass/core/architecture/remote_repository_interface.dart';
import 'package:threedpass/core/usecase.dart';

abstract class GetDataUseCase<TResult, Params>
    extends UseCase<TResult, Params> {
  final LocalRepoI<TResult, Params> localRepo;
  final RemoteRepoI<TResult, Params> remoteRepo;

  const GetDataUseCase({required this.localRepo, required this.remoteRepo});

  @override
  Future<TResult> call(final Params params) async {
    final localRes = await localRepo.get(params);

    if (localRes != null) {
      return localRes;
    } else {
      final data = await remoteRepo.get(params);
      await localRepo.set(data);
      return data;
    }
  }
}
