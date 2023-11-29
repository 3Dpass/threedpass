import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:polkawallet_sdk/storage/types/keyPairData.dart';
import 'package:threedpass/core/polkawallet/bloc/app_service_cubit.dart';
import 'package:threedpass/core/polkawallet/widgets/account_choose_tile_text.dart';
import 'package:threedpass/core/widgets/buttons/dropdown_button.dart';
import 'package:threedpass/core/widgets/paddings.dart';
import 'package:threedpass/core/widgets/text/d3p_body_medium_text.dart';
import 'package:threedpass/features/preview_page/bloc/d3prpc_cubit.dart';
import 'package:threedpass/features/wallet_screen/presentation/transfer_page/widgets/basic_password_text_field.dart';

class ChooseAccount extends StatelessWidget {
  const ChooseAccount({super.key});

  @override
  Widget build(final BuildContext context) {
    final cubit = BlocProvider.of<D3PRPCCubit>(context);

    final appService = BlocProvider.of<AppServiceLoaderCubit>(context).state;
    final accounts = appService.keyring.allAccounts;

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBoxH16(),
        const D3pBodyMediumText('d3rpc_subtitle_choose_account'),
        const SizedBoxH4(),
        D3pDropdownButton<KeyPairData>(
          context: context,
          isExpanded: true,
          items: accounts
              .map<DropdownMenuItem<KeyPairData>>(
                (final e) => DropdownMenuItem(
                  value: e,
                  child: AccountChooseTileText(
                    name: e.name,
                    address: e.address,
                  ),
                ),
              )
              .toList(),
          onChanged: (final obj) {},
          value: accounts.first,
        ),
        const SizedBoxH4(),
        BasicPasswordTextField(
          passwordController: cubit.accountPassword,
        ),
      ],
    );
  }
}
