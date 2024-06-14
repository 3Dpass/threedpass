import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:threedpass/core/theme/d3p_special_colors.dart';
import 'package:threedpass/core/widgets/d3p_card.dart';
import 'package:threedpass/features/settings_page/presentation/widgets/default_settings_button.dart';
import 'package:threedpass/router/router.gr.dart';

class OpenPoolsButton extends StatelessWidget {
  const OpenPoolsButton({final Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final state = BlocProvider.of<PreviewPageCubit>(context).state;
    final colors = Theme.of(context).customColors;
    return DefaultSettingsButton.openButton(
      iconData: Icons.explore,
      iconColor: colors.themeOpposite,
      textValue: '',
      onPressed: () => context.router.push(const PoolsRouteWrapper()),
      text: 'open_pools_label',
      cardShape: CardShape.all,
      isChevronGrey: false,
    );
  }
}
