import 'package:flutter/material.dart';
import 'package:threedpass/core/utils/copy_and_notify.dart';
import 'package:threedpass/core/widgets/buttons/clickable_card.dart';

class CopyTextCard extends StatelessWidget {
  final Widget child;
  final String textToCopy;
  final String textToShow;

  const CopyTextCard({
    required this.textToShow,
    required this.textToCopy,
    required this.child,
    super.key,
  });

  @override
  Widget build(final BuildContext context) {
    return ClickableCard(
      // side: BorderSide(color: Colors.grey),
      radius: Radius.circular(16),
      onTap: () => copyAndNotify(
        textToCopy: textToCopy,
        textToShow: textToShow,
      ),
      child: child,
    );
  }
}
