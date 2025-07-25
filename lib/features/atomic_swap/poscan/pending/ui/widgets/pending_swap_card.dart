import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/core/chains/bloc/current_account_cubit.dart';
import 'package:threedpass/core/chains/domain/entities/address.dart';
import 'package:threedpass/core/polkawallet/utils/balance_utils.dart';
import 'package:threedpass/core/utils/formatters.dart';
import 'package:threedpass/core/widgets/buttons/elevated_button.dart';
import 'package:threedpass/core/widgets/d3p_card.dart';
import 'package:threedpass/core/widgets/other/fast_rich_text.dart';
import 'package:threedpass/core/widgets/other/vertical_line_left_border.dart';
import 'package:threedpass/features/atomic_swap/poscan/common/domain/entities/raw_pending_poscan_atomic_swap_data.dart';
import 'package:threedpass/features/atomic_swap/poscan/pending/domain/entities/pending_poscan_atomic_swap.dart';
import 'package:threedpass/features/other/accounts_identity/account_idenity.dart';
import 'package:threedpass/features/other/link_to_page/entities/link_to_poscan_asset_page_params.dart';
import 'package:threedpass/features/other/link_to_page/ui/basic_link_to_page.dart';
import 'package:threedpass/features/poscan_assets/bloc/poscan_assets_cubit.dart';

part 'poscan_atomic_swap_action.dart';
part 'pending_poscan_atomic_swap_action_button.dart';

class PendingSwapCard extends StatelessWidget {
  const PendingSwapCard({
    required this.swap,
  });

  final PendingPoscanAtomicSwap swap;

  @override
  Widget build(final BuildContext context) {
    final currentAddress = BlocProvider.of<CurrentAccountCubit>(context)
        .state
        .value
        ?.nativeP3D
        .address;
    return D3pCard(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 8,
          children: [
            AccountIdentity(
              address: swap.from,
              prefix: 'From:',
              colorSecondary: currentAddress == swap.from,
            ),
            AccountIdentity(
              address: swap.to,
              prefix: 'To:',
              colorSecondary: currentAddress == swap.to,
            ),
            _PoscanAtomicSwapAction(action: swap.action),
            FastRichText(
              mainText: Formatters.shortDateFormat.format(swap.deadline),
              needSpace: true,
              secondaryText: 'Deadline:', // TODO localize
            ),
            if (currentAddress == swap.from || currentAddress == swap.to)
              Align(
                child: Padding(
                  padding: EdgeInsets.only(top: 16),
                  child: _PendingPoscanAtomicSwapActionButton(
                    swap: swap,
                    currentAddress: currentAddress!,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
