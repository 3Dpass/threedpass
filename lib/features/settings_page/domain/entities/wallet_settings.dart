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
}
