import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:threedpass/core/chains/domain/entities/key_pair.dart';
import 'package:threedpass/core/polkawallet/bloc/app_service_cubit.dart';
import 'package:threedpass/core/polkawallet/widgets/account_choose_tile_text.dart';
import 'package:threedpass/core/widgets/buttons/dropdown_button.dart';
import 'package:threedpass/core/widgets/text/d3p_body_medium_text.dart';
import 'package:threedpass/features/wallet_screen/transfer_page/widgets/basic_password_text_field.dart';
import 'package:threedpass/setup.dart';

class ChooseNativeKeypair extends StatelessWidget {
  final KeyPair? value;
  final void Function(KeyPair?)? onSelected;
  final TextEditingController passwordController;
  final List<KeyPair> accounts;

  ChooseNativeKeypair({
    required this.onSelected,
    required this.value,
    required this.passwordController,
    final List<KeyPair>? pAccounts,
  }) : this.accounts = pAccounts ??
            getIt<AppServiceLoaderCubit>()
                .state
                .keyring
                .allAccounts
                .map<KeyPair>((e) => KeyPair(
                    name: e.name, address: e.address!, pubKey: e.pubKey!))
                .toList();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 4,
      children: [
        D3pBodyMediumText('sign_extrinsic_with_this_account'),
        D3pDropdownButton<KeyPair>(
          items: accounts
              .map<DropdownMenuItem<KeyPair>>(
                (final e) => DropdownMenuItem(
                  value: e,
                  child: AccountChooseTileText(
                    address: e.address,
                    name: e.name,
                  ),
                ),
              )
              .toList(),
          onChanged: onSelected,
          value: value,
          isExpanded: true,
          validator: (final value) =>
              value == null ? 'account_never_null'.tr() : null,
        ),
        BasicPasswordTextField(passwordController: passwordController),
      ],
    );
  }
}
