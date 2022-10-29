import 'package:flutter/material.dart';
import 'package:threedpass/core/theme/d3p_special_colors.dart';

class CommonAppbar extends AppBar {
  CommonAppbar({
    required final Widget title,
    required final ThemeData theme,
    final double? titleSpacing,
    final List<Widget>? actions,
    final Key? key,
  }) : super(
          key: key,
          backgroundColor: theme.customColors.appBarBackground,
          titleSpacing: titleSpacing ?? 16,
          title: title,
          automaticallyImplyLeading: false,
          actions: actions,
        );
}
