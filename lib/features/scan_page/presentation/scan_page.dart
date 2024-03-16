import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:threedpass/features/scan_page/presentation/widgets/floating_action_button/scan_page_floating_action_button.dart';
import 'package:threedpass/features/scan_page/presentation/widgets/scan_appbar.dart';
import 'package:threedpass/features/scan_page/presentation/widgets/scan_page_content.dart';

@RoutePage()
class ScanPage extends StatelessWidget {
  const ScanPage({final Key? key}) : super(key: key);

  @override
  Widget build(final BuildContext context) {
    return PlatformScaffold(
      appBar: ScanAppBar(),
      body: const Stack(
        children: [
          ScanPageContent(),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: EdgeInsets.all(24),
              child: ScanPageFloatinActionButton(),
            ),
          ),
        ],
      ),
    );
  }
}
