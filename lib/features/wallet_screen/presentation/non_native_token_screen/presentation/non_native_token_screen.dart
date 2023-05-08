import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:threedpass/core/polkawallet/utils/balance_utils.dart';
import 'package:threedpass/core/theme/d3p_special_styles.dart';
import 'package:threedpass/core/widgets/buttons/elevated_button.dart';
import 'package:threedpass/core/widgets/d3p_scaffold.dart';
import 'package:threedpass/core/widgets/paddings.dart';
import 'package:threedpass/core/widgets/text/d3p_body_large_text.dart';
import 'package:threedpass/core/widgets/text/d3p_body_medium_text.dart';
import 'package:threedpass/core/widgets/text/d3p_title_large_text.dart';
import 'package:threedpass/features/wallet_screen/presentation/non_native_token_screen/bloc/assets_get_extrisincs_cubit.dart';
import 'package:threedpass/features/wallet_screen/presentation/non_native_token_screen/domain/entities/asset_history_create.dart';
import 'package:threedpass/features/wallet_screen/presentation/non_native_token_screen/domain/entities/asset_history_mint.dart';
import 'package:threedpass/features/wallet_screen/presentation/non_native_token_screen/domain/entities/asset_history_set_meta_data.dart';
import 'package:threedpass/features/wallet_screen/presentation/non_native_token_screen/domain/entities/asset_history_transfer.dart';
import 'package:threedpass/features/wallet_screen/presentation/non_native_token_screen/domain/entities/asset_history_unknown.dart';
import 'package:threedpass/features/wallet_screen/presentation/non_native_token_screen/domain/entities/transfer_non_native_token_atom.dart';
import 'package:threedpass/features/wallet_screen/presentation/widgets/asset_balance_text.dart';
import 'package:threedpass/features/wallet_screen/presentation/widgets/block_datetime_w.dart';
import 'package:threedpass/features/wallet_screen/presentation/widgets/extrinsic_status_icon.dart';
import 'package:threedpass/features/wallet_screen/presentation/widgets/transaction_item.dart';

import '../../widgets/short_address.dart';

part 'widgets/assets_history_paged_list.dart';
part './widgets/no_history_found.dart';
part './widgets/asset_history_create_widget.dart';
part './widgets/asset_history_mint_widget.dart';
part './widgets/asset_history_set_metadata_widget.dart';
part './widgets/asset_history_unknown_widget.dart';
part './widgets/asset_history_list_item.dart';

class NonNativeTokenScreen extends StatelessWidget {
  const NonNativeTokenScreen({super.key});

  @override
  Widget build(final BuildContext context) {
    final tkb = BlocProvider.of<AssetsGetExtrinsicsCubit>(context)
        .getExtrinsics
        .paramsUseCase
        .tokenBalanceData;
    final symbol = tkb.symbol ?? '';
    return D3pScaffold(
      appbarTitle: 'non_native_token_token'.tr(args: [symbol]),
      translateAppbar: false,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBoxH24(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AssetBalanceText(
                balance: BalanceUtils.balance(
                  tkb.amount,
                  tkb.decimals ?? 12,
                ),
                tokenSymbol: symbol,
              ),
            ],
          ),
          const SizedBoxH24(),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: D3pElevatedButton(
              text: 'Transfer coming soon',
              // onPressed: () {},
            ),
          ),
          const SizedBoxH36(),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: D3pTitleLargeText('non_native_history_title_label'),
          ),
          const SizedBoxH8(),
          Flexible(
            child: _AssetsHistoryPagetList(),
          ),
        ],
      ),
    );
  }
}
