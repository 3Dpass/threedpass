import 'package:flutter/material.dart';
import 'package:threedpass/features/scan_page/presentation/widgets/object_list/scrollable_objects_list.dart';
import 'package:threedpass/features/scan_page/presentation/widgets/scan_indicator.dart';

class ScanPageContent extends StatelessWidget {
  const ScanPageContent({final Key? key}) : super(key: key);

  @override
  Widget build(final BuildContext context) {
    return const Column(
      children: [
        ScanIndicator(),
        Flexible(
          child: ScrollableObjectsList(),
        ),
      ],
    );
  }
}
