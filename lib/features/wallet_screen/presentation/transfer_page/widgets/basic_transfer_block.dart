import 'package:flutter/material.dart';

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
        padding: const EdgeInsets.only(
          left: 16,
          right: 16,
          bottom: 16,
          top: 2,
        ),
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
          SizedBox(
            height: 24,
            child: InkWell(
              onTap: dismiss,
              customBorder: const CircleBorder(),
              child: Ink(
                decoration: const BoxDecoration(shape: BoxShape.circle),
                height: 24,
                width: 24,
                child: const Icon(
                  Icons.horizontal_rule_outlined,
                  size: 18,
                ),
              ),
            ),
          ),
          const SizedBox(width: 8),
        ],
      );
    } else {
      return const SizedBox(height: 24);
    }
  }
}
