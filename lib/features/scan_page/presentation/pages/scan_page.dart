import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:threedpass/features/scan_page/presentation/widgets/get_object_card.dart';
import 'package:threedpass/features/scan_page/presentation/widgets/objects_list.dart';
import 'package:threedpass/features/scan_page/presentation/widgets/objects_list_header.dart';
import 'package:threedpass/features/scan_page/presentation/widgets/open_explorer_card.dart';

class ScanPage extends StatelessWidget {
  const ScanPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        titleSpacing: 16,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('appTitle'.tr()),
            const SizedBox(width: 4),
            Text(
              'recognize_your_objects'.tr(),
              textAlign: TextAlign.end,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          GetObjectCard(),
          SizedBox(height: 4),
          ObjectsListHeader(),
          // OpenExplorerCard(),
          SizedBox(height: 4),
          Flexible(
            child: ObjectsList(),
          ),
        ],
      ),
    );
  }
}
