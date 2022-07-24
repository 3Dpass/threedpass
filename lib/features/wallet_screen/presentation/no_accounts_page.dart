import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:threedpass/core/widgets/appbars/common_logo_appbar.dart';
import 'package:threedpass/features/wallet_screen/presentation/widgets/account_card.dart';
import 'package:threedpass/features/wallet_screen/presentation/widgets/open_explorer_card.dart';

class NoAccountsPage extends StatelessWidget {
  const NoAccountsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonLogoAppbar(
        title: 'wallet_header_title'.tr(),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          OpenExplorerCard(),
          AccountCard(),
          SizedBox(),
        ],
      ),
    );
  }
}
