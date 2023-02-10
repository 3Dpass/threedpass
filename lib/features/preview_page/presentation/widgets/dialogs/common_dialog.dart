import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:threedpass/core/widgets/buttons/text_button.dart';
import 'package:threedpass/features/hashes_list/domain/entities/hash_object.dart';
import 'package:threedpass/features/hashes_list/domain/entities/snapshot.dart';

class CommonDialog extends StatelessWidget {
  CommonDialog({
    required this.hashObject,
    required this.snapshot,
    required this.action,
    required this.actionText,
    required this.title,
    final Key? key,
    final String initialText = '',
  })  : controller = TextEditingController(text: initialText),
        super(key: key);

  final void Function(String) action;
  final String actionText;
  final TextEditingController controller;
  final HashObject hashObject;
  final Snapshot snapshot;
  final String title;

  @override
  Widget build(final BuildContext context) {
    return AlertDialog(
      // TODO Use PlatfromAlertDialog
      title: Text(
        title,
        style: Theme.of(context).textTheme.titleLarge,
      ),
      content: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            TextField(
              decoration: const InputDecoration(
                isCollapsed: false,
              ),
              controller: controller,
            ),
          ],
        ),
      ),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: D3pTextButton(
                text: 'Cancel'.tr(),
                onPressed: () => context.router.pop(),
              ),
            ),
            const Spacer(),
            Flexible(
              child: D3pTextButton(
                text: actionText,
                onPressed: () => action(controller.text),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
