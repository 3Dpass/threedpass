import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:threedpass/core/widgets/buttons/elevated_button.dart';
import 'package:threedpass/core/widgets/other/padding_16.dart';
import 'package:threedpass/router/router.gr.dart';

class PoscanResult extends StatelessWidget {
  const PoscanResult({super.key});

  @override
  Widget build(final BuildContext context) {
    return Padding16(
      child: D3pElevatedButton(
        text: '3d_rpc_button_label'.tr(),
        onPressed: () => context.router.push(const D3PRPCRoute()),
      ),
    );
  }
}
