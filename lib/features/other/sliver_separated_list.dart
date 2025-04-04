import 'package:flutter/material.dart';

class SliverSeparatedList extends StatelessWidget {
  final List<Widget> children;
  final Widget separator;
  final Size size;
  final Axis scrollDirection;
  final EdgeInsetsGeometry padding;

  const SliverSeparatedList({
    required this.children,
    required this.separator,
    required this.size,
    required this.scrollDirection,
    required this.padding,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox.fromSize(
      size: size,
      child: CustomScrollView(
        scrollDirection: Axis.horizontal,
        slivers: [
          SliverPadding(
            padding: padding,
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  // Even indices: actual widget.
                  if (index.isEven) {
                    final itemIndex = index ~/ 2;
                    return children[itemIndex];
                  }
                  // Odd indices: spacer widget.
                  return separator;
                },
                // For N items, we need (N * 2 - 1) children (no trailing spacer).
                childCount: children.length * 2 - 1,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
