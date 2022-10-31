import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:threedpass/core/theme/d3p_special_colors.dart';

class AppBackButton extends StatelessWidget {
  const AppBackButton({final Key? key}) : super(key: key);

  @override
  Widget build(final BuildContext context) {
    return IconButton(
      padding: EdgeInsets.zero,
      icon: const BackButtonIcon(),
      color: Theme.of(context).customColors.appBarButton,
      tooltip: MaterialLocalizations.of(context).backButtonTooltip,
      onPressed: () => context.router.pop(),
    );
  }
}
