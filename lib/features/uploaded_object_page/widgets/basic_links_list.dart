import 'package:flutter/material.dart';
import 'package:threedpass/core/widgets/buttons/text_button.dart';

class LinkParams {
  final String title;
  final Future<void> Function() onPressed;

  LinkParams({
    required this.title,
    required this.onPressed,
  });
}

class BasicLinksList extends StatelessWidget {
  final List<LinkParams> items;

  const BasicLinksList({required this.items, super.key});

  @override
  Widget build(final BuildContext context) => Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: items.map<Widget>((final item) {
          return D3pTextButton(
            text: item.title,
            onPressed: item.onPressed,
            flexibleText: true,
          );
        }).toList(),
      );
}
