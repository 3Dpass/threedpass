import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class NoContactsText extends StatelessWidget {
  const NoContactsText({final Key? key}) : super(key: key);

  @override
  Widget build(final BuildContext context) {
    return Center(
      child: Text(
        'no_contacts'.tr(),
      ),
    );
  }
}
