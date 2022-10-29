import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:threedpass/core/theme/d3p_special_colors.dart';
import 'package:threedpass/core/theme/d3p_special_styles.dart';

class CenterTextAppBar extends StatelessWidget {
  const CenterTextAppBar({
    Key? key,
    required this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return PlatformAppBar(
      title: Text(
        text,
        style: theme.customTextStyles.appBarTextBright,
      ),
      material: (final _, final __) => MaterialAppBarData(
        automaticallyImplyLeading: false,
        backgroundColor: theme.customColors.appBarBackground,
        foregroundColor: theme.customColors.appBarBackground,
        centerTitle: true,
      ),
      // TODO Check cupertino theme
      cupertino: (final _, final __) => CupertinoNavigationBarData(
        automaticallyImplyLeading: false,
        backgroundColor: theme.customColors.appBarBackground,
      ),
    );
  }
}
