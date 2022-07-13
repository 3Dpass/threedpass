import 'package:threedpass/core/polkawallet/constants.dart';
import 'package:threedpass/core/polkawallet/plugins/d3p_core_plugin.dart';

class D3pTestNetPlugin extends D3pCorePlugin {
  D3pTestNetPlugin()
      : super(
          ss58: ss58formatTest,
          isTestNet: true,
        );
}
