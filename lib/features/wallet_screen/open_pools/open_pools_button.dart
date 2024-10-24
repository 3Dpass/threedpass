import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:threedpass/core/widgets/buttons/secondary_button.dart';
import 'package:threedpass/router/router.gr.dart';

class OpenPoolsButton extends StatelessWidget {
  const OpenPoolsButton({final Key? key}) : super(key: key);

  @override
  Widget build(final BuildContext context) {
    return D3pSecondaryButton(
      localizedTextKey: 'open_pools_label',
      iconData: Icons.explore_outlined,
      onPressed: () => unawaited(
        context.router.push(
          const PoolsRouteWrapper(),
        ),
      ),
    );
  }
}
