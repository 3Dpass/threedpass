import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class D3pMaterialAlertDialog extends MaterialAlertDialogData {
  D3pMaterialAlertDialog({required final List<Widget> actions})
      : super(
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ...actions.map<Widget>(
                  (final e) => Flexible(
                    child: e,
                  ),
                ),
              ],
            ),
          ],
        );
}
