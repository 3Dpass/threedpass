import 'package:polkawallet_sdk/api/types/networkParams.dart';
import 'package:threedpass/core/polkawallet/constants.dart';
import 'package:threedpass/core/polkawallet/network_params_fabric.dart';
import 'package:threedpass/core/polkawallet/plugins/d3p_core_plugin.dart';

class D3pTestNetPlugin extends D3pCorePlugin {
  D3pTestNetPlugin({final String? nodeUrl})
      : nodeList = [NetworkParamsFabric.test(nodeUrl)],
        super(
          name: d3pTestName,
          ss58: ss58formatTest,
          isTestNet: true,
        );

  @override
  final List<NetworkParams> nodeList;
}
