import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:threedpass/features/hashes_list/domain/entities/hash_object.dart';
import 'package:threedpass/features/hashes_list/domain/entities/snapshot.dart';

class CommonDialog extends StatelessWidget {
  CommonDialog({
    Key? key,
    required this.hashObject,
    required this.snapshot,
    required this.action,
    required this.actionText,
    required this.title,
    String initialText = '',
  })  : controller = TextEditingController(text: initialText),
        super(key: key);

  final TextEditingController controller;
  final Snapshot snapshot;
  final HashObject hashObject;
  final String title;
  final String actionText;
  final void Function(String) action;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
          child: Column(
            children: <Widget>[
              Text(
                title,
                style: Theme.of(context).textTheme.subtitle1,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8, right: 8, bottom: 16),
                child: TextField(
                  decoration: const InputDecoration(
                    isCollapsed: false,
                  ),
                  controller: controller,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    child: Text('Cancel'.tr()),
                    onPressed: () {
                      context.router.pop();
                    },
                  ),
                  TextButton(
                    child: Text(actionText),
                    onPressed: () => action(controller.text),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
