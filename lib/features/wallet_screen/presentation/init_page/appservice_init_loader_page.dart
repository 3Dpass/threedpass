import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:threedpass/core/widgets/appbars/common_logo_appbar.dart';
import 'package:threedpass/features/wallet_screen/presentation/widgets/connect_status.dart';

class AppServiceInitLoaderPage extends StatelessWidget {
  const AppServiceInitLoaderPage({final Key? key}) : super(key: key);

  @override
  Widget build(final BuildContext context) {
    return Scaffold(
      appBar: CommonLogoAppbar(
        title: 'wallet_header_title'.tr(),
        theme: Theme.of(context),
      ),
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
