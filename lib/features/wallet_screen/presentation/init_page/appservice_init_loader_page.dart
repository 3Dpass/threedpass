import 'package:flutter/material.dart';
import 'package:threedpass/core/widgets/d3p_scaffold.dart';
import 'package:threedpass/features/wallet_screen/presentation/widgets/connect_status.dart';

class AppServiceInitLoaderPage extends StatelessWidget {
  const AppServiceInitLoaderPage({final Key? key}) : super(key: key);

  @override
  Widget build(final BuildContext context) {
    return D3pScaffold(
      removeBackButton: true,
      appbarTitle: 'wallet_header_title',
      body: Stack(
        children: const [
          Align(
            alignment: Alignment.center,
            child: ConnectStatus(),
          ),
        ],
      ),
    );
  }
}
