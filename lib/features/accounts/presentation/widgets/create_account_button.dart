import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:threedpass/common/button_styles.dart';
import 'package:threedpass/router/router.gr.dart';

class CreateAccountButton extends StatelessWidget {
  const CreateAccountButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      style: AppButtonStyles.primaryButton,
      icon: const Icon(Icons.add),
      label: Text('create_account_button_label'.tr()),
      onPressed: () => context.router.push(
        const CreateAccountWrapperRoute(),
      ),
    );
  }
}
