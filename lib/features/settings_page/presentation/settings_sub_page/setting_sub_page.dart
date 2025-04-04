import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:threedpass/core/widgets/buttons/icon_button.dart';
import 'package:threedpass/core/widgets/d3p_scaffold.dart';

class SettingSubPage extends StatelessWidget {
  const SettingSubPage({
    required this.appbarTitle,
    required this.child,
    required this.onSavePressed,
    super.key,
  });

  final String appbarTitle;
  final Widget child;

  final bool Function(BuildContext context) onSavePressed;

  Future<void> saveAndExit(final BuildContext context) async {
    final success = onSavePressed(context);
    if (success) {
      await context.router.maybePop();
    }
  }

  @override
  Widget build(final BuildContext context) {
    return D3pScaffold(
      appBarTitle: appbarTitle,
      appBarActions: [
        D3pIconButton(
          iconData: Icons.check,
          onPressed: () async => saveAndExit(context),
        ),
      ],
      body: child,
    );
  }
}
