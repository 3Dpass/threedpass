import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/features/accounts/bloc/import_account_cubit/import_account_cubit.dart';
import 'package:threedpass/features/accounts/bloc/import_account_cubit/import_account_state.dart';
import 'package:threedpass/features/accounts/presentation/pages/account_page_template.dart';

class ImportAccountImportType extends StatelessWidget {
  const ImportAccountImportType({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AccountPageTemplate.import(
      children: [
        Card(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: List.generate(
              ImportType.values.length,
              (index) => _Item(ImportType.values[index]),
            ),
          ),
        ),
      ],
      disableBottomButton: true,
    );
  }
}

class _Item extends StatelessWidget {
  const _Item(
    this.importType, {
    Key? key,
  }) : super(key: key);

  final ImportType importType;

  void onTap(BuildContext context) {
    BlocProvider.of<ImportAccountCubit>(context).changeImportType(importType);
    // conte
  }

  String titleText(BuildContext context) {
    switch (importType) {
      case ImportType.mnemonic:
        return 'import_type_mnemonic'.tr();
      case ImportType.rawSeed:
        return 'import_type_raw_seed'.tr();
      case ImportType.keystore:
        return 'import_type_keystore'.tr();
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(titleText(context)),
      onTap: () => onTap(context),
      trailing: const Icon(Icons.arrow_right_outlined),
    );
  }
}