import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:threedpass/core/widgets/d3p_scaffold.dart';
import 'package:threedpass/features/scan_page/presentation/widgets/floating_action_button/scan_page_floating_action_button.dart';
import 'package:threedpass/features/scan_page/presentation/widgets/scan_page_content.dart';
import 'package:threedpass/features/scan_page/presentation/widgets/select_many_icon_button.dart';

@RoutePage()
class ScanPage extends StatelessWidget {
  const ScanPage({final Key? key}) : super(key: key);

  @override
  Widget build(final BuildContext context) {
    return const D3pScaffold(
      appBarTitle: 'recognize_your_objects',
      appBarActions: [
        SelectManyIconButton(),
      ],
      floatingActionButton: ScanPageFloatingActionButton(),
      body: ScanPageContent(),
    );
  }
}
