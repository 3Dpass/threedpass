import 'package:copy_with_extension/copy_with_extension.dart';

part 'wallet_settings.g.dart';

@CopyWith()
class WalletSettings {
  const WalletSettings({
    required this.isTestNet,
    required this.nodeUrl,
  });

  final bool isTestNet;
  final String nodeUrl;
}
