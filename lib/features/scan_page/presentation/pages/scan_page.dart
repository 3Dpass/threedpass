import 'package:flutter/material.dart';
import 'package:threedpass/core/widgets/d3p_scaffold.dart';
import 'package:threedpass/features/scan_page/presentation/widgets/get_object_from_file_button.dart';
import 'package:threedpass/features/scan_page/presentation/widgets/scan_page_content.dart';

class ScanPage extends StatelessWidget {
  const ScanPage({final Key? key}) : super(key: key);

  @override
  Widget build(final BuildContext context) {
    print('ScanPage');
    return D3pScaffold(
      appbarTitle: 'recognize_your_objects',
      body: Stack(
        children: const [
          ScanPageContent(),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: EdgeInsets.all(16),
              child: GetObjectFromFileFloatingButton(),
            ),
          ),
        ],
      ),
    );
  }
}
