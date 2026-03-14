import 'package:threedpass/core/usecase.dart';
import 'package:threedpass/core/utils/logger.dart';
import 'package:threedpass/features/rest/data/repositories/public_explorer_list_repository.dart';
import 'package:threedpass/features/settings_page/domain/entities/connection_mode.dart';
import 'package:threedpass/features/settings_page/domain/repositories/settings_repository.dart';

class ResolveExplorerUrl extends UseCase<String, void> {
  final SettingsRepository settingsRepo;
  final PublicExplorerListRepository publicExplorersRepo;

  ResolveExplorerUrl({
    required this.publicExplorersRepo,
    required this.settingsRepo,
  });

  @override
  Future<String> call(void params) async {
    final settings = await settingsRepo.getConfig();

    switch (settings.walletSettings.explorerConnectionMode ??
        ConnectionMode.defaultRandom) {
      case ConnectionMode.defaultRandom:
        final public = await publicExplorersRepo.publicExplorersList();
        if (public.isEmpty) {
          throw Exception('No public explorers found');
        }
        public.shuffle();
        for (final url in public) {
          final reachable = await publicExplorersRepo.checkReachable(url);
          if (reachable) {
            logger.t(
              'Chosen reachable explorer from ${public.length} candidates. Url=$url',
            );
            return url;
          }
        }
        throw Exception('No reachable public explorers found');
      case ConnectionMode.custom:
        final customUrl = settings.walletSettings.explorerUrl!;
        final reachable = await publicExplorersRepo.checkReachable(customUrl);
        if (!reachable) {
          throw Exception('Custom explorer URL is not reachable: $customUrl');
        }
        return customUrl;
        ;
    }
  }
}
