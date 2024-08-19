import 'package:flutter/material.dart';
import 'package:threedpass/core/widgets/d3p_scaffold.dart';
import 'package:threedpass/features/wallet_screen/widgets/connect_status.dart';

class AppServiceInitLoaderPage extends StatelessWidget {
  const AppServiceInitLoaderPage({final Key? key}) : super(key: key);

  @override
  Widget build(final BuildContext context) {
    return const D3pScaffold(
      appBarTitle: 'wallet_header_title',
      body: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: ConnectStatus(),
          ),
        ],
      ),
    );
  }
}
