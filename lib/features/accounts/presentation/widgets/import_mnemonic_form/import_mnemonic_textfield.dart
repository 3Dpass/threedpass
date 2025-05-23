import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/core/widgets/input/textformfield/textformfield.dart';
import 'package:threedpass/features/accounts/bloc/address_icon_data_preview_cubit.dart';

class ImportMnemonicTextfield extends StatelessWidget {
  const ImportMnemonicTextfield({
    required this.textEditingController,
    final Key? key,
  }) : super(key: key);

  final TextEditingController textEditingController;

  /// https://github.com/polkawallet-io/app/blob/48821c58b19b2e6df17200bc0c5d10bf5577ac41/lib/pages/account/import/importAccountFormMnemonic.dart#L140
  static String? _validateInput(final String? v) {
    bool passed = false;
    if (v != null) {
      final String input = v.trim().toLowerCase();
      final int len = input.split(' ').length;
      if (len >= 12) {
        passed = true;
      }
    }
    return passed ? null : 'Invalid'.tr() + ' ' + 'import_type_mnemonic'.tr();
  }

  Future<void> changeAddressIconPreview(
    final String? s,
    final BuildContext context,
  ) async {
    if (s != null) {
      final String mnemonic = s.trim().toLowerCase();
      if (mnemonic.split(' ').length >= 12) {
        await BlocProvider.of<AddressIconDataPreviewCubit>(context)
            .updateInfo(mnemonic);
      } else {
        BlocProvider.of<AddressIconDataPreviewCubit>(context).dropInfo();
      }
    } else {
      BlocProvider.of<AddressIconDataPreviewCubit>(context).dropInfo();
    }
  }

  @override
  Widget build(final BuildContext context) {
    return D3pTextFormField(
      controller: textEditingController,
      hintText: 'import_mnemonic_hint'.tr(),
      labelText: 'import_type_mnemonic'.tr(),
      validator: _validateInput,
      onChanged: (final value) async =>
          changeAddressIconPreview(value, context),
    );
  }
}
