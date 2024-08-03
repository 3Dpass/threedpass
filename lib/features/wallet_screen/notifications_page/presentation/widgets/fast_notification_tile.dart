import 'package:flutter/material.dart';

class FastNotificationTile extends StatelessWidget {
  final IconData iconData;
  final Widget child;

  const FastNotificationTile({
    required this.iconData,
    required this.child,
    super.key,
  });

  @override
  Widget build(final BuildContext context) {
    return Row(
      children: [
        Icon(iconData),
        const SizedBox(width: 16),
        Flexible(
          child: child,
        ),
      ],
    );
  }
}
