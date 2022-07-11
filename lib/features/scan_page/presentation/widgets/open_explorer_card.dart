import 'package:flutter/material.dart';
import 'package:threedpass/features/scan_page/presentation/widgets/explorer_card/open_explorer_button.dart';

class OpenExplorerCard extends StatelessWidget {
  const OpenExplorerCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: const [
            OpenExplorerButton(),
            SizedBox(height: 8),
            Text(
              'Open 3DP web explorer',
            ),
            SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}
