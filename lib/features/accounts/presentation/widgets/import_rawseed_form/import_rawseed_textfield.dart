import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/core/widgets/input/textformfield/textformfield.dart';
import 'package:threedpass/features/accounts/bloc/address_icon_data_preview_cubit.dart';

class ImportRawseedTextfield extends StatelessWidget {
  const ImportRawseedTextfield({
    required this.textEditingController,
    final Key? key,
  }) : super(key: key);

  final TextEditingController textEditingController;

  /// https://github.com/polkawallet-io/app/blob/48821c58b19b2e6df17200bc0c5d10bf5577ac41/lib/pages/account/import/importAccountFromRawSeed.dart
  static String? _validateInput(final String? v) {
    bool passed = false;
    if (v != null) {
      final String input = v.trim().toLowerCase();
      //if (input.isNotEmpty && (input.length <= 32 || input.length == 66)) {
      //TODO 3dPass uses Sha-256, so always 64?
      if (input.isNotEmpty && input.length == 64) {
        passed = true;
      }
    }
    return passed ? null : 'Invalid'.tr() + ' ' + 'import_type_rawseed'.tr();
  }

  void changeAddressIconPreview(final String? s, final BuildContext context) {
    if (s != null) {
      final String rawseed = s.trim().toLowerCase();
      //if (input.isNotEmpty && (input.length <= 32 || input.length == 66)) {
      //TODO 3dPass uses Sha-256, so always 64?
      var x = rawseed.length;
      if (rawseed.length == 64) {
        BlocProvider.of<AddressIconDataPreviewCubit>(context)
            .updateInfoFromRawseed(rawseed);
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
      labelText: 'import_type_rawseed'.tr(),
      hintText: 'import_rawseed_hint'.tr(),
      controller: textEditingController,
      validator: _validateInput,
      onChanged: (final value) => changeAddressIconPreview(value, context),
    );
  }
}
