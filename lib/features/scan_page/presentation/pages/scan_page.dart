import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:threedpass/core/widgets/appbars/common_logo_appbar.dart';
import 'package:threedpass/core/widgets/appbars/d3p_platfrom_appbar.dart';
import 'package:threedpass/features/scan_page/presentation/widgets/get_object_from_file_button.dart';
import 'package:threedpass/features/scan_page/presentation/widgets/scan_page_content.dart';

class ScanPage extends StatelessWidget {
  const ScanPage({final Key? key}) : super(key: key);

  @override
  Widget build(final BuildContext context) {
    final c = Theme.of(context).scaffoldBackgroundColor;
    print(c.toString());
    // dark 0xff303030
    // light 0xfffafafa
    // TODO Set scaffold colors
    return PlatformScaffold(
      appBar: D3pPlatformAppBar(
        titleText: 'recognize_your_objects',
      ),
      // backgroundColor: Colors.amber,
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
      // floatingActionButton: const GetObjectFromFileFloatingButton(),
    );
  }
}
