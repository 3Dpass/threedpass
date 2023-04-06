import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:threedpass/core/theme/d3p_appbar_theme.dart';

class D3pPlatformAppBar extends PlatformAppBar {
  D3pPlatformAppBar({
    required final String titleText,
    // required final BuildContext context,
    super.key,
    super.trailingActions,
    final Widget? leading,
    final bool translateAppbar = true,
  }) : super(
          automaticallyImplyLeading: false,
          leading: leading,
          title: Text(
            translateAppbar ? titleText.tr() : titleText,
            style: const TextStyle(color: Colors.white),
          ),
          backgroundColor: const D3pAppBarTheme().backgroundColor,
        );
}
