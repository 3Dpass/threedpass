import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:threedpass/core/theme/d3p_special_colors.dart';
import 'package:threedpass/core/widgets/appbars/d3p_platfrom_appbar.dart';

class D3pScaffold extends StatelessWidget {
  final Widget body;
  final String appbarTitle;

  const D3pScaffold({
    required this.body,
    required this.appbarTitle,
    super.key,
  });

  @override
  Widget build(final BuildContext context) {
    final scaffoldColor = Theme.of(context).customColors.scaffoldBackground;
    return PlatformScaffold(
      appBar: D3pPlatformAppBar(
        titleText: appbarTitle,
      ),
      backgroundColor: scaffoldColor,
      body: body,
    );
  }
}
