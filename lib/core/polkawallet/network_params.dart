import 'package:polkawallet_sdk/api/types/networkParams.dart';
import 'package:threedpass/core/polkawallet/constants.dart';

// final d3pLiveNetworkParams = NetworkParams.fromJson({
//   'name': d3pLiveName,
//   'ss58': ss58formatLive,
//   'endpoint': d3pDefaultNodeUrl,
// });

// final d3pTestNetworkParams = NetworkParams.fromJson({
//   'name': d3pTestName,
//   'ss58': ss58formatTest,
//   'endpoint': d3pDefaultNodeUrl,
// });

abstract class NetworkParamsFabric {
  static NetworkParams test(String? nodeUrl) {
    return NetworkParams.fromJson({
      'name': d3pTestName,
      'ss58': ss58formatTest,
      'endpoint': nodeUrl ?? d3pDefaultNodeUrl,
    });
  }

  static NetworkParams live(String? nodeUrl) {
    return NetworkParams.fromJson({
      'name': d3pLiveName,
      'ss58': ss58formatLive,
      'endpoint': nodeUrl ?? d3pDefaultNodeUrl,
    });
  }
}
