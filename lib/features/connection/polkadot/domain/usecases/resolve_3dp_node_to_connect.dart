import 'dart:math';

import 'package:threedpass/core/usecase.dart';
import 'package:threedpass/core/utils/logger.dart';
import 'package:threedpass/features/connection/polkadot/data/repositories/public_3dp_nodes_list_repository.dart';
import 'package:threedpass/features/settings_page/domain/entities/connection_mode.dart';
import 'package:threedpass/features/settings_page/domain/repositories/settings_repository.dart';

class Resolve3DPNodeToConnect extends UseCase<String, void> {
  final SettingsRepository settingsRepo;
  final Public3dpNodesListRepository publicNodesRepo;

  Resolve3DPNodeToConnect({
    required this.publicNodesRepo,
    required this.settingsRepo,
  });

  @override
  Future<String> call(void params) async {
    final settings = await settingsRepo.getConfig();

    switch (settings.walletSettings.connectionMode) {
      case ConnectionMode.defaultRandom:
        final public = await publicNodesRepo.publicNodesList();
        if (public.isEmpty) {
          throw Exception('No public nodes found');
        }
        final rndIdx = Random().nextInt(public.length);
        final url = public[rndIdx];
        logger.t(
          'Chosen random index = $rndIdx of ${public.length} public nodes. NodeUrl=$url',
        );
        return url;
      case ConnectionMode.custom:
        return settings.walletSettings.nodeUrl;
    }
  }
}
