import 'package:flutter/material.dart';
import 'package:threedpass/features/common/link_to_page/entities/link_to_page_params.dart';
import 'package:threedpass/features/common/link_to_page/ui/basic_link_to_page.dart';

class BasicLinksList extends StatelessWidget {
  final List<LinkToPageParams> items;

  const BasicLinksList({required this.items, super.key});

  @override
  Widget build(final BuildContext context) => Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: items
            .map<Widget>((final item) => BasicLinkToPage(params: item))
            .toList(),
      );
}
