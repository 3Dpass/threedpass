import 'package:polkawallet_sdk/api/types/networkParams.dart';
import 'package:threedpass/core/polkawallet/constants.dart';

abstract class NetworkParamsFabric {
  static NetworkParams test(final String? nodeUrl) {
    return NetworkParams.fromJson(<String, dynamic>{
      'name': d3pTestName,
      'ss58': ss58formatTest,
      'endpoint': nodeUrl ?? d3pDefaultNodeUrl,
    });
  }

  static NetworkParams live(final String? nodeUrl) {
    return NetworkParams.fromJson(<String, dynamic>{
      'name': d3pLiveName,
      'ss58': ss58formatLive,
      'endpoint': nodeUrl ?? d3pDefaultNodeUrl,
    });
  }
}
