import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:threedpass/core/theme/d3p_appbar_theme.dart';
import 'package:threedpass/core/theme/d3p_special_colors.dart';

class D3pPlatformAppBar extends PlatformAppBar {
  D3pPlatformAppBar({
    required final String titleText,
    // required final BuildContext context,
    super.key,
    super.trailingActions,
  }) : super(
          title: Text(
            titleText.tr(),
            style: const TextStyle(color: Colors.white),
          ),
          backgroundColor: const D3pAppBarTheme().backgroundColor,
        );
}
