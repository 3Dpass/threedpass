import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/features/chains/bloc/current_account_cubit.dart';
import 'package:threedpass/features/chains/domain/entities/address.dart';
import 'package:threedpass/core/utils/formatters.dart';
import 'package:threedpass/core/widgets/buttons/elevated_button.dart';
import 'package:threedpass/core/widgets/d3p_card.dart';
import 'package:threedpass/core/widgets/other/fast_rich_text.dart';
import 'package:threedpass/features/atomic_swap/poscan/common/ui/hash_proof_text.dart';
import 'package:threedpass/features/atomic_swap/poscan/pending/bloc/swap_in_progress.dart';
import 'package:threedpass/features/atomic_swap/poscan/pending/domain/entities/pending_poscan_atomic_swap.dart';
import 'package:threedpass/features/atomic_swap/poscan/pending/ui/widgets/poscan_atomic_swap_action.dart';
import 'package:threedpass/features/common/accounts_identity/account_idenity.dart';
import 'package:threedpass/features/wallet_screen/notifications_page/bloc/notifications_bloc.dart';
import 'package:threedpass/router/router.gr.dart';

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
              prefix: 'address_from_prefix'.tr(),
              colorSecondary: currentAddress == swap.from,
            ),
            AccountIdentity(
              address: swap.to,
              prefix: 'address_to_prefix'.tr(),
              colorSecondary: currentAddress == swap.to,
            ),
            HashProofText(swap: swap),
            PoscanAtomicSwapAction(action: swap.action),
            FastRichText(
              mainText: Formatters.shortDateFormat.format(swap.deadline),
              needSpace: true,
              secondaryText: 'deadline_prefix'.tr(),
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
