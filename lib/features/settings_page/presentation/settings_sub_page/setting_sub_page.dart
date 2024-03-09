import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:threedpass/core/theme/d3p_special_colors.dart';
import 'package:threedpass/core/widgets/appbars/d3p_platfrom_appbar.dart';
import 'package:threedpass/core/widgets/buttons/icon_button.dart';

class SettingSubPage extends StatelessWidget {
  const SettingSubPage({
    required this.appbarTitle,
    required this.child,
    required this.onSavePressed,
    super.key,
  });

  final String appbarTitle;
  final Widget child;

  final void Function(BuildContext context) onSavePressed;

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
          iconData: Icons.arrow_back,
          cupertinoIcon: Icons.arrow_back_ios_new,
          onPressed: () => Navigator.of(context).pop(),
        ),
        trailingActions: [
          D3pIconButton(
            iconData: Icons.check,
            onPressed: () => saveAndExit(context),
          ),
        ],
      ),
      body: child,
    );
  }
}
