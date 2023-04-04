import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:polkawallet_sdk/plugin/store/balances.dart';
import 'package:threedpass/core/widgets/buttons/elevated_button.dart';
import 'package:threedpass/core/widgets/d3p_scaffold.dart';
import 'package:threedpass/core/widgets/paddings.dart';
import 'package:threedpass/features/wallet_screen/presentation/non_native_token_screen/bloc/get_extrisincs_cubit.dart';
import 'package:threedpass/features/wallet_screen/presentation/non_native_token_screen/domain/entities/mapper_transfer_token_atom.dart';
import 'package:threedpass/features/wallet_screen/presentation/non_native_token_screen/domain/entities/transfer_non_native_token_atom.dart';
import 'package:threedpass/features/wallet_screen/presentation/widgets/transaction_item.dart';

part './widgets/non_native_tokens_list.dart';

class NonNativeTokenScreen extends StatelessWidget {
  final TokenBalanceData tokenData;

  const NonNativeTokenScreen(this.tokenData, {super.key});

  @override
  Widget build(BuildContext context) {
    return D3pScaffold(
      appbarTitle: 'Asset',
      body: Column(
        children: [
          Text(tokenData.amount!),
          D3pElevatedButton(
            text: 'Transfer',
            onPressed: () {},
          ),
          SizedBoxH36(),
          Text('History:'),
          SizedBoxH8(),
          _NonNativeTokensHistory(),
        ],
      ),
    );
  }
}
