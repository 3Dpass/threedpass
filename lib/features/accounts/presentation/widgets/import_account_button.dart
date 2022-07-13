import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:threedpass/common/button_styles.dart';

class ImportAccountButton extends StatelessWidget {
  const ImportAccountButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      style: AppButtonStyles.primaryButton,
      icon: const Icon(Icons.import_export_outlined),
      label: Text('import_account_button_label'.tr()),
      onPressed: null,
    );
  }
}
