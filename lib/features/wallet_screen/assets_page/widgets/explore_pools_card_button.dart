import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:threedpass/features/other/card_with_buttons/fast_card_button.dart';
import 'package:threedpass/router/router.gr.dart';

class ExplorePoolsCardButton extends StatelessWidget {
  const ExplorePoolsCardButton({final Key? key}) : super(key: key);

  @override
  Widget build(final BuildContext context) {
    return FastCardButton(
      iconData: Icons.explore_outlined,
      title: 'open_pools_label',
      onButtonPressed: () => context.router.push(
        const PoolsRouteWrapper(),
      ),
    );
  }
}
