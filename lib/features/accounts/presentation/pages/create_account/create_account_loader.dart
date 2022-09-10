import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:threedpass/core/widgets/default_loading_dialog.dart';

class CreateAccountLoader extends StatelessWidget {
  const CreateAccountLoader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultLoadingDialog(
      text: 'create_account_loading'.tr(),
    );
  }
}
