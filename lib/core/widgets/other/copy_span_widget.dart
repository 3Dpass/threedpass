import 'package:flutter/material.dart';
import 'package:threedpass/core/utils/copy_and_notify.dart';
import 'package:threedpass/core/widgets/buttons/icon_button.dart';

class CopySpanWidget extends StatelessWidget {
  const CopySpanWidget({
    required this.child,
    required this.textToCopy,
    required this.textToShow,
    super.key,
  });

  final Widget child;
  final String textToCopy;
  final String? textToShow;

  @override
  Widget build(final BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(
          child: child,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 16),
          child: D3pIconButton(
            iconData: Icons.copy,
            size: 16,
            onPressed: () => copyAndNotify(
              textToCopy: textToCopy,
              textToShow: textToShow,
            ),
            emptyContraints: true,
          ),
        ),
      ],
    );
  }
}
