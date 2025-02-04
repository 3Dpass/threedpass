import 'package:flutter/material.dart';
import 'package:threedpass/core/widgets/buttons/icon_button.dart';

class BasicTransferBlock extends StatelessWidget {
  const BasicTransferBlock({
    required this.child,
    this.dismiss,
    super.key,
  });

  final Widget child;
  final void Function()? dismiss;

  @override
  Widget build(final BuildContext context) {
    return Card(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 16, top: 2, right: 16, bottom: 16),
        child: Column(
          children: [
            _DismissIcon(dismiss: dismiss),
            child,
          ],
        ),
      ),
    );
  }
}

class _DismissIcon extends StatelessWidget {
  const _DismissIcon({
    required this.dismiss,
  });
  final void Function()? dismiss;

  @override
  Widget build(final BuildContext context) {
    if (dismiss != null) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          D3pIconButton(
            iconData: Icons.horizontal_rule_outlined,
            onPressed: dismiss,
            emptyContraints: true,
          ),
        ],
      );
    } else {
      return const SizedBox(height: 24);
    }
  }
}
