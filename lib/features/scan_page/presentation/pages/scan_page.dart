import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:threedpass/core/widgets/appbars/common_logo_appbar.dart';
import 'package:threedpass/features/scan_page/presentation/widgets/get_object_card.dart';
import 'package:threedpass/features/scan_page/presentation/widgets/objects_list.dart';
import 'package:threedpass/features/scan_page/presentation/widgets/objects_list_header.dart';

class ScanPage extends StatelessWidget {
  const ScanPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonLogoAppbar(
        title: 'recognize_your_objects'.tr(),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          GetObjectCard(),
          SizedBox(height: 4),
          ObjectsListHeader(),
          SizedBox(height: 4),
          Flexible(
            child: ObjectsList(),
          ),
        ],
      ),
    );
  }
}
