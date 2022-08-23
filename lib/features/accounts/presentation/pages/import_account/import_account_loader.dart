import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:threedpass/core/widgets/default_loading_dialog.dart';

class ImportAccountLoader extends StatelessWidget {
  const ImportAccountLoader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultLoadingDialog(
      text: 'import_account_loading'.tr(),
    );
  }
}
