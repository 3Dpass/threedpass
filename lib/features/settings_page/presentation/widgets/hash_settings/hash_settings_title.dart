import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class HashSettingsTitle extends StatelessWidget {
  const HashSettingsTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        text: 'hash_settings_title'.tr() + ' ',
        style: Theme.of(context).textTheme.headline6,
        children: [
          TextSpan(
            text: 'lib version: 0.2.0',
            style: Theme.of(context).textTheme.caption,
          ),
        ],
      ),
    );
  }
}
