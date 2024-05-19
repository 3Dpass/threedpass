import 'package:flutter/material.dart';
import 'package:threedpass/core/widgets/paddings.dart';

class ListViewSeparated extends StatelessWidget {
  final List<Widget> children;
  final Widget separator;

  const ListViewSeparated({
    required this.children,
    this.separator = const SizedBoxH8(),
    super.key,
  });

  @override
  Widget build(final BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (final context, final i) => children[i],
      separatorBuilder: (final context, final i) => separator,
      itemCount: children.length,
    );
  }
}
