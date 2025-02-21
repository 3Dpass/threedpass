import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:threedpass/features/other/card_with_buttons/card_with_buttons.dart';
import 'package:threedpass/features/other/card_with_buttons/fast_card_button.dart';
import 'package:threedpass/features/wallet_screen/assets_page/widgets/explore_pools_card_button.dart';
import 'package:threedpass/features/wallet_screen/assets_page/widgets/swap_button.dart';
import 'package:threedpass/router/router.gr.dart';

class LiquidityPoolButtons extends StatelessWidget {
  const LiquidityPoolButtons();

  @override
  Widget build(BuildContext context) {
    return CardWithButtons(
      title: 'liquidity_pools_buttons_panel_title',
      buttons: [
        ExplorePoolsCardButton(),
        SwapButton(),
        FastCardButton(
          iconData: Icons.add,
          title: 'liquidity_pools_buttons_panel_create_pool',
          onButtonPressed: () =>
              context.router.push(const CreatePoolRouteWrapper()),
        ),
      ],
    );
  }
}
