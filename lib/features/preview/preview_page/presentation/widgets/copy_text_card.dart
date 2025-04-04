import 'package:flutter/material.dart';
import 'package:threedpass/core/utils/copy_and_notify.dart';
import 'package:threedpass/core/widgets/buttons/clickable_card.dart';

// TODO make something to indicate copy action
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
      onTap: () async => copyAndNotify(
        textToCopy: textToCopy,
        textToShow: textToShow,
      ),
      child: child,
    );
  }
}
