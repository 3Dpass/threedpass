import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:threedpass/core/theme/d3p_appbar_theme.dart';

class TitleNButtonAppBar extends PlatformAppBar {
  TitleNButtonAppBar({
    required final String titleText,
    required final Widget trailingAction,
    final bool translateAppbar = true,
    super.key,
  }) : super(
          automaticallyImplyLeading: false,
          backgroundColor: const D3pAppBarTheme().backgroundColor,
          cupertino: (final context, final platform) =>
              CupertinoNavigationBarData(padding: EdgeInsetsDirectional.zero),
          material: (final context, final platform) => MaterialAppBarData(
            titleSpacing: 0,
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Text(
                  translateAppbar ? titleText.tr() : titleText,
                  textAlign: TextAlign.start,
                  style: const TextStyle(color: Colors.white),
                ),
              ),
              trailingAction,
            ],
          ),
        );
}
