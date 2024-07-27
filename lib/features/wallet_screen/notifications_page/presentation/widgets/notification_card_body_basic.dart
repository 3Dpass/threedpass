import 'package:flutter/material.dart';
import 'package:threedpass/core/widgets/paddings.dart';

class NotificationCardBodyBasic extends StatelessWidget {
  const NotificationCardBodyBasic({required this.children, super.key});

  final List<Widget> children;

  @override
  Widget build(final BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (final context, final i) => children[i],
      separatorBuilder: (final context, final i) => const H8(),
      itemCount: children.length,
    );
  }
}
