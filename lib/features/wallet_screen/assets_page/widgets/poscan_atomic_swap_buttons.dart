import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/core/chains/bloc/current_account_cubit.dart';
import 'package:threedpass/core/polkawallet/bloc/app_service_cubit.dart';
import 'package:threedpass/core/polkawallet/utils/decode_address.dart';
import 'package:threedpass/features/atomic_swap/poscan/pending/bloc/pending_atomic_swap_cubit.dart';
import 'package:threedpass/features/common/card_with_buttons/card_button.dart';
import 'package:threedpass/features/common/card_with_buttons/card_with_buttons.dart';
import 'package:threedpass/features/poscan_assets/bloc/poscan_assets_cubit.dart';
import 'package:threedpass/router/router.gr.dart';
import 'package:threedpass/setup.dart';

class PoscanAtomicSwapButtons extends StatelessWidget {
  const PoscanAtomicSwapButtons();

  @override
  Widget build(BuildContext context) {
    return CardWithButtons(
      title: 'poscan_atomic_swap_buttons_panel_title',
      buttons: [
        _CreateSwapButton(),
        _PendingPoscanSwapsButton(),
        // CardButton.icon(
        //   iconData: Icons.system_update_alt_rounded,
        //   title: 'poscan_atomic_swap_buttons_panel_claim_swap',
        //   onButtonPressed: () =>
        //       context.router.push(ClaimAtomicSwapRouteWrapper()),
        // ),
        // CardButton.icon(
        //   iconData: Icons.cancel,
        //   title: 'poscan_atomic_swap_buttons_panel_cancel_swap',
        //   onButtonPressed: () =>
        //       context.router.push(CancelAtomicSwapRouteWarpper()),
        // ),
        CardButton.icon(
          iconData: Icons.bug_report,
          title: 'DEBUG',
          onButtonPressed: () async {
            final state = getIt<AppServiceLoaderCubit>().state;
            final address = state.keyring.current.address;
            final decoded = await state.decodeAddress(address!);
            print(decoded);
          },
        ),
      ],
    );
  }
}

class _CreateSwapButton extends StatelessWidget {
  const _CreateSwapButton();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PoscanAssetsCubit, PoscanAssetsState>(
      builder: (final context, final poscanAssetsState) => CardButton.icon(
        iconData: Icons.swap_vert_circle,
        title: 'poscan_atomic_swap_buttons_panel_create_swap',
        isLoading: poscanAssetsState.isLoading,
        onButtonPressed:
            poscanAssetsState.isLoading || poscanAssetsState.assets.isEmpty
                ? null
                : () => context.router.push(CreateSwapRouteWapper()),
      ),
    );
  }
}

class _PendingPoscanSwapsButton extends StatelessWidget {
  const _PendingPoscanSwapsButton();

  @override
  Widget build(BuildContext context) {
    final pendingSwaps = context.watch<PendingAtomicSwapCubit>().state;
    final nativeAddr =
        context.watch<CurrentAccountCubit>().state.value?.nativeP3D.address ??
            'impossible_addrress';
    final pendingSwapsLen =
        pendingSwaps.value?.relatedToAcc(nativeAddr).length ?? 0;
    final isLoading = pendingSwaps.isLoading;
    return CardButton.icon(
      iconData: Icons.pending,
      title: 'poscan_atomic_swap_buttons_panel_pending_swaps',
      isLoading: isLoading,
      onButtonPressed: isLoading
          ? null
          : () => context.router.push(PendingAtomicSwapRouteWrapper()),
      badge: pendingSwapsLen > 0 ? pendingSwapsLen : null,
    );
  }
}
