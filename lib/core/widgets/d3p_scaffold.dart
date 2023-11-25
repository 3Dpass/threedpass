import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:threedpass/core/widgets/appbars/d3p_platfrom_appbar.dart';
import 'package:threedpass/core/widgets/buttons/custom_back_button.dart';

class D3pScaffold extends StatelessWidget {
  final Widget body;
  final String appbarTitle;
  final bool? removeBackButton;
  final bool translateAppbar;

  const D3pScaffold({
    required this.appbarTitle,
    required this.body,
    this.removeBackButton,
    this.translateAppbar = true,
    super.key,
  });

  @override
  Widget build(final BuildContext context) {
    return PlatformScaffold(
      appBar: D3pPlatformAppBar(
        titleText: appbarTitle,
        leading: removeBackButton ?? false ? null : const CustomBackButton(),
        translateAppbar: translateAppbar,
      ),
      body: body,
    );
  }
}
