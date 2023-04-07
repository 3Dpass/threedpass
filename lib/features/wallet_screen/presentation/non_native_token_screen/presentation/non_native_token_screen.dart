import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:polkawallet_sdk/plugin/store/balances.dart';
import 'package:threedpass/core/widgets/buttons/elevated_button.dart';
import 'package:threedpass/core/widgets/d3p_scaffold.dart';
import 'package:threedpass/core/widgets/paddings.dart';
import 'package:threedpass/features/wallet_screen/presentation/non_native_token_screen/bloc/assets_get_extrisincs_cubit.dart';
import 'package:threedpass/features/wallet_screen/presentation/non_native_token_screen/domain/entities/transfer_non_native_token_atom.dart';
import 'package:threedpass/features/wallet_screen/presentation/non_native_token_screen/presentation/widgets/non_native_tokens_list_item.dart';
import 'package:threedpass/features/wallet_screen/presentation/widgets/transaction_item.dart';

part './widgets/non_native_tokens_list.dart';

class NonNativeTokenScreen extends StatelessWidget {
  const NonNativeTokenScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final symbol = BlocProvider.of<AssetsGetExtrinsicsCubit>(context)
            .getExtrinsics
            .params
            .tokenBalanceData
            .symbol ??
        '';
    return D3pScaffold(
      appbarTitle: 'non_native_token_token'.tr(args: [symbol]),
      translateAppbar: false,
      body: Column(
        children: [
          SizedBoxH24(),
          Text('1'),
          SizedBoxH24(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: D3pElevatedButton(
              text: 'Transfer coming soon',
              // onPressed: () {},
            ),
          ),
          SizedBoxH36(),
          Text('History:'),
          SizedBoxH8(),
          Flexible(
            child: _NonNativeTokensHistory(),
          ),
        ],
      ),
    );
  }
}
