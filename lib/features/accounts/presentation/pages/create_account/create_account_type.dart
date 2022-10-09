import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:threedpass/core/widgets/buttons/list_tile_button.dart';
import 'package:threedpass/features/accounts/presentation/pages/account_page_template.dart';
import 'package:threedpass/router/router.gr.dart';

class CreateAccountType extends StatelessWidget {
  const CreateAccountType({final Key? key}) : super(key: key);

  @override
  Widget build(final BuildContext context) {
    return AccountPageTemplate.create(
      disableBottomButton: true,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'import_account_type_title'.tr(),
              style: Theme.of(context).textTheme.headline6,
            ),
            const SizedBox(height: 8),
            const _Item(CreateType.mnemonic),
            // const _Item(CreateType.rawSeed), // TODO Add raw seed method
            const _Item(CreateType.object),
          ],
        ),
      ],
    );
  }
}

class _Item extends StatelessWidget {
  const _Item(
    this.createType, {
    final Key? key,
  }) : super(key: key);

  final CreateType createType;

  void onTap(final BuildContext context) {
    // log('onTap intem $importType');
    switch (createType) {
      case CreateType.mnemonic:
        context.router.push(ImportMnemonicFormRoute());
        break;
      case CreateType.object:
        context.router.push(const CreateAccountFromObjectRoute());
        break;
    }
  }

  String titleText(final BuildContext context) {
    switch (createType) {
      case CreateType.mnemonic:
        return 'create_type_mnemonic'.tr();
      case CreateType.object:
        return 'create_type_object'.tr();
    }
  }

  @override
  Widget build(final BuildContext context) {
    return ListTileButton.usual(
      text: titleText(context),
      onPressed: () => onTap(context),
    );
  }
}

enum CreateType { mnemonic, object }
