import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:polkawallet_sdk/api/types/networkStateData.dart';
import 'package:polkawallet_sdk/plugin/index.dart';
import 'package:polkawallet_sdk/storage/keyring.dart';

part 'app_service.g.dart';

@CopyWith()
class AppService {
  AppService({
    required this.plugin,
    required this.keyring,
    required this.status,
    NetworkStateData? networkStateData,
  }) : networkStateData = networkStateData = NetworkStateData();

  final PolkawalletPlugin plugin;
  final Keyring keyring;
  final AppServiceInitStatus status;
  final NetworkStateData networkStateData;

  // final subScan = SubScanApi();
}

enum AppServiceInitStatus {
  init,
  connecting,
  connected,
  // error means failure to connect to node
  error,
}
