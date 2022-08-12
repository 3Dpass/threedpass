import 'package:hive_flutter/hive_flutter.dart';
import 'package:threedpass/features/settings_page/domain/entities/scan_settings.dart';
import 'package:threedpass/features/settings_page/domain/entities/wallet_settings.dart';
import 'package:copy_with_extension/copy_with_extension.dart';

part 'global_settings.g.dart';

@CopyWith()
@HiveType(typeId: 4)
class GlobalSettings {
  const GlobalSettings({
    required this.scanSettings,
    required this.walletSettings,
  });

  GlobalSettings.defaultValues()
      : scanSettings = const ScanSettings.defaultValues(),
        walletSettings = const WalletSettings.defaultValues();

  @HiveField(0)
  final ScanSettings scanSettings;
  @HiveField(1)
  final WalletSettings walletSettings;
}
