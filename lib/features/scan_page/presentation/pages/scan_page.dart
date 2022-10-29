import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:threedpass/core/widgets/appbars/common_logo_appbar.dart';
import 'package:threedpass/features/scan_page/presentation/widgets/get_object_from_file_button.dart';
import 'package:threedpass/features/scan_page/presentation/widgets/scan_page_content.dart';

class ScanPage extends StatelessWidget {
  const ScanPage({final Key? key}) : super(key: key);

  @override
  Widget build(final BuildContext context) {
    return Scaffold(
      appBar: CommonLogoAppbar(
        title: 'recognize_your_objects'.tr(),
        theme: Theme.of(context),
      ),
      body: const ScanPageContent(),
      floatingActionButton: const GetObjectFromFileFloatingButton(),
    );
  }
}
