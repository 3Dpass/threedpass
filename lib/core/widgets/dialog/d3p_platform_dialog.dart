import 'package:flutter/material.dart';

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
    return AlertDialog.adaptive(
      title: Text(title),
      content: content,
      actions: actions,
    );
  }
}
