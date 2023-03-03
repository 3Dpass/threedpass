import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:threedpass/core/theme/d3p_special_styles.dart';
import 'package:threedpass/core/widgets/dialog/material_alert_dialog_data.dart';

class D3pPlatformDialog extends StatelessWidget {
  const D3pPlatformDialog({
    required this.content,
    required this.actions,
    required this.title,
    super.key,
  });
  final String title;

  final Widget content;
  final List<Widget> actions;

  @override
  Widget build(final BuildContext context) {
    return PlatformAlertDialog(
      title: Text(
        title,
        style: Theme.of(context).customTextStyles.d3ptitleLarge,
      ),
      content: content,
      material: (final context, final platform) => D3pMaterialAlertDialog(
        actions: actions,
      ),
      cupertino: (final context, final platform) => CupertinoAlertDialogData(
        actions: actions,
      ),
    );
  }
}
