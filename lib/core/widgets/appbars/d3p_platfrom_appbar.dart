import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:threedpass/core/theme/d3p_special_colors.dart';

class D3pPlatformAppBar extends PlatformAppBar {
  D3pPlatformAppBar({
    super.key,
    required String titleText,
  }) : super(
          title: Text(
            titleText.tr(),
            style: const TextStyle(color: Colors.white),
          ),
        );
}
