import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class CommonAppbar extends AppBar {
  CommonAppbar({Key? key, required String title})
      : super(
          key: key,
          backgroundColor: Colors.black,
          titleSpacing: 16,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
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
        );
}
