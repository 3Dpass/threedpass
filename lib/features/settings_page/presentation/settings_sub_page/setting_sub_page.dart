import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:threedpass/core/theme/d3p_special_colors.dart';
import 'package:threedpass/core/widgets/appbars/d3p_platfrom_appbar.dart';
import 'package:threedpass/core/widgets/buttons/icon_button.dart';

abstract class SettingSubPage extends StatelessWidget {
  const SettingSubPage({
    super.key,
  });

  String get appbarTitle;

  Widget bodyBuilder(final BuildContext context);
  void onSavePressed(final BuildContext context);

  void saveAndExit(final BuildContext context) {
    onSavePressed(context);
    context.router.pop();
  }

  @override
  Widget build(final BuildContext context) {
    final theme = Theme.of(context);
    return PlatformScaffold(
      backgroundColor: theme.customColors.scaffoldBackground,
      appBar: D3pPlatformAppBar(
        textAlign: TextAlign.center,
        titleText: appbarTitle,
        leading: D3pIconButton(
          iconData: Icons.close,
          onPressed: () => Navigator.of(context).pop(),
        ),
        trailingActions: [
          D3pIconButton(
            iconData: Icons.check,
            onPressed: () => saveAndExit(context),
          ),
        ],
      ),
      // ignore: avoid-returning-widgets
      body: bodyBuilder(context),
    );
  }
}
