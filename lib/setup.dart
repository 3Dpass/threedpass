import 'package:get_it/get_it.dart';
import 'package:threedpass/features/hashes_list/data/repositories/store.dart';
import 'package:threedpass/features/hashes_list/domain/repositories/hashes_repository.dart';
import 'package:threedpass/features/hashes_list/presentation/bloc/hashes_list_bloc.dart';

final getIt = GetIt.instance;

Future<void> setup() async {
  getIt.registerSingleton<HiveHashStore>(
    HiveHashStore(),
  );
  // open box
  await getIt<HiveHashStore>().init();

  getIt.registerSingleton<HashesRepository>(
    HashesRepositoryImpl(
      hiveHashStore: getIt<HiveHashStore>(),
    ),
  );

  getIt.registerFactory<HashesListBloc>(
    () => HashesListBloc(
      hashesRepository: getIt<HashesRepository>(),
    )..init(),
  );
}
