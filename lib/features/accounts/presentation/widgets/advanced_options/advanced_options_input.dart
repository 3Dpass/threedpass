import 'package:easy_localization/easy_localization.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:polkawallet_sdk/api/apiKeyring.dart';
import 'package:threedpass/features/accounts/bloc/account_store_bloc.dart';
import 'package:threedpass/features/accounts/domain/account_advanced_options.dart';

class AdvancedOptionsInput extends StatelessWidget {
  AdvancedOptionsInput({
    Key? key,
    required this.onOptionsChanged,
  }) : super(key: key);

  final pathController = TextEditingController();
  final void Function() onOptionsChanged;

  void onCryptoTypeChange(
    CryptoType? value,
    AccountStoreBloc accountStore,
  ) {
    if (value != null) {
      final currentOptions = accountStore.state.accountAdvancedOptions;
      accountStore.add(
        ChangeAdvancedOptions(
          currentOptions.copyWith(type: value),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO Collapsed container
    final accountStoreBloc = BlocProvider.of<AccountStoreBloc>(context);

    return ExpandablePanel(
      header: Text('advanced_options_header'.tr()),
      collapsed: const SizedBox(),
      expanded: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          DropdownButtonFormField<CryptoType>(
            decoration: InputDecoration(
              labelText: 'encrypt_type_picker_label'.tr(),
            ),
            items: CryptoType.values
                .map(
                  (e) => DropdownMenuItem<CryptoType>(
                    child: Text(e.toString()),
                  ),
                )
                .toList(),
            onChanged: (value) => onCryptoTypeChange(value, accountStoreBloc),
          ),
          SizedBox(height: 16),
          TextFormField(
            decoration: InputDecoration(
              hintText: '//hard/soft///password',
              labelText: 'derivation_path_input_label'.tr(),
            ),
            controller: pathController,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: _checkDerivePath,
          ),
        ],
      ),
    );
  }
}
