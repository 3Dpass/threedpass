import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:threedpass/features/other/card_with_buttons/card_with_buttons.dart';
import 'package:threedpass/features/other/card_with_buttons/fast_card_button.dart';
import 'package:threedpass/router/router.gr.dart';

class PoscanAtomicSwapButtons extends StatelessWidget {
  const PoscanAtomicSwapButtons();

  @override
  Widget build(BuildContext context) {
    return CardWithButtons(
      title: 'poscan_atomic_swap_buttons_panel_title',
      buttons: [
        FastCardButton(
          iconData: Icons.swap_vert_circle,
          title: 'poscan_atomic_swap_buttons_panel_create_swap',
          onButtonPressed: () => context.router.push(CreateSwapRouteWapper()),
        ),
        FastCardButton(
          iconData: Icons.pending,
          title: 'poscan_atomic_swap_buttons_panel_pending_swaps',
          onButtonPressed: () =>
              context.router.push(PendingAtomicSwapRouteWrapper()),
        ),
        FastCardButton(
          iconData: Icons.system_update_alt_rounded,
          title: 'poscan_atomic_swap_buttons_panel_claim_swap',
          onButtonPressed: () =>
              context.router.push(ClaimAtomicSwapRouteWrapper()),
        ),
        FastCardButton(
          iconData: Icons.cancel,
          title: 'poscan_atomic_swap_buttons_panel_cancel_swap',
          onButtonPressed: () =>
              context.router.push(CancelAtomicSwapRouteWarpper()),
        ),
      ],
    );
  }
}
