import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class CalcHashLoadingWidget extends StatelessWidget {
  const CalcHashLoadingWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Row(
        children: [
          PlatformCircularProgressIndicator(),
          Flexible(
            child: Container(
              margin: const EdgeInsets.only(left: 16),
              child: Text('calc_hashes_loader_text'.tr()),
            ),
          ),
        ],
      ),
    );
  }
}
