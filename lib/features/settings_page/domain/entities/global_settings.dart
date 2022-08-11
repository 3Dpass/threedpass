import 'package:threedpass/features/settings_page/domain/entities/scan_settings.dart';
import 'package:threedpass/features/settings_page/domain/entities/wallet_settings.dart';
import 'package:copy_with_extension/copy_with_extension.dart';

part 'global_settings.g.dart';

@CopyWith()
class GlobalSettingsConfig {
  GlobalSettingsConfig({
    required this.scanSettings,
    required this.walletSettings,
  });

  final ScanSettings scanSettings;
  final WalletSettings walletSettings;
}
