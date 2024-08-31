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

  final void Function(BuildContext context) onSavePressed;

  void saveAndExit(final BuildContext context) {
    onSavePressed(context);
    context.router.pop();
  }

  @override
  Widget build(final BuildContext context) {
    return D3pScaffold(
      appBarTitle: appbarTitle,
      appBarActions: [
        D3pIconButton(
          iconData: Icons.check,
          onPressed: () => saveAndExit(context),
        ),
      ],
      body: child,
    );
  }
}
