import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:threedpass/core/widgets/appbars/common_appbar.dart';

class CommonLogoAppbar extends CommonAppbar {
  CommonLogoAppbar({
    required final String title,
    final Key? key,
    final List<Widget>? actions,
  }) : super(
          key: key,
          titleSpacing: 0,
          title: SizedBox(
            height: kToolbarHeight,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(width: 16),
                Text('appTitle'.tr()),
                const SizedBox(width: 4),
                Text(
                  title,
                  textAlign: TextAlign.end,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          actions: actions,
        );
}
