import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:threedpass/core/theme/d3p_special_styles.dart';
import 'package:threedpass/core/widgets/appbars/common_appbar.dart';

class CommonLogoAppbar extends CommonAppbar {
  CommonLogoAppbar({
    required final String title,
    required final ThemeData theme,
    final Key? key,
    final List<Widget>? actions,
  }) : super(
          theme: theme,
          key: key,
          titleSpacing: 0,
          title: SizedBox(
            height: kToolbarHeight,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(width: 16),
                Text('appTitle'.tr(), style: theme.customTextStyles.appTitle),
                const SizedBox(width: 4),
                Text(
                  title,
                  textAlign: TextAlign.end,
                  style: theme.customTextStyles.appBarText,
                ),
              ],
            ),
          ),
          actions: actions,
        );
}
