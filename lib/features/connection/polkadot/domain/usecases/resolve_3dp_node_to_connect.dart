import 'dart:math';

import 'package:threedpass/core/usecase.dart';
import 'package:threedpass/core/utils/logger.dart';
import 'package:threedpass/features/connection/polkadot/data/repositories/trusted_3dp_nodes_list_repository.dart';
import 'package:threedpass/features/settings_page/domain/entities/connection_mode.dart';
import 'package:threedpass/features/settings_page/domain/repositories/settings_repository.dart';

class Resolve3DPNodeToConnect extends UseCase<String, void> {
  final SettingsRepository settingsRepo;
  final Trusted3dpNodesListRepository trustedNodesRepo;

  Resolve3DPNodeToConnect({
    required this.trustedNodesRepo,
    required this.settingsRepo,
  });

  @override
  Future<String> call(void params) async {
    final settings = await settingsRepo.getConfig();

    switch (settings.walletSettings.connectionMode) {
      case ConnectionMode.defaultRandom:
        final trusted = await trustedNodesRepo.trustedNodesList();
        final rndIdx = Random().nextInt(trusted.length);
        final url = trusted[rndIdx];
        logger.t(
          'Chosen random index=$rndIdx of ${trusted.length} trusted nodes. NodeUrl=$url',
        );
        return url;
      case ConnectionMode.custom:
        return settings.walletSettings.nodeUrl;
    }
  }
}
