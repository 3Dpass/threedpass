import 'package:get_it/get_it.dart';
import 'package:threedpass/core/utils/di_module.dart';
import 'package:threedpass/features/connection/polkadot/bloc/polkadot_node_url.dart';
import 'package:threedpass/features/connection/polkadot/data/repositories/trusted_3dp_nodes_list_repository.dart';
import 'package:threedpass/features/connection/polkadot/domain/usecases/resolve_3dp_node_to_connect.dart';
import 'package:threedpass/features/settings_page/domain/repositories/settings_repository.dart';

class DIConnection extends DIModule {
  @override
  Future<void> setup(final GetIt getIt) async {
    getIt.registerLazySingleton<Trusted3dpNodesListRepository>(
      () => Trusted3dpNodesListRepositoryImpl(),
    );

    getIt.registerFactory<Resolve3DPNodeToConnect>(
      () => Resolve3DPNodeToConnect(
        trustedNodesRepo: getIt<Trusted3dpNodesListRepository>(),
        settingsRepo: getIt<SettingsRepository>(),
      ),
    );

    getIt.registerLazySingleton<PolkadotNodeUrl>(
      () => PolkadotNodeUrl(
        resolve3DPNode: getIt<Resolve3DPNodeToConnect>(),
      ),
    );
  }
}
