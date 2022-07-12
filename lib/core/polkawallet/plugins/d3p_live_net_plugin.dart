import 'package:threedpass/core/polkawallet/constants.dart';
import 'package:threedpass/core/polkawallet/plugins/d3p_core_plugin.dart';

class D3pLiveNetPlugin extends D3pCorePlugin {
  D3pLiveNetPlugin()
      : super(
          ss58: ss58formatLive,
          isTestNet: false,
        );
}
