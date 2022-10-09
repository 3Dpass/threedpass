import 'package:polkawallet_sdk/api/types/networkParams.dart';
import 'package:threedpass/core/polkawallet/constants.dart';
import 'package:threedpass/core/polkawallet/network_params.dart';
import 'package:threedpass/core/polkawallet/plugins/d3p_core_plugin.dart';

class D3pLiveNetPlugin extends D3pCorePlugin {
  D3pLiveNetPlugin({String? nodeUrl})
      : nodeList = [NetworkParamsFabric.live(nodeUrl)],
        super(
          name: d3pLiveName,
          ss58: ss58formatLive,
          isTestNet: false,
        );

  @override
  final List<NetworkParams> nodeList;
}
