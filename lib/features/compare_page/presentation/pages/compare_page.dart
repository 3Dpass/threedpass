import 'package:flutter/material.dart';
import 'package:threedpass/core/widgets/d3p_scaffold.dart';
import 'package:threedpass/features/compare_page/presentation/widgets/compare_row.dart';
import 'package:threedpass/features/compare_page/presentation/widgets/compare_table/compare_table.dart';

class ComparePage extends StatelessWidget {
  const ComparePage({
    final Key? key,
  }) : super(key: key);

  @override
  Widget build(final BuildContext context) {
    return const D3pScaffold(
      appBarTitle: 'compare_page_appbar',
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: CompareRow(),
          ),
          Divider(
            height: 16,
            thickness: 2,
            // color: Colors.black,
          ),
          Flexible(
            child: CompareTable(),
          ),
        ],
      ),
    );
  }
}
