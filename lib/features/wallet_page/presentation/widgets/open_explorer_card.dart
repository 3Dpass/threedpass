import 'package:flutter/material.dart';
import 'package:threedpass/features/explorer/presentation/explorer_card/open_explorer_button.dart';

class OpenExplorerCard extends StatelessWidget {
  const OpenExplorerCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Card(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: OpenExplorerButton(),
      ),
    );
  }
}
