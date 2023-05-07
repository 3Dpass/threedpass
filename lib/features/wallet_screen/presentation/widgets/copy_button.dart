import 'package:flutter/material.dart';
import 'package:threedpass/core/utils/copy_and_notify.dart';

class CopyButton extends StatelessWidget {
  const CopyButton(this.textToCopy, {super.key});

  final String? textToCopy;

  void onPressed(final BuildContext context) {
    copyAndNotify(textToCopy: textToCopy ?? '');
  }

  @override
  Widget build(final BuildContext context) {
    return IconButton(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      constraints: const BoxConstraints(),
      splashRadius: 25,
      onPressed: () => onPressed(context),
      icon: const Icon(
        Icons.copy,
        size: 20,
      ),
    );
  }
}
