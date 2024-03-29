import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:threedpass/core/polkawallet/constants.dart';

part 'wallet_settings.g.dart';

@CopyWith()
@HiveType(typeId: 5)
class WalletSettings {
  const WalletSettings({
    required this.isTestNet,
    required this.nodeUrl,
  });

  const WalletSettings.defaultValues()
      : isTestNet = false,
        nodeUrl = d3pDefaultNodeUrl;

  @HiveField(0)
  final bool isTestNet;
  @HiveField(1)
  final String nodeUrl;

  WalletSettings selfValidate() {
    // Fix deprecated URL
    String nodeUrl = this.nodeUrl;
    if (nodeUrl == deprecatedD3pDefaultNodeUrl) {
      nodeUrl = d3pDefaultNodeUrl;
    }

    return this.copyWith(
      nodeUrl: nodeUrl,
    );
  }
}
