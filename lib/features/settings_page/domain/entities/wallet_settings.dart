import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:threedpass/core/polkawallet/constants.dart';
import 'package:threedpass/features/settings_page/domain/entities/connection_mode.dart';

part 'wallet_settings.g.dart';

@CopyWith()
@HiveType(typeId: 5)
class WalletSettings {
  const WalletSettings({
    required this.connectionMode,
    required this.nodeUrl,
  });

  const WalletSettings.defaultValues()
      : nodeUrl = d3pDefaultNodeUrl,
        connectionMode = ConnectionMode.defaultRandom;

  // @HiveField(0)
  // final bool isTestNet;

  @HiveField(1)
  final String nodeUrl;

  @HiveField(2)
  final ConnectionMode connectionMode;

  WalletSettings selfValidate() {
    return this.copyWith(
      nodeUrl: nodeUrl,
    );
  }
}
