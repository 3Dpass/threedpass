import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:threedpass/core/widgets/common_appbar.dart';
import 'package:threedpass/features/wallet/presentation/widgets/open_explorer_card.dart';

class WalletPage extends StatelessWidget {
  const WalletPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppbar(
        title: 'wallet_header_title'.tr(),
      ),
      body: Column(
        children: [
          OpenExplorerCard(),
        ],
      ),
    );
  }
}
