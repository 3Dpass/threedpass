import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:share_plus/share_plus.dart';
import 'package:threedpass/core/theme/d3p_appbar_theme.dart';
import 'package:threedpass/core/theme/d3p_special_colors.dart';
import 'package:threedpass/core/theme/d3p_special_styles.dart';
import 'package:threedpass/features/hashes_list/domain/entities/hash_object.dart';
import 'package:threedpass/features/hashes_list/domain/entities/snapshot.dart';

class PreviewAppBar extends PlatformAppBar {
  PreviewAppBar({
    required final Snapshot snapshot,
    required final ThemeData themeData,
    required final BuildContext context,
    final Key? key,
    final HashObject? hashObject,
  }) : super(
          key: key,
          backgroundColor: const D3pAppBarTheme().backgroundColor,
          material: (final _, final __) => MaterialAppBarData(
            titleSpacing: 0,
          ),
          title: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              PlatformIconButton(
                padding: EdgeInsets.zero,
                icon: Icon(
                  _getIconData(),
                  color: themeData.customColors.appBarButton,
                ),
                onPressed: () => context.router.pop(),
              ),
              hashObject != null
                  ? Flexible(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 16),
                        child: Text(
                          hashObject.name,
                          overflow: TextOverflow.ellipsis,
                          style: themeData.customTextStyles.appBarTextBright,
                        ),
                      ),
                    )
                  : Text(
                      'get_new_object_appbar'.tr(),
                      style: themeData.customTextStyles.appBarTextBright,
                    ),
              PlatformIconButton(
                padding: EdgeInsets.zero,
                icon: Icon(
                  Icons.share,
                  color: themeData.customColors.appBarButton,
                ),
                onPressed: () => Share.share(snapshot.shareText),
              ),
            ],
          ),
        );

  static IconData _getIconData() {
    final platform = defaultTargetPlatform;
    switch (platform) {
      case TargetPlatform.android:
      case TargetPlatform.fuchsia:
      case TargetPlatform.linux:
      case TargetPlatform.windows:
        return Icons.arrow_back;
      case TargetPlatform.iOS:
      case TargetPlatform.macOS:
        return Icons.arrow_back_ios;
    }
  }
}
