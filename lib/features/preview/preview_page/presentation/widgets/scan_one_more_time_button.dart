import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:threedpass/core/widgets/buttons/elevated_button.dart';

class ScanOneMoreTimeButton extends StatelessWidget {
  const ScanOneMoreTimeButton({super.key});

  @override
  Widget build(final BuildContext context) {
    return D3pElevatedButton(
      text: 'scan_one_more_time_button_label'.tr(),
      onPressed: () {}, // TODO Implement
    );
  }
}
