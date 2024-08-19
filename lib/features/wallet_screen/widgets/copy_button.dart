import 'package:flutter/material.dart';
import 'package:threedpass/core/utils/copy_and_notify.dart';
import 'package:threedpass/core/widgets/buttons/icon_button.dart';

class CopyButton extends StatelessWidget {
  const CopyButton(this.textToCopy, {super.key});

  final String? textToCopy;

  void onPressed(final BuildContext context) {
    copyAndNotify(textToCopy: textToCopy ?? '');
  }

  @override
  Widget build(final BuildContext context) {
    return D3pIconButton(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      // constraints: const BoxConstraints(),
      emptyContraints: true,
      splashRadius: 22,
      onPressed: () => onPressed(context),
      size: 16,
      iconData: Icons.copy,
    );
  }
}
