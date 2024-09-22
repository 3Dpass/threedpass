import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/core/theme/d3p_special_styles.dart';
import 'package:threedpass/core/widgets/buttons/list_tile_button.dart';
import 'package:threedpass/core/widgets/paddings.dart';
import 'package:threedpass/features/accounts/presentation/pages/account_page_template.dart';
import 'package:threedpass/features/hashes_list/bloc/hashes_list_bloc.dart';
import 'package:threedpass/router/router.gr.dart';

@RoutePage()
class CreateAccountTypePage extends StatelessWidget {
  const CreateAccountTypePage({final Key? key}) : super(key: key);

  @override
  Widget build(final BuildContext context) {
    return AccountPageTemplate.import(
      disableScrolling: true,
      disableBottomButton: true,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'import_account_type_title'.tr(),
              style: Theme.of(context).customTextStyles.d3ptitleLarge,
            ),
            const H8(),
            const _Item(CreateType.mnemonic),
            const _D3ObjectItem(),
            const _Item(CreateType.rawseed),
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
        unawaited(context.router.push(ImportMnemonicFormRoute()));
        break;
      case CreateType.rawseed:
        unawaited(context.router.push(ImportRawseedFormRoute()));
        break;
    }
  }

  String titleText(final BuildContext context) {
    switch (createType) {
      case CreateType.mnemonic:
        return 'create_type_mnemonic'.tr();
      case CreateType.rawseed:
        return 'create_type_rawseed'.tr();
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

class _D3ObjectItem extends StatelessWidget {
  const _D3ObjectItem();

  bool isHashesAvaliable(final BuildContext context) {
    // Get objects with snapshots
    final hashObjects = BlocProvider.of<HashesListBloc>(context).state;

    // Find objects with stable hashes
    final realObjects = hashObjects.objects
        .where((final obj) => obj.stableHashes.isNotEmpty)
        .toList();

    return realObjects.isNotEmpty;
  }

  void onTap(final BuildContext context) {
    if (isHashesAvaliable(context)) {
      unawaited(context.router.push(const CreateAccountFromObjectRoute()));
    } else {
      unawaited(context.router.push(const NoStableHashRoute()));
    }
  }

  String titleText(final BuildContext context) {
    return 'create_type_object'.tr();
  }

  @override
  Widget build(final BuildContext context) {
    return ListTileButton.usual(
      text: titleText(context),
      onPressed: () => onTap(context),
    );
  }
}

enum CreateType { mnemonic, rawseed }
