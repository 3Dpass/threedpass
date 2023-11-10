import 'package:flutter/material.dart';
import 'package:threedpass/core/utils/copy_and_notify.dart';
import 'package:threedpass/core/widgets/d3p_card.dart';

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
    return D3pCard(
      child: InkWell(
        onTap: () => copyAndNotify(
          textToCopy: textToCopy,
          textToShow: textToShow,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
          child: SizedBox(
            width: double.infinity,
            child: child,
          ),
        ),
      ),
    );
  }
}
