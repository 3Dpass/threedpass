import 'package:flutter/material.dart';

class FastSeparatedListView extends StatelessWidget {
  const FastSeparatedListView({
    required this.children,
    required this.separator,
    this.padding,
    super.key,
  });

  final List<Widget> children;
  final EdgeInsets? padding;
  final Widget separator;

  @override
  Widget build(final BuildContext context) => ListView.separated(
        padding: padding,
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (final _, final index) => children[index],
        separatorBuilder: (final _, final __) => separator,
        itemCount: children.length,
      );
}
